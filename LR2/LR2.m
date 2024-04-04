% Завантаження тестових зображень
image1 = imread('1.jpg');
image2 = imread('2.jpg');

% Відображення вихідних зображень
figure;
subplot(2, 2, 1);
imshow(image1);
title('Original Image 1');

subplot(2, 2, 2);
imshow(image2);
title('Original Image 2');
% Зашумлення зображень нормальним білим шумом
noisy_image1 = imnoise(image1, 'gaussian', 0, 0.01);

% Зашумлення зображень імпульсною перешкодою
noisy_image2 = imnoise(image2, 'salt & pepper', 0.05);

% Відображення зашумлених зображень
subplot(2, 2, 3);
imshow(noisy_image1);
title('Noisy Image 1 (Gaussian)');

subplot(2, 2, 4);
imshow(noisy_image2);
title('Noisy Image 2 (salt & pepper)');

% Виконання фільтрації вихідних зображень лінійними фільтрами
h_low_pass = fspecial('average', [3 3]); % Визначення фільтра низьких частот
h_high_pass = fspecial('laplacian', 0); % Визначення фільтра високих частот

filtered_image1_low_pass = imfilter(image1, h_low_pass);
filtered_image2_low_pass = imfilter(image2, h_low_pass);

filtered_image1_high_pass = imfilter(image1, h_high_pass);
filtered_image2_high_pass = imfilter(image2, h_high_pass);

% Відображення зображень після фільтрації
figure;
subplot(2, 2, 1);
imshow(filtered_image1_low_pass);
title('Filtered Image 1 (Low Pass)');

subplot(2, 2, 2);
imshow(filtered_image2_low_pass);
title('Filtered Image 2 (Low Pass)');

subplot(2, 2, 3);
imshow(filtered_image1_high_pass);
title('Filtered Image 1 (High Pass)');

subplot(2, 2, 4);
imshow(filtered_image2_high_pass);
title('Filtered Image 2 (High Pass)');

% Профільтрувати різними лінійними фільтрами зображення, що зашумлені різними за характером перешкодами
filtered_noisy_image1_gaussian_low_pass = imfilter(noisy_image1, h_low_pass);
filtered_noisy_image2_salt_pepper_low_pass = imfilter(noisy_image2, h_low_pass);

filtered_noisy_image1_gaussian_high_pass = imfilter(noisy_image1, h_high_pass);
filtered_noisy_image2_salt_pepper_high_pass = imfilter(noisy_image2, h_high_pass);

% Відображення результатів фільтрації
figure;
subplot(2, 2, 1);
imshow(filtered_noisy_image1_gaussian_low_pass);
title('Filtered Noisy Image 1 (Gaussian, Low Pass)');

subplot(2, 2, 2);
imshow(filtered_noisy_image2_salt_pepper_low_pass);
title('Filtered Noisy Image 2 (Salt & Pepper, Low Pass)');

subplot(2, 2, 3);
imshow(filtered_noisy_image1_gaussian_high_pass);
title('Filtered Noisy Image 1 (Gaussian, High Pass)');

subplot(2, 2, 4);
imshow(filtered_noisy_image2_salt_pepper_high_pass);
title('Filtered Noisy Image 2 (Salt & Pepper, High Pass)');

% Фільтрація вихідних і зашумлених зображень адаптивним Вінерівським фільтром
filtered_image1_v1 = wiener2(rgb2gray(image1), [5 5]);
filtered_image2_v1 = wiener2(rgb2gray(image2), [5 5]);

filtered_noisy_image1_gaussian_v1 = wiener2(rgb2gray(noisy_image1), [5 5]);
filtered_noisy_image2_salt_pepper_v1 = wiener2(rgb2gray(noisy_image2), [5 5]);

% Відображення результатів фільтрації адаптивним Вінерівським фільтром
figure;
subplot(2, 2, 1);
imshow(filtered_image1_v1);
title('Filtered Image 1 (Wiener)');

subplot(2, 2, 2);
imshow(filtered_image2_v1);
title('Filtered Image 2 (Wiener)');

subplot(2, 2, 3);
imshow(filtered_noisy_image1_gaussian_v1);
title('Filtered Noisy Image 1 (Gaussian, Wiener)');

subplot(2, 2, 4);
imshow(filtered_noisy_image2_salt_pepper_v1);
title('Filtered Noisy Image 2 (Salt & Pepper, Wiener)');

% Фільтрація зашумлених зображень нелінійним медіанним фільтром
median_filtered_noisy_image1_gaussian = medfilt2(rgb2gray(noisy_image1), [3 3]);
median_filtered_noisy_image2_salt_pepper = medfilt2(rgb2gray(noisy_image2), [3 3]);

% Відображення результатів медіанної фільтрації
figure;
subplot(2, 2, 1);
imshow(median_filtered_noisy_image1_gaussian);
title('Median Filtered Noisy Image 1 (Gaussian)');

subplot(2, 2, 2);
imshow(median_filtered_noisy_image2_salt_pepper);
title('Median Filtered Noisy Image 2 (Salt & Pepper)');


