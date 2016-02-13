function [varargout] = iAmp_import_v24(varargin) % varargout: [NoCha, data, time, fs]

%DESCRIPTION:
% Converts a binary file recorded with the data logger iAmp into decimals
% and saves time points and amplitudes in a .mat-file
%
%INPUT:
% String        FileName        name of the file, input via gui
% String        PathName        location of the file, input via gui
%
%OUTPUT:    stored in file the the same file-name as input, diff. extension
% Double        NoCha           number of recorded channels
% Double array  data (NxNoCha)  potentials of all channels
% Double array  time (1xN)      times of sampling points (in s)
% Integer       fs              sampling frequency (in Hz)
% String        version_conv    version of iAmp_import used for conversion
%
%AUTHOR
% Wilhelm, Apit
%
%VERSION 2.4,   09.02.2015
% similar to 2.2 (76 s for an 8 hour recording) and multiple inputs possible
% all possible headers recognised (low power mode still not implemented)
% convert
% plot raw signal
% add data to base workspace

%%% Possible additions:
%%%  Low power mode is not implemented yet, only the headers are recognised

if nargin > 0
    switch varargin{1}
        case {'fi', 'fil', 'file'}
            [FileName,PathName] = uigetfile({'*.bin';'*.m';'*.mat';'*.*'},'File Selector');
            files{1} = [PathName, FileName];
        case {'fo', 'fol', 'folder'}
            PathName = uigetdir;
            ident = '*';
            filetype = 'BIN';
            fils = dir(strcat(PathName,'\','*',ident,'*',filetype));
            for ii = 1:length(fils); files{ii} = [PathName, '\', fils(ii).name]; end;
        otherwise
            files{1} = varargin{1};
    end
else
    [FileName,PathName] = uigetfile({'*.bin', 'iAmp files (*.bin)' ; '*.mat', 'MATLAB (*.mat)'; '*.*', 'All files (*.*)'},'File Selector');
    % FileName = 'RAW(1).BIN';
    % PathName = 'D:\OneDrive\iAmp\example files with format 2\';
    files{1} = [PathName, FileName];
end

if FileName==0
    error('No file chosen');
end

tic

for f = files;
    file = f{1};
    
    fileID  = fopen(file);
    head    = fread(fileID,8,'int8');
    head_2  = num2str(dec2bin(2^8+head));
    head_3  = head_2(:,end-7:end);
    head_3([3 4, 5 6 7 8],:)  = head_3([4 3, 8 7 6 5], :); % little-endian format
    head_4  = reshape(head_3',8*8,1)';
    % fclose(fileID);
    q = quantizer([24 0]);
    
    head_mode   = bin2num(q,head_4(1:8));
    NoCha       = bin2num(q,head_4(9:16));
    head_over   = bin2num(q,head_4(17:32))-32768;
    head_time   = bin2num(q,head_4(33:64));
    
    switch head_mode
        case 128 % 0x80, HIGH_RES_32K_SPS
            fs  = 32000; % sampling frequency of 32K
            res = 24; % ADC resolution, default: 24 bit
        case 129 % 0x81, HIGH_RES_16K_SPS
            fs  = 16000; % sampling frequency of 16K
            res = 24; % ADC resolution, default: 24 bit
        case 130 % 0x82, HIGH_RES_4K_SPS
            fs  = 8000; % sampling frequency of 8K
            res = 24; % ADC resolution, default: 24 bit
        case 131 % 0x83, HIGH_RES_4K_SPS
            fs  = 4000; % sampling frequency of 4K
            res = 24; % ADC resolution, default: 24 bit
        case 132 % 0x84, HIGH_RES_2K_SPS
            fs  = 2000; % sampling frequency of 2K
            res = 24; % ADC resolution, default: 24 bit
        case 133 % 0x85, HIGH_RES_1K_SPS
            fs  = 1000; % sampling frequency of 1000
            res = 24; % ADC resolution, default: 24 bit
        case 134 % 0x86, HIGH_RES_500_SPS
            fs  = 500; % sampling frequency of 1000
            res = 24; % ADC resolution, default: 24 bit
        case 0 % 0x00, LOW_RES_16K_SPS
            fs  = 16000; % sampling frequency of 16K
            res = 16; % ADC resolution, 16 bit
        case 1 % 0x01, LOW_RES_8K_SPS
            fs  = 8000; % sampling frequency of 8K
            res = 16; % ADC resolution, 16 bit
        case 2 % 0x02, LOW_RES_4K_SPS
            fs  = 4000; % sampling frequency of 4K
            res = 16; % ADC resolution, 16 bit
        case 3 % 0x03, LOW_RES_2K_SPS
            fs  = 2000; % sampling frequency of 2K
            res = 16; % ADC resolution, 16 bit
        case 4 % 0x04, LOW_RES_1K_SPS
            fs  = 1000; % sampling frequency of 1K
            res = 16; % ADC resolution, 16 bit
        case 5 % 0x05, LOW_RES_500_SPS
            fs  = 200; % sampling frequency of 500
            res = 16; % ADC resolution, 16 bit
        case 6 % 0x06, LOW_RES_250_SPS
            fs  = 250; % sampling frequency of 250
            res = 16; % ADC resolution, 16 bit
        otherwise
            error('Header format not recognised.')
    end
    
    if res == 26
        error('Low power mode not implemented yet.')
    end
    
    frewind(fileID)
    A       = char(fread(fileID,inf)).'; % fclose(fid);
    LeBlo   = 512; % number of bytes in each block
    LeHea   = 8; % length of the header in byte
    NoBlo   = length(A)/LeBlo;
    NoSBl   = floor((LeBlo-LeHea)/3/NoCha); % number of subblocks (samples in one big block of 512)
    NoSam   = NoBlo*NoSBl;
    dataS   = char(zeros(round(NoSam),NoCha*24));
    data    = -1*ones(size(dataS,1),NoCha);
    
    frewind(fileID);
    c = fread(fileID,LeBlo*NoBlo,'int8');
    fclose(fileID);
    
    disp(['Loading and reading the header: ', num2str(toc)])
    c = reshape(c,512,NoBlo);
    % Read-in one block, but skip the first eight bytes
    % One block consists of NoSBl sampling points with 3*NoCha bytes each:
    % First dimension: data of all channels at one point in time,
    % Second dimension: time points in one block
    % Third dimension: blocks of 512 bytes
    e = reshape(c(9:(NoSBl*NoCha*3+8),:), NoCha*3, NoSBl, NoBlo);
    % Convert each byte into a binary number:
    e_bin_temp2 = num2str(dec2bin(2^8+e));
    % Keep the last 8 bits of the binary number (one extra bit can result
    % from the conversion):
    f_bin_temp2 = e_bin_temp2(:,end-7:end);
    % (NoCha*3) rows have information all channels at one time point,
    % concatenate blocks of (NoCha*3) rows, where 3*8 bits contain the
    % information of one channel at one point in time; there
    % are NoSBl sampling points per block:
    g_bin_temp2 = reshape(f_bin_temp2',NoCha*3*8,NoSBl*NoBlo)';
    % Add concatenated values of all channels to database for the whole
    % measurement
    dataS = g_bin_temp2;
    
    disp(['Binaries read and rearranged:   ', num2str(toc)])
    
    % Convert binary data for all channels into decimal data (24 is the length
    % of one voltage in binary representation)
    for j = 1:NoCha
        data(:,j) = bin2num(q,dataS(:,(j-1)*24+1:j*24));
    end
    
    disp(['Binaries converted to decimals: ', num2str(toc)])
    
    % Create time-axis:
    time = (1:size(data,1))/fs;
    
    version_conv = 'v24';
    
    if exist('FileName', 'var')
        save_file = [FileName(1:end-4),'.mat'];
    else
        save_file = 'data.mat';
    end
    
    [save_file,save_folder] = uiputfile(save_file, 'Select File to Write');
    
    save([save_folder, save_file], 'data', 'time', 'fs', 'NoCha', 'version_conv');
    disp(['Saving complete after:          ', num2str(toc)])
    
end

if nargout > 0
    varargout{1} = NoCha;
    varargout{2} = data;
    varargout{3} = time;
    varargout{4} = fs;
else
    varargout = {};
end

for j = 1:NoCha
    figure; plot(time, data(:,1));
    title('raw signal');
    xlabel('Time (in seconds)');
    zoom on;
end

assignin('base', 'NoCha', NoCha);
assignin('base', 'data', data);
assignin('base', 'time', time);
assignin('base', 'fs', fs);

end