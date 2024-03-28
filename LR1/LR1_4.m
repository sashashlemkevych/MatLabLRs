image_jpeg = imread('1.jpg');
save_directory = 'D:\STUDY\CHNU\5 year\2 term\Saved photos\';
% Збереження зображення у форматі JPEG в заданому каталозі
imwrite(image_jpeg, fullfile(save_directory, 'saved_1.jpg'));

image_png = imread('2.png');
save_directory = 'D:\STUDY\CHNU\5 year\2 term\Saved photos\';
imwrite(image_png, fullfile(save_directory, 'saved_2.png'));

image_tiff = imread('3.tiff');
save_directory = 'D:\STUDY\CHNU\5 year\2 term\Saved photos\';
imwrite(image_tiff, fullfile(save_directory, 'saved_3.tiff'));