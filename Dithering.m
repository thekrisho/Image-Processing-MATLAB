% Task 2: dithering
clear;
clc;
 
% Read Image
I = imread('barbara.jpg');
xmin = min(min(I));
xmax = max(max(I));
bit = 4; %4 bpp
delta = (xmax - xmin)/2^bit;

% Quantize 4bpp 
for i = 1:size(I,1)
    for j = 1:size(I,2)
        I2(i,j)= round(delta) * round(I(i,j)/delta);
    end
end
 
% Create Pseudo Random Mask
Mask = uint8(randi(2^bit, size(I,1), size(I,2)));

% Add Dither Mask
I3 = I + Mask;
 
% Re-Quantize 
for i = 1:size(I,1)
    for j = 1:size(I,2)
        I4(i,j)= round(delta) * round(I3(i,j)/delta);
    end
end
 
% Subtract Dither
I5 = I4 - Mask;
 
figure(1)
subplot(1,3,1),imshow(I2),title('Original Quantized');
subplot(1,3,2),imshow(I4),title('Quantized with Dithering');
subplot(1,3,3),imshow(I5),title('Quantizer with Dithering Subtracted');





