% Крок 1: Завантаження зображень
image1 = imread('1.jpg');
image2 = imread('2.jpg');

% Крок 2: Обчислення та відображення спектрів
F1 = fft2(image1);
F2 = fft2(image2);

% застосування логарифмічного масштабу (для відображення)
logMagnitude1 = log(1 + abs(fftshift(F1)));
logMagnitude2 = log(1 + abs(fftshift(F2)));

% підготовка спектру для відображення (нормалізація та масштабування)
normalizedMagnitude1 = mat2gray(logMagnitude1); % Нормалізація в діапазон [0, 1]
normalizedMagnitude2 = mat2gray(logMagnitude2); % Нормалізація в діапазон [0, 1]
scaledMagnitude1 = uint8(255 * normalizedMagnitude1); % Масштабування до [0, 255]
scaledMagnitude2 = uint8(255 * normalizedMagnitude2); % Масштабування до [0, 255]

% Відображення
figure;
subplot(2, 2, 1), imshow(image1), title('Зображення 1');
subplot(2, 2, 2), imshow(scaledMagnitude1, []), title('Спектр Зображення 1');
subplot(2, 2, 3), imshow(image2), title('Зображення 2');
subplot(2, 2, 4), imshow(scaledMagnitude2, []), title('Спектр Зображення 2');


% Крок 3: Відновлення зображень
image1_restored = ifft2(ifftshift(F1));
image2_restored = ifft2(ifftshift(F2));


% Відображення відновлених зображень
figure;
subplot(1, 2, 1), imshow(abs(image1_restored), []), title('Відновлене Зображення 1');
subplot(1, 2, 2), imshow(abs(image2_restored), []), title('Відновлене Зображення 2');

% Крок 4: Створення та відображення фільтрів Гауса
M = 20; % Змініть значення за необхідності
N = 20; % Змініть значення за необхідності
sigma1 = 2; % Змініть значення за необхідності
sigma2 = 5; % Змініть значення за необхідності

H1 = fspecial('gaussian', [M N], sigma1);
H2 = fspecial('gaussian', [M N], sigma2);

% Відображення фільтрів
figure;
subplot(1, 2, 1), imshow(H1, []), title('Фільтр Гауса 1');
subplot(1, 2, 2), imshow(H2, []), title('Фільтр Гауса 2');

% Крок 5: Визначення частотної характеристики
H1_fft = fft2(H1);
H2_fft = fft2(H2);

% Відображення
figure;
subplot(1, 2, 1), imshow(abs(fftshift(H1_fft)), []), title('ЧХ Фільтра 1');
subplot(1, 2, 2), imshow(abs(fftshift(H2_fft)), []), title('ЧХ Фільтра 2');

% Крок 6: Фільтрація зображень у частотній області
fftImage1 = fft2(double(F1), M, N);
fftImage2 = fft2(double(F2), M, N);
fftFilter1 = fft2(H1, M, N);
fftFilter2 = fft2(H1, M, N);

filteredImageFrequency1 = real(ifft2(fftImage1 .* fftFilter1));
filteredImageFrequency2 = real(ifft2(fftImage2 .* fftFilter2));

filteredImageFrequency1 = uint8(255 * mat2gray(filteredImageFrequency1));
filteredImageFrequency2 = uint8(255 * mat2gray(filteredImageFrequency2));

normalizedFrequency1 = mat2gray(log(1 + abs(fftshift(fftImage1 .* fftFilter1))));
normalizedFrequency2 = mat2gray(log(1 + abs(fftshift(fftImage2 .* fftFilter2))));



% Відображення результатів
figure;
subplot(2, 2, 1), imshow(abs(normalizedFrequency1), []), title('Фільтроване Зображення 1 з Фільтром 1');
subplot(2, 2, 2), imshow(abs(normalizedFrequency2), []), title('Фільтроване Зображення 1 з Фільтром 2');


% Крок 7: Фільтрація в просторовій області
image1_filtered1_spatial = imfilter(image1, H1);
image1_filtered2_spatial = imfilter(image1, H2);


% Відображення результатів
figure;
subplot(2, 2, 1), imshow(image1_filtered1_spatial, []), title('Фільтроване Зображення 1 з Фільтром 1 (просторова)');
subplot(2, 2, 2), imshow(image1_filtered2_spatial, []), title('Фільтроване Зображення 1 з Фільтром 2 (просторова)');

