image_jpeg = imread('1.jpg');
image_png = imread('2.png');
image_tiff = imread('3.tiff');

% Обчислення гістограми для кожного зображення
hist_jpeg = imhist(image_jpeg);
hist_png = imhist(image_png);
hist_tiff = imhist(image_tiff);

% Відображення гістограм на одному графіку
figure;

subplot(2, 2, 1);
bar(hist_jpeg);
title('Гістограма - JPEG');

subplot(2, 2, 2);
bar(hist_png);
title('Гістограма - PNG');

subplot(2, 2, 4);
bar(hist_tiff);
title('Гістограма - TIFF');