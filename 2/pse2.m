clear;
close all;


% %Q1
picQ = imread('mask.jpg');
H = rgb2gray(picQ);
figure(1)
imshow('mask.jpg');
title('Mask with normal Histogram-Figure 1')

figure(2)
imhist(H)
title('Histogram-Figure 2')

newH = histeq(H);

figure(3)
imhist(newH)
title('Equalized histogram-Figure 3')
imwrite(newH,'Equalized_hist.jpg');

figure(4)
imshow('Equalized_hist.jpg');
title('Mask with equalized histogram-Figure 4')

Zeros = 0;
Ones = 0;
WhitenBlack = H;
[M,N]=size(H);
threshold = 135;
for i=1:M
 for j=1:N
     if( WhitenBlack(i,j)>threshold )    
        WhitenBlack(i,j)=255;
        Ones = Ones + 1;     
     else
        WhitenBlack(i,j)=0;
        Zeros = Zeros + 1;
     end;
 end;
end;
figure(5);
imshow(WhitenBlack);
title('Mask after threshold/Figure 6')
balance=abs(Ones-Zeros);

Zeros = 0;
Ones = 0;
WhitenBlack = H;
[M,N]=size(H);
threshold = 175;
for i=1:M
 for j=1:N
     if( WhitenBlack(i,j)>threshold )    
        WhitenBlack(i,j)=255;
        Ones = Ones + 1;     
     else
        WhitenBlack(i,j)=0;
        Zeros = Zeros + 1;
     end;
 end;
end;
figure(6);
imshow(WhitenBlack);
title('Mask after threshold/Figure 6')
balance=abs(Ones-Zeros);



%%Q2
%(k=7+1+1)
brain = imread('brain.gif');
k1 = 9;
k2 = k1 + 2;

figure(7)
medianA = medfilt2(brain,[k1 k1]);
subplot(2,2,1)
imshow(medianA)
title('Median Filtering 9x9');

medianB = medfilt2(brain,[k2 k2]);
subplot(2,2,2)
imshow(medianB)
title('Median Filtering 11x11');


gaussianfilterA = fspecial('gaussian',[k1 k1]);
gaussianA = imfilter(brain,gaussianfilterA);
subplot(2,2,3)
imshow(gaussianA)
title('Gaussian Filtering 9x9');

gaussianfilterB = fspecial('gaussian',[k2 k2]);
gaussianB = imfilter(brain,gaussianfilterB);
subplot(2,2,4)
imshow(gaussianB)
title('Gaussian Filtering 11x11');



%%Q3
SnPnoise = imnoise(brain,'salt & pepper');
figure(8)
imshow(SnPnoise)
title('Salt and Pepper Noise')

medANoise = medfilt2(SnPnoise,[k1 k1]);
figure(9)
title('Figure 9');
subplot(2,2,1)
imshow(medANoise)
title('Median Filtering 9x9 with salt and pepper noise.');

medBNoise = medfilt2(SnPnoise,[k2 k2]);
subplot(2,2,2)
imshow(medBNoise)
title('Median Filtering 11x11 on salt and pepper noise.');

averageFilterANoise = fspecial('average',[k1 k1]);
averageA = imfilter(SnPnoise,averageFilterANoise);
subplot(2,2,3)
imshow(averageA)
title('Average Filtering 9x9 on salt and pepper noise.');

averageFilterBNoise = fspecial('average',[k2 k2]);
averageB = imfilter(SnPnoise,averageFilterBNoise);
subplot(2,2,4)
imshow(averageB)
title('Average Filtering 11x11 on salt and pepper noise.');

mse1 = immse(double(SnPnoise), double(medANoise));
mse2 = immse(double(SnPnoise), double(medBNoise));%%MeanSquaredError
mse3 = immse(double(SnPnoise), double(averageA));
mse4 = immse(double(SnPnoise), double(averageB));

fprintf('\n The MSE in Median filter 9x9 is %0.4f\n', mse1);
fprintf('\n The MSE in Median filter11x11 is %0.4f\n', mse2);
fprintf('\n The MSE in Average filter 9x9 is %0.4f\n', mse3);
fprintf('\n The MSE is Average filter 11x11 is %0.4f\n', mse4);





%Q4
h = [1 1 1; 1 -8 1; 1 1 1];
FirstFrame = rgb2gray(imread('RiverFlow1.jpg'));
SecondFrame = rgb2gray(imread('RiverFlow2.jpg'));
SecondFrame(:,end)=[];%%Gia na einai idia ta frames


FirstFrameMed = medfilt2(FirstFrame,[k1 k1]);
FirstFrameH = imfilter(FirstFrame,h);
SecondFrameMed = medfilt2(SecondFrame,[k1 k1]);
SecondFrameH = imfilter(SecondFrame,h);

figure(10);
subplot(1,2,1)
imshow(FirstFrameMed)
title('First Frame Median filter')

subplot(1,2,2)
imshow(SecondFrameMed)
title('Second Frame Median filter')

figure(11)
imshow(FirstFrameMed-SecondFrameMed);
imwrite(FirstFrameMed-SecondFrameMed,'afterMedian.jpg')
title('Difference of the two median filtered frames')

figure(12);
subplot(1,2,1)
imshow(FirstFrameH)
title('First Frame H filter')

subplot(1,2,2)
imshow(SecondFrameH)
title('Second Frame H filter')

figure(13)
imwrite(FirstFrameH-SecondFrameH,'afterH.jpg')
imshow(FirstFrameH-SecondFrameH);
title('Difference of the two H filtered frames/Figure 13')

