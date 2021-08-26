im1 = rgb2gray(imread('woman_happy.png'));
im1 = imresize(im1, [512, 512]);
im1_blur = imgaussfilt(im1, 10, 'FilterSize', 31);

im2 = rgb2gray(imread('woman_happy.png'));
im2 = imresize(im2, [512, 512]);
im2_blur = imgaussfilt(im2, 10, 'FilterSize', 31);

im2_detail = im2 - im2_blur;
final_image = im1_blur + im2_detail;
imshow(final_image);

saveas(gcf, 'hybrid.png');