% Завдання 1: Завантаження та відображення зображень різних форматів
image1 = imread('C:\Users\sasha\OneDrive\Документи\MATLAB\LR1\1.jpg'); % Вказати шлях до зображення
image2 = imread('C:\Users\sasha\OneDrive\Документи\MATLAB\LR1\2.png'); % Вказати шлях до зображення

imshow(image1);
title('Image 1');
figure;
imshow(image2);
title('Image 2');

% Завдання 2: Завантаження зображення з вказаним шляхом
image3 = imread('C:\Users\sasha\OneDrive\Документи\MATLAB\LR1\3.jpg'); % Вказати шлях до зображення

% Завдання 3: Отримання інформації про завантажені зображення
info_image1 = imfinfo('C:\Users\sasha\OneDrive\Документи\MATLAB\LR1\1.jpg');
info_image2 = imfinfo('C:\Users\sasha\OneDrive\Документи\MATLAB\LR1\2.png');
info_image3 = imfinfo('C:\Users\sasha\OneDrive\Документи\MATLAB\LR1\3.jpg');

% Завдання 4: Збереження зображень в заданому каталозі
imwrite(image1, 'C:\Users\sasha\OneDrive\Документи\MATLAB\LR1\image1_saved.jpg'); % Вказати шлях для збереження
imwrite(image2, 'C:\Users\sasha\OneDrive\Документи\MATLAB\LR1\image2_saved.png'); % Вказати шлях для збереження
imwrite(image3, 'C:\Users\sasha\OneDrive\Документи\MATLAB\LR1\image3_saved.jpg'); % Вказати шлях для збереження

% Завдання 5: Відображення гістограм розподілу яскравостей
figure;
imhist(image1);
title('Histogram of Image 1');
figure;
imhist(image2);
title('Histogram of Image 2');

% Завдання 6: Контрастування зображень
% Зміна контрастності для image1
adjusted_image1 = imadjust(image1, [0.3 0.7], [], 1);

% Зміна контрастності для image2
adjusted_image2 = imadjust(image2, [], [], 0.5);


% Завдання 7: Відображення зображень з підвищеною контрастністю
figure;
imshow(adjusted_image1);
title('Image 1 with Enhanced Contrast');
figure;
imshow(adjusted_image2);
title('Image 2 with Enhanced Contrast');

% Завдання 8: Відображення негативу зображення
negative_image1 = imcomplement(image1);
negative_image2 = imcomplement(image2);

figure;
imshow(negative_image1);
title('Negative of Image 1');
figure;
imshow(negative_image2);
title('Negative of Image 2');

% Завдання 9: Ознайомлення з процедурою контрастування зображень
doc imadjust;

% Завдання 10: Відповіді на питання
% - "Гістограма розподілу яскравостей" - це графік, який показує частоту появи кожного рівня яскравості у зображенні.
% - "Контрастність зображення" - це відношення між найвищою і найнижчою яскравістю в зображенні.
% - Після контрастування зображення гістограма розподілу яскравостей розтягується по шкалі яскравості, що покращує контрастність.
% - Щоб зменшити контрастність зображення, можна використовувати функцію imadjust зі зменшенням значень гамми або використанням інших методів.
% - Щоб отримати негативне зображення, можна використовувати функцію imcomplement.

