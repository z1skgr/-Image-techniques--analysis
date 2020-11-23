clear;
close all;

%Q1
[tools,maptools] = imread('tools.bmp');


ft_1 = fft2(tools);
figure(1)
Ft_1 = abs(ft_1);
image(Ft_1);
colormap(maptools)
title('Metre Fourier transformation grayscale image');

c = 15;
D_1 = fftshift(c*log(1 + Ft_1));
figure(2)
image(D_1)
colormap(maptools)
title('Grayscale image display');

figure(3)

colormap(maptools)
colormap(jet)
image(D_1)

title('Different colors image display');

%Q2
[landscape,landscapemap] = imread('landscape.bmp');
Ft = abs(fftshift(fft2(landscape)));
figure(4);
subplot(1,2,1)
imshow(landscape,landscapemap)
title('Image#1');
c = 15;
D = c*log(1 + Ft);

subplot(1,2,2)
colormap(landscapemap);
image(D);
title('Display #1 image with Fourier Transformation');

[wood,woodmap] = imread('wood.bmp');
figure(5);
subplot(1,2,1)
imshow(wood,woodmap)
title('Image#2');
Ft = abs(fftshift(fft2(wood)));

c = 15;
D = c*log(1 + Ft);
subplot(1,2,2)
colormap(woodmap);
image(D);
title('Display #2 image with Fourier Transformation.');

%Q3
BlackIm10 = zeros(256,256);
BlackIm10(123:133,123:133)=255;

figure(6);
subplot(1,2,1)
imshow(BlackIm10)
title('10x10 white square center')
imwrite(BlackIm10,'BlackIm10.bmp') 

BlackIm30 = zeros(256,256);
BlackIm30(113:143,113:143)=255;
subplot(1,2,2)

imshow(BlackIm30)
title('30x30 white square center')



%Δημιουργούμε το map3 και το χρησιμοποιούμε για τους μετασχηματισμούς
%fourier των εικόνων στα ερωτημάτα 3,4 και 5.
[BlackIm10,map3] = imread('BlackIm10.bmp');

Ft1 = fftshift(abs(fft2(BlackIm10)));

figure(7);
subplot(1,2,1)

colormap(map3)
image(Ft1);
title('Without usage transformation 10x10 white square');

c = 15;
D1 = c*log(1+Ft1);

subplot(1,2,2)
colormap(map3)
image(D1);
title('Usage transformation 10x10 white square');


Ft2 = fftshift(abs(fft2(BlackIm30)));

figure(8);
subplot(1,2,1)
colormap(map3)
image(Ft2);
title('Without usage transformation 30x30 white square');

c = 15;
D2 = c*log(1+Ft2);
subplot(1,2,2)
image(D2);
title('Usage transformation 30x30 white square');



%Q4
BlackPic10Rot = imrotate(BlackIm10,45);  %% περιστροφή παραθύρου εικόνας κατα 45 μοίρες
BlackPic30Rot = imrotate(BlackIm30,45);
figure(9);
subplot(1,2,1)
imshow(BlackPic10Rot);
title('Rotated image 10x10 45o degrees')
subplot(1,2,2)
imshow(BlackPic30Rot);
title('Rotated image 30x30 45o degrees')

ftrot = abs(fftshift(fft2(BlackPic10Rot)));

figure(10);
subplot(1,2,1)
colormap(map3)
image(ftrot);
title('Rotated Image 10x10 without transformation');

Drot = c*log(1+ftrot);

subplot(1,2,2)
image(Drot);
title('Rotated Image 10x10 using transformation');

%%30x30


ft2rot = abs(fftshift(fft2(BlackPic30Rot)));

figure(11);
subplot(1,2,1)
colormap(map3)
image(ft2rot);
title('Rotated Image 30x30 without transformation');

D2rot = c*log(1+ft2rot);

subplot(1,2,2)
image(D2rot);
title('Rotated Image 30x30 using transformation');


%Q5

BlackPic10shifted = zeros(256,256);
BlackPic10shifted(59:69,59:69)=255;
BlackPic30shifted = zeros(256,256);
BlackPic30shifted(49:79,49:79)=255;
figure(12)
subplot(1,2,1)
imshow(BlackPic10shifted)
title('White shifted square 10x10') 
subplot(1,2,2)
imshow(BlackPic30shifted)
title('White shifted square 30x30')

Ftshift = abs(fftshift(fft2(BlackPic10shifted)));

figure(13);
subplot(1,2,1)
colormap(map3)
image(Ftshift);
title('Shifted Image 10x10 without transformation');

c = 15;
D1shift = c*log(1+Ft1);

subplot(1,2,2)
image(D1shift);
title('Shifted Image 10x10 with usage transformation');

Ft2shift = abs(fftshift(fft2(BlackPic30shifted)));

figure(14);
subplot(1,2,1)
colormap(map3)
image(Ft2shift);
title('Shifted Image 30x30 without transformation');

c = 15;
D2shift = c*log(1+Ft2shift);

subplot(1,2,2)
image(D2shift);
title('Shifted Image 30x30 with usage transformation');

%Q6
Tools_Histeq = histeq(tools);

figure(15)
imshow(Tools_Histeq);
title('Image after balancing histogram')

fthisteq = abs(fftshift(fft2(Tools_Histeq)));
Dhisteq = c*log(1+fthisteq);

figure(16);
colormap(maptools);
image(Dhisteq);
title('Fourier Transform after balancing histogram');
