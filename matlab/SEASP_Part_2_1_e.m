clear all
close all

[X,R] = corrmtx(x,14,'mod');
[S,F] = pmusic(R,2,[ ],1,'corr');
plot(F,S,'linewidth',2);
set(gca,'xlim',[0.25 0.40]);
grid on; xlabel('Hz');
ylabel('Pseudospectrum');
nnnnn