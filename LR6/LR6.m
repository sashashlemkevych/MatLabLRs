% 1. Завантаження зображень
image1 = imread('1.jpg');
image2 = imread('2.jpg');

% 2. Перетворення в чорно-біле
gray_image1 = rgb2gray(image1);
gray_image2 = rgb2gray(image2);

% 3. Використання функції blockproc для розбиття та застосування ДКП
block_size = 8;
T = dctmtx(block_size);
dct_func = @(block_struct) T * block_struct.data * T';
dct_image1 = blockproc(double(gray_image1), [block_size block_size], dct_func);
dct_image2 = blockproc(double(gray_image2), [block_size block_size], dct_func);

% 4. Відображення результату ДКП
figure;
subplot(2,2,1);
imshow(gray_image1);
title('Original Image 1');
subplot(2,2,2);
imshow(log(abs(dct_image1)), []);
title('DCT of Image 1');
subplot(2,2,3);
imshow(gray_image2);
title('Original Image 2');
subplot(2,2,4);
imshow(log(abs(dct_image2)), []);
title('DCT of Image 2');

% 5. Відновлення зображень за їх ДКП-спектром
invdct_func = @(block_struct) T' * block_struct.data * T;
reconstructed_image1 = blockproc(dct_image1, [block_size block_size], invdct_func);
reconstructed_image2 = blockproc(dct_image2, [block_size block_size], invdct_func);

% Відображення відновлених зображень
figure;
subplot(2,2,1);
imshow(uint8(reconstructed_image1));
title('Reconstructed Image 1');
subplot(2,2,2);
imshow(uint8(reconstructed_image2));
title('Reconstructed Image 2');

% 6. Квантування результатів ДКП
quantization_step = 10;
quantized_dct_image1 = blockproc(dct_image1, [block_size block_size], @(block_struct) round(block_struct.data / quantization_step) * quantization_step);
quantized_dct_image2 = blockproc(dct_image2, [block_size block_size], @(block_struct) round(block_struct.data / quantization_step) * quantization_step);

% 7. Квантування коефіцієнтів ДКП з використанням маски
mask = [
    1 1 1 1 0 0 0 0;
    1 1 1 0 0 0 0 0;
    1 1 0 0 0 0 0 0;
    1 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0;
];
masked_quantized_dct_image1 = blockproc(quantized_dct_image1, [block_size block_size], @(block_struct) mask .* block_struct.data);

% 8. Відновлення зображень за квантованим ДКП-спектром
reconstructed_quantized_image1 = blockproc(masked_quantized_dct_image1, [block_size block_size], invdct_func);

% Відображення відновлених зображень
subplot(2,2,3);
imshow(uint8(reconstructed_quantized_image1));
title('Reconstructed Quantized Image 1');
