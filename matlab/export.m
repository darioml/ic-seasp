function [] = export(inputName)
    set(gca,'TickDir','out');
    set(gca,'Box','off');
    set(gcf,'color','w');

    
    cleanfigure;
    
    
    matlab2tikz(['../report/matlabimages/' inputName '.tikz']);
end