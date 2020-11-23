%Q1 Grey
%Picture#1
clear ;
[A,mapA] = imread('parrots.jpg');
[A,mapA] = rgb2ind(A,256);
figure(1);
imshow(A,mapA);
for i=1:length(mapA)
    grey1(i) = (222*mapA(i,1)+707*mapA(i,2)+71*mapA(i,3))/1000; 
    for j=1:3
    	mapA(i,j)= grey1(i);
    end;
end;

imwrite(A,mapA,'grayImage1.jpg');
figure(2);
imshow(A,mapA);

%Picture#2
[B,mapB]=imread('milk.jpg');
[B,mapB] = rgb2ind(B,256);
figure(3);
imshow(B,mapB);
for i=1:length(mapB)
    grey2(i)=(222*mapB(i,1)+707*mapB(i,2)+71*mapB(i,3))/1000;
    for j=1:3
    	mapB(i,j)= grey2(i);
    end;
end

imwrite(B,mapB,'grayImage2.jpg');
figure(4);
imshow(B,mapB);



%Q2-HSI to RGB
%(7+1+1)
k = 9;

H = linspace(0,360,256) ;
S =(1-k/10);
I = 0.5;
  
M=I*(1+S); 
m=2*I-M;   


%R:
for i = 1:256
  if H(i)<60 
      RGBmap(i,1) = m+(M-m)*(H(i)/60);
  elseif H(i)<180 
      RGBmap(i,1) = M;
  elseif H(i)<240
      RGBmap(i,1) = m+(M-m)*((240 - H(i))/60);
  elseif H(i)<360 
      RGBmap(i,1) = m;
  end
end

%G:
for i = 1:256
  if H(i)<120 
      RGBmap(i,2) = m;
  elseif H(i)<180 
      RGBmap(i,2) =  m+(M-m)*((H(i) - 120 )/60);
  elseif H(i)<300
      RGBmap(i,2) = M;
  elseif H(i)<360 
      RGBmap(i,2) = m+(M-m)*((360 - H(i) )/60);
  end
end

% B:
for i = 1:256
  if H(i)<60 
      RGBmap(i,3) = M;
  elseif H(i)<120 
      RGBmap(i,3) =  m+(M-m)*((120 - H(i))/60);
  elseif H(i)<240
      RGBmap(i,3) = m;
  elseif H(i)<300 
      RGBmap(i,3) = m+(M-m)*((H(i) - 240 )/60);
  elseif H(i)<360 
      RGBmap(i,3) = M;
  end
end


%new picture
for i = 1:256
    for j = 1:256
        new_Image(i,j) = i;
    end
end

figure(5)
imwrite(new_Image,RGBmap,'new_Image.jpg') % New_Image indexed image ,map palet
imshow('new_Image.jpg');

%Q3
%fade HSI
[C,mapC] = imread('beach.jpg');
[C,mapC] = rgb2ind(C,256);
figure(6);
imshow(C,mapC);

HSI=rgb2hsv(mapC); 
S=HSI(:,2);


for times=1:6
    S(:,1)=1.2;
    S(:,1)=S(:,1)-(times*0.2);
    
    for i=1:256
        if(S(i,1)<0)
            S(i,1)=0;
        end
    end
    
    HSI(:,2) = S;
    mapC = hsv2rgb(HSI);
    if(times==1)
        imwrite(C,mapC,'fade#1.jpg');
        figure(7);
    elseif(times==2)
        imwrite(C,mapC,'fade#2.jpg');
        figure(8);
    elseif(times==3)
        imwrite(C,mapC,'fade#3.jpg');
        figure(9);
    elseif(times==4)
        imwrite(C,mapC,'fade#4.jpg');
        figure(10);
    elseif(times==5)
        imwrite(C,mapC,'fade#5.jpg');
        figure(11);
    else
        imwrite(C,mapC,'fade#6.jpg');
        figure(12);
    end
    imshow(C,mapC);
end






%Q4
clear;
[D,mapD] = imread('whitebalance.jpg');
[D,mapD] = rgb2ind(D,256);
figure(13);
imshow(D,mapD);

lines=length(D(:,1));
columns=length(D(1,:));

R=0;
G=0;
B=0;
for i=1:lines
    for j=1:columns
        R=R+mapD(D(i,j)+1,1);
        G=G+mapD(D(i,j)+1,2);
        B=B+mapD(D(i,j)+1,3);
    end
end

Ravg=(1/(lines*columns))*R;
Gavg=(1/(lines*columns))*G;
Bavg=(1/(lines*columns))*B;

if(~(Ravg==Gavg && Ravg==Bavg && Gavg==Bavg))
        R=(Gavg/Ravg)*mapD(:,1);
        G=mapD(:,2);
        B=Gavg*mapD(:,3)/Bavg;
end

for i=1:256
    if (R(i)>1)
        R(i)=1;
    end
    if (R(i)<0)
        R(i)=0;
    end
    
    if (B(i)>1)
        B(i)=1;
    end
     if(B(i)<0)
        B(i)=0;
    end
    if (G(i)>1)
        G(i)=1;
    end
    if (G(i)<0)
        G(i)=0;
    end
    
end



newmap = [R, G, B];


imwrite(D,newmap,'newwhitebalance.jpg');
figure(14);
imshow(D,newmap);


