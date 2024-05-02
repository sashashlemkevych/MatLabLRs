% Завантаження зображень
img_color_1 = imread('1.jpg');
img_color_2 = imread('2.jpg');

% Перетворення в чорно-біле
img_gray_1 = rgb2gray(img_color_1);
img_gray_2 = rgb2gray(img_color_2);


% Відображення результату
figure;
subplot(2, 2, 1), imshow(img_gray_1);
title('Чорно-біле зображення 1');

% Дискретне косинусне перетворення
dct_img_1 = dct2(img_gray_1);
dct_img_2 = dct2(img_gray_2);


% Відображення ДКП
subplot(2, 2, 2), imshow(log(abs(dct_img_1) + 1), []);
title('Логарифмічний масштаб ДКП зображення 1');

% Відновлення зображення
restored_img_1 = idct2(dct_img_1);
restored_img_2 = idct2(dct_img_2);


% Відображення відновленого зображення
subplot(2, 2, 3), imshow(uint8(restored_img_1));
title('Відновлене зображення 1');

% Крок квантування
N = 16;

% Квантування
quantized_dct_img_1 = N*round(dct_img_1/N);
quantized_dct_img_2 = N*round(dct_img_2/N);

% Відображення квантованого ДКП
figure;
subplot(2, 2, 1), imshow(log(abs(quantized_dct_img_1) + 1), []);
title('Логарифмічний масштаб квантованого ДКП зображення 1');


% Відновлення зображень після квантування
restored_quantized_img_1 = idct2(quantized_dct_img_1);
restored_quantized_img_2 = idct2(quantized_dct_img_2);


% Відображення відновлених зображень після квантування
subplot(2, 2, 2),imshow(uint8(restored_quantized_img_1));
title('Відновлене квантоване зображення 1');

