% Завантаження тестового зображення
originalImage = imread('1.jpg');

% Відображення вихідного зображення
figure;
subplot(2, 2, 1);
imshow(originalImage);
title('Вихідне зображення');

% Параметри для перекручення
LEN = 30;
THETA = 45;

% Перекручення зображення
rotatedImage = imrotate(originalImage, THETA, 'bilinear', 'crop');

% Відображення перекрученого зображення

subplot(2, 2, 2);
imshow(rotatedImage);
title('Перекручене зображення');

% Процедура відновлення зображення
recoveredImage = imrotate(rotatedImage, -THETA, 'bilinear', 'crop');

% Відображення відновленого зображення
subplot(2, 2, 3);
imshow(recoveredImage);
title('Відновлене зображення');

% Зашумлення початкового зображення
noisyImage = imnoise(originalImage, 'salt & pepper', 0.02);

% Відображення зашумленого зображення
subplot(2, 2, 4);
imshow(noisyImage);
title('Зашумлене зображення');

%7

% Параметри для перекручення
LEN = 30;
THETA = 45;

% Перекручення зображення
rotatedImage = imrotate(noisyImage, THETA, 'bilinear', 'crop');

% Відображення перекрученого зображення
figure;
subplot(2, 2, 1);
imshow(rotatedImage);
title('Перекручене зображення');

% Процедура відновлення зображення
recoveredImage = imrotate(rotatedImage, -THETA, 'bilinear', 'crop');

% Відображення відновленого зображення
subplot(2, 2, 2);
imshow(recoveredImage);
title('Відновлене зображення');
