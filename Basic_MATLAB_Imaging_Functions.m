%-----------------------LAB 1-------------------------%
clc;
clear all;

%---------------------Task 1---------------------- %
% I=imread('barbara.jpg');%Creates image array
% imfinfo('barbara.jpg');%

%whos ; %Shows all data type info
%whos I; %Shows image data type info
%size(I) %Shows image file size
%class(I) ;%Shows image class

%imshow(I); %Actually Displays Image
%imshow(I,[1,1])%
%imtool(I);%Image inspection tool

% 
% I_test = imread('lena.tiff');%Reads image store in array
% 
% 
% imwrite(I_test, 'lena1.jpg', 'quality', 1);%Write image src array , dest file name
%     temp1=imread('lena1.jpg');
%     
% imwrite(I_test, 'lena2.jpg', 'quality', 5);%Write img low res 
%     temp2=imread('lena2.jpg');
%     
% imwrite(I_test, 'lena3.jpg', 'quality', 100);%Write img High res
%     temp3=imread('lena3.jpg');
%  
%     
%     
% figure;
% subplot(1,3,1);
% imshow(temp1);
% subplot(1,3,2);
% imshow(temp2);
% subplot(1,3,3);
% imshow(temp3);

%---------------------------End Task 1-----------------------%

%----------------------------Task 2----------------------------------%
I2 = imread('fruits.png');
imfinfo('fruits.png');
%imshow(I2);
%imtool(I2);
%test = I2(:,:,1);

I2(93,180);% Pixel intensity
I2(93,180,1)% Red pixel intensity
I2(93,180,2)% Blue pixel intensity
I2(93,180,3)% Green pixel intensity

pintense = I2(:,:);% Pixel intensity
pRed = I2(:,:,1);% Red pixel intensity
pBlue = I2(:,:,2);% Blue pixel intensity
pGreen = I2(:,:,3);% Green pixel intensity


% figure;
% subplot(1,3,1);
% imshow(pRed);
% subplot(1,3,2);
% imshow(pBlue);
% subplot(1,3,3);
% imshow(pGreen);





%[I3,map] = rgb2ind(I2,22);% Convert RGB to Index
%imwrite(I3, 'fruits2.png');
%imshow(I3);



