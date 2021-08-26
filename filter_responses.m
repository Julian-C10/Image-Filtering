%% 3 and 4
F = makeLMfilters;
filenames = ["cardinal1.jpg" "cardinal2.jpg" "leopard1.jpg" "leopard2.jpg" "panda1.jpg" "panda2.jpg"];
images = cell(1, 6);

for i=1:size(F, 3)
    currFilter = F(:, :, i);
    subplot(2, 4, 1)
    imagesc(currFilter);
    title('Filter');
    
    for j=1:size(filenames, 2)
       img = imread(filenames(j));
       img = rgb2gray(img);
       images{j} = imresize(img, [100, 100]);
       computedCross = imfilter(images{j}, currFilter);
       
       subplot(2, 4, j + 2);
       imagesc(computedCross);
       title(filenames(j));
       saveas (gcf, strcat('responses_to_filter_', num2str(i), '.png'));
    end
end