function [] = generate_results(filename, reduceAmt, reduceWhat)
    img = imread(filename);
    newImage = img;
    standardImage = img;
    numOfOrigImgRows = size(img, 1);
    numOfOrigImgCols = size(img, 2);
    if (strcmp(reduceWhat, 'WIDTH'))
        standardImage = imresize(img, [numOfOrigImgRows, numOfOrigImgCols - reduceAmt]);
        for i=1:reduceAmt
            if (i == 1)
                newImage = reduceWidth(newImage, 1);
            else
                newImage = reduceWidth(newImage, 0);
            end
        end
    elseif (strcmp(reduceWhat, 'HEIGHT'))
        standardImage = imresize(img, [numOfOrigImgRows - reduceAmt, numOfOrigImgCols]);
        for i=1:reduceAmt
            if (i == 1)
                newImage = reduceHeight(newImage, 1);
            else
                newImage = reduceHeight(newImage, 0);
            end
        end
    end
    
    figure('Name', 'Reduce Height by 600');
    subplot(1, 3, 1)
    imshow(img);
    title('Original');
    
    subplot(1, 3, 2)
    imshow(newImage);
    title('Content-aware');
    
    subplot(1, 3, 3)
    imshow(standardImage);
    title('Standard');
    
    figure;
    imshow(newImage);
    saveas(gcf, 'mall_width_reduced.png');
end

