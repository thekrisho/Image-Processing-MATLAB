clc;
clear all;

I1=imread('barbara.jpg');
I2=imread('tire_gray.jpg');
I3=imread('pout_gray.jpg');
I4=imread('eight_gray.jpg');

figure(1)
subplot(1,4,1), imhist (I1);
subplot(1,4,2), imhist (I2);
subplot(1,4,3), imhist (I3);
subplot(1,4,4), imhist (I4);

figure(2)
subplot(1,4,1), imshow (I1);
subplot(1,4,2), imshow (I2);
subplot(1,4,3), imshow (I3);
subplot(1,4,4), imshow (I4);
