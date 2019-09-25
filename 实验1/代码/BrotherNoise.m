clc
clear all

I = imread('EgPic.jpg');
I_gray = rgb2gray(I);
thresh=graythresh(I);%确定二值化阈值
I_2 = im2bw(I,thresh);%对图像二值化

% % 绘图
% figure(1)
% subplot(1,3,1);imshow(I),title('原始图像'); %显示原始图像
% subplot(1,3,2);imshow(I_gray),title('图像灰度处理'); %显示图像灰度处理
% subplot(1,3,3);imshow(I_2),title('阈值二值化'); %显示阈值二值化

% GrayNoise1 = imnoise(I_gray,'Gaussian',0,0.01);
% GrayNoise2 = imnoise(I_gray,'Gaussian',0,0.1);
% GrayNoise3 = imnoise(I_gray,'Gaussian',0,0.5);



% 绘图
% figure(1)
% subplot(1,4,1);imshow(I_gray),title('原始灰度图像'); %显示原始灰度图像
% subplot(1,4,2);imshow(GrayNoise1),title('μ=0,σ=0.01'); %显示噪声图像
% subplot(1,4,3);imshow(GrayNoise2),title('μ=0,σ=0.1'); %显示噪声图像
% subplot(1,4,4);imshow(GrayNoise3),title('μ=0,σ=0.5'); %显示噪声图像

win1 = [3,3];
win2 = [5,5];
win3 = [20,20];

% Reduc1 = medfilt2(GrayNoise1,win1);
% Reduc2 = medfilt2(GrayNoise1,win2);
% Reduc3 = medfilt2(GrayNoise1,win3);

r = I(:,:,1);
g = I(:,:,2);
b = I(:,:,3);

si = size(r);
zo = zeros(si);

Noise1 = imnoise(I,'Gaussian',0,0.01);
Noise2 = imnoise(I,'Gaussian',0.1,0.01);
Noise3 = imnoise(I,'Gaussian',0.5,0.01);

g1 = Noise1(:,:,2);
g2 = Noise2(:,:,2);
g3 = Noise3(:,:,2);

figure(1)
subplot(1,4,1);imshow(cat(3,zo,g,zo)),title('原始G通道'); 
subplot(1,4,2);imshow(cat(3,zo,g1,zo)),title('μ=0,σ=0.01'); 
subplot(1,4,3);imshow(cat(3,zo,g2,zo)),title('μ=0.1,σ=0.01'); 
subplot(1,4,4);imshow(cat(3,zo,g3,zo)),title('μ=0.5,σ=0.01');


% win1 = [3,3];
% X1 = medfilt2(x,win1);
% Y1 = medfilt2(y,win1);
% Z1 = medfilt2(z,win1);
% 
% win2 = [10,10];
% X2 = medfilt2(x,win2);
% Y2 = medfilt2(y,win2);
% Z2 = medfilt2(z,win2);
% 
% win3 = [100,100];
% X3 = medfilt2(x,win3);
% Y3 = medfilt2(y,win3);
% Z3 = medfilt2(z,win3);
% 
% figure(1)
% subplot(1,4,1);imshow(Noise),title('μ=0,σ=0.01'); 
% subplot(1,4,2);imshow(cat(3,X1,Y1,Z1)),title('size=3*3'); 
% subplot(1,4,3);imshow(cat(3,X2,Y2,Z2)),title('size=10*10');
% subplot(1,4,4);imshow(cat(3,X3,Y3,Z3)),title('size=100*100');


% 
% new_img=cat(3,X,Y,Z);
% figure;imshow(new_img); 


% 
% Denoise_image1 = medfilt2(Noise(:),[3,3]);
% figure,imshow(Denoise_image1)
% 
% Denoise_image2 = medfilt2(Noise(:),[5,5]);
% figure,imshow(Denoise_image2)