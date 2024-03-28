
image_jpeg = imread('1.jpg');
info_jpeg = imfinfo('1.jpg');
% Виведення інформації про зображення у форматі JPEG
disp('Інформація про зображення у форматі JPEG:');
disp(info_jpeg);

image_png = imread('2.png');
info_png = imfinfo('2.png');
disp('Інформація про зображення у форматі PNG:');
disp(info_png);

image_tiff = imread('3.tiff');
info_tiff = imfinfo('3.tiff');
disp('Інформація про зображення у форматі TIFF:');
disp(info_png);