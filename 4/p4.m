clear;
close all;

[f,map] = imread('parrots.bmp');

initImage = f;
figure(1)
colormap(map);
image(f);
title('Picture for Restoration');

%Blurring
AverageF = fspecial('average',[5 5]);
g = imfilter(f,AverageF);
noisemean = 0;
noisevar1 = 0.1;
parrotsN1 = imnoise(g,'gaussian',noisemean,noisevar1);
noisevar2 = 0.01;
parrotsN2 = imnoise(g,'gaussian',noisemean,noisevar2);

figure(2);
subplot(1,2,1);
imshow(parrotsN1);
title('Average filter image gaussian noise with variance 0.1');
subplot(1,2,2);
imshow(parrotsN2);
title('Average filter image gaussian noise with variance 0.01');
suptitle('Images after blurring and noise');


%Wiener filter

gamma = 1;


[x, y] = size(f);
H = fft2(AverageF,x,y);    %μετασχηματισμός φουριερ του φιλτρου
Hconj = conj(H);    %ο συζυγής του μετασχηματισμού φουριέρ του γίλτρου
G1 = fft2(parrotsN1);   %μετασχηματισμός φουριέρ της εικόνας μετά το θόρυβο
Sn1 = noisevar1 ;     %φασμα ισχύος του θορύβου
Sf = abs(fft2(f)).^2;   %φάσμα ισχύος της αρχικής εικονας

c=1;
F1 = (Hconj./(abs(H).^2 + 10000000*c.*(Sn1./Sf))).*G1;  
f1 = ifft2(F1);       %αντίστροφος μετασχηματισμός φουριερ για την προσέγγιση της εικόνας


G2 = fft2(parrotsN2);   %μετασχηματισμός φουριέρ της εικόνας μετά το θόρυβο
Sn2 = noisevar2 ;     %φασμα ισχύος του θορύβου
F2 = (Hconj./(abs(H).^2 + 10000000*c.*(Sn2./Sf))).*G2 ;  
f2 = ifft2(F2);       %αντίστροφος μετασχηματισμός φουριερ για την προσέγγιση της εικόνας

figure(3);
subplot(1,2,1);
imshow(uint8(f1));
title('Image with variance 0.1');
subplot(1,2,2);
imshow(uint8(f2));
title('Image with variance 0.01');
suptitle('Wiener Filter Restoration');

Wiener1_mse = sqrt(sum(sum((double(f) - double(f1)) .^ 2))) / (x * y)
Wiener2_mse = sqrt(sum(sum((double(f) - double(f2)) .^ 2))) / (x * y)




%Constrained Least Squares Restoration

[A, B] = size(f);
M = A+3-1;
N = B+3-1;

%Δημιουργούμε την μήτρα με διαστάσεις MxN με zero padding.

p = [0 -1 0; -1 4 -1;0 -1 0];
P = fft2(p,M,N);

G = fft2(parrotsN1,M,N);
g = ifft2(G);
H = fft2(AverageF,M,N);
Hconjugate = conj(H);

%1
noisemean2 = noisemean.^2;
n=norm((M-1)*(N-1)*(noisemean2+noisevar1)); 
a = 0.05 * n;
gama = 10^(-10); 

while(1)
    %ii
    F = (Hconjugate./(abs(H).^2 + gama*(abs(P).^2))).*G;
    
    %iii
    R = G - H.*F;  %μέθοδος Newton-Raphson
    r = ifft2(R);
    fgama=norm(r);
    %iv
    if (fgama < n - a)
        gama = gama + gama*2/3;
    else
        gama = gama - gama*2/3;  
    end;
    if(fgama>n-a && fgama<n+a)
        f = ifft2(F);
        break;
    end;    
end;

figure(4);
colormap(map);
image(f);
title('Constrained Least Squares Restoration');

[x,y] = size(initImage);
f = ifft2(fft2(f,x,y)); %Metatrepoume tin telikh eikona stis arxikes diastaseis, gia na broume to mse.

mse1 = sqrt(sum(sum((double(initImage) - double(f)) .^ 2))) / (x * y)

%mse2 = sqrt(sum(sum((double(initImage) - double(f)) .^ 2))) / (x * y)
