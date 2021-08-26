function[] = displaySeam (im, seam, seamDirection)
    dim = 1:size(seam, 1);
    hold on
    
    if (strcmp(seamDirection, 'HORIZONTAL'))
        plot(dim, seam, 'Color', 'r');

    elseif (strcmp(seamDirection, 'VERTICAL'))
        plot(seam, dim, 'Color', 'r');
    end
    
    saveas(gcf, 'mall_energy.png');
    hold off
end

