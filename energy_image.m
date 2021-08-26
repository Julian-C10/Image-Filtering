function [energyImage, Ix, Iy] = energy_image(im)
    GRAY = rgb2gray(im);
    filter = fspecial('prewitt');
    
   
%     [gx, gy] = imgradientxy(GRAY);
    Ix = imfilter(GRAY, filter', 'replicate', 'conv');
    Iy = imfilter(GRAY, filter, 'replicate', 'conv');
    
    Ix = im2double(Ix);
    Iy = im2double(Iy);
    
    number = Ix.^2 + Ix.^2;
    energyImage = sqrt(number);
end

