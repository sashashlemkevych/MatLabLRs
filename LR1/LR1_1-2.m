% Завантаження та відображення зображення у форматі JPEG
image_jpeg = imread('1.jpg');
info_jpeg = imfinfo('1.jpg');

figure;
subplot(2, 2, 1);
imshow(image_jpeg);
title('JPEG Image');

% Виведення інформації про зображення у форматі JPEG
disp('Інформація про зображення у форматі JPEG:');
disp(info_jpeg);

% Завантаження та відображення зображення у форматі PNG
image_png = imread('2.png');
subplot(2, 2, 2);
imshow(image_png);
title('PNG Image');

% Завантаження та відображення зображення у форматі TIFF
image_tiff = imread('3.tiff');
subplot(2, 2, 4);
imshow(image_tiff);
title('TIFF Image');

