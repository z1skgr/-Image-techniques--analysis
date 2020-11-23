%% 4
clear all;
close all;

initImage = imread('parrots.bmp');
[index,map] = imread('parrots.bmp');
[x,y] = size(initImage);
figure(1);
colormap(map);
image(index);
title('Image for Restoration');

%% Blurring
h = fspecial('average',[5 5]);  %Average filter 5x5
Ifilter = imfilter(initImage,h);      %blurring


gamma=1;
noisem = 0;
noisev1 = 0.1;
Image_noise1= imnoise(Ifilter,'gaussian',noisem,noisev1);   %εφαρμογή θορύβου στην εικόνα
noisev2 = 0.01;
Image_noise2= imnoise(Ifilter,'gaussian',noisem,noisev2);   %εφαρμογή θορύβου στην εικόνα

figure(2);
subplot(1,2,1);
imshow(Image_noise1);
title('Average filter image gaussian noise with variance 0.1');
subplot(1,2,2);
imshow(Image_noise2);
title('Average filter image gaussian noise with variance 0.01');
suptitle('Images after blurring and noise');


%% Wiener filter
H = fft2(h,x,y);    %Filter Fourier Transform
Hconj = conj(H);    %H*
G1 = fft2(Ifilter);   %Fourier Transform image after noise
Sn1 = noisev1 ;     %S noise
Sf = abs(fft2(initImage)).^2;   %Sf image


F1 = (Hconj./(abs(H).^2 + gamma.*(Sn1./Sf))).*G1;  
f1 = ifft2(F1);       %Inverse Fourier Transform image approximation


G2 = fft2(Ifilter);   %Fourier Transform image after noise
Sn2 = noisev2 ;     %S noise

F2 = (Hconj./(abs(H).^2 + gamma.*(Sn2./Sf))).*G2 ;  
f2 = ifft2(F2);       %Inverse Fourier Transform image approximation with different variance


figure(3);
subplot(1,2,1);
imshow(uint8(f1));
title('Image with variance 0.1');
subplot(1,2,2);
imshow(uint8(f2));
title('Image with variance 0.01');
suptitle('Wiener Filter Restoration');



Wiener_mse1 = sqrt(sum(sum((double(initImage) - double(f1)) .^ 2))) / (x * y)
Wiener_mse2 = sqrt(sum(sum((double(initImage) - double(f2)) .^ 2))) / (x * y)


%% CSLR

p = [0 -1 0;-1 4 -1;0 -1 0];    % μήτρα


M = x+2;
N = y+2;

P = fft2(p,M,N);    %Fourier Transform matrix

G1 = fft2(Image_noise1,M,N);
g1 = ifft2(G1);

H = fft2(h,M,N);
Hconj = conj(H);

%i πρώτο βήμα
gamma = 50;
noisem2 = noisem.^2;
n2_1 =norm((M-1)*(N-1)*(noisem2 + noisev1));
a1 = n2_1*(2/100);
for count=1:100
    %ii
    F1 = (Hconj./(abs(H).^2 + gamma*(abs(P).^2))).*G1;
    f1 = ifft2(F1);
    %iii
    r1 = g1 - H.*f1;
    fgamma = dot(r1,r1);
    %iv 
    
    if(fgamma<(n2_1-a1))
        gamma = gamma + 0.1;       
    end;
    if(fgamma>(n2_1+a1))
        gamma = gamma - 0.1;
    end;
    %v
    if((n2_1-a1)<fgamma & fgamma<(n2_1+a1))
        break;
    end;
end;

G2 = fft2(Image_noise2,M,N);
g2 = ifft2(G2);

%i πρώτο βήμα
gamma2 = 50;
n2_2 =norm((M-1)*(N-1)*(noisem2 + noisev2));
a2 = n2_2*(2/100);
for count=1:100
    %ii
    F2 = (Hconj./(abs(H).^2 + gamma2*(abs(P).^2))).*G2;
    f2 = ifft2(F2);
    %iii 
    r2 = g2 - H.*f2;
    fgamma2 = dot(r2,r2);
    %iv 
    
    if(fgamma2<(n2_2-a2))
        gamma2 = gamma2 + 0.1;       
    end;
    if(fgamma2>(n2_2+a2))
        gamma2 = gamma2 - 0.1;
    end;
    %v
    if((n2_2-a2)<fgamma2 & fgamma2<(n2_2+a2))
        break;
    end;

end;

figure(4);
subplot(1,2,1);
imshow(uint8(f1));
title('Image with variance 0.1');
subplot(1,2,2);
imshow(uint8(f2));
title('Image with variance 0.01');
suptitle('CLSR filter method')

initImage = ifft2(fft2(initImage,M,N));
[x,y] = size(initImage);

CLSR_mse1 = sqrt(sum(sum((double(initImage) - double(f1)) .^ 2))) / (x * y)
CLSR_mse2 = sqrt(sum(sum((double(initImage) - double(f2)) .^ 2))) / (x * y)
