function [] = export(inputName)
    set(gcf,'color','w');

    axesHandles = get(gcf,'children');
    axesHandles = findall(0,'type','axes');
    set(axesHandles,'TickDir','out');
    set(axesHandles,'Box','off');
    cleanfigure;
    
    
    matlab2tikz(['../report/matlabimages/' inputName '.tikz']);
end