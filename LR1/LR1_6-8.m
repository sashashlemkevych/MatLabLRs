% Завантаження зображень
image_jpeg = imread('1.jpg');
image_png = imread('2.png');
image_tiff = imread('3.tiff');

%------------------------------Виконання контрастування для кожного каналу кольору RGB
adjusted_jpeg = zeros(size(image_jpeg));
for i = 1:3
    adjusted_jpeg(:, :, i) = imadjust(image_jpeg(:, :, i));
end

adjusted_png = zeros(size(image_png));
for i = 1:3
    adjusted_png(:, :, i) = imadjust(image_png(:, :, i));
end

adjusted_tiff = zeros(size(image_tiff));
for i = 1:3
    adjusted_tiff(:, :, i) = imadjust(image_tiff(:, :, i));
end

%------------------------------Створення негативу для зображення------------------------------------------%

negative_jpeg = imcomplement(image_jpeg);

%-----------------------Відображення оригінальних, контрастованих та негативних зображень-----------------%

figure;

subplot(2, 2, 1);
imshow(image_jpeg);
title('Оригінальне - JPEG');

subplot(2, 2, 2);
imshow(adjusted_jpeg);
title('Контрастоване - JPEG');

subplot(2, 2, 2);
imshow(negative_jpeg);
title('Негатив - JPEG');

subplot(2, 2, 3);
imshow(image_png);
title('Оригінальне - PNG');

subplot(2, 2, 4);
imshow(adjusted_png);
title('Контрастоване - PNG');


