function [] = export(inputName)
    set(gca,'TickDir','out');
    set(gca,'Box','off');

    
    cleanfigure;
    
    
    matlab2tikz(['../report/matlabimages/' inputName '.tikz']);
end