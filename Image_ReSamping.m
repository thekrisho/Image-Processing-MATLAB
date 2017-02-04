clc; clear all;
% Kris's Code Notes:

% Image Specs
m = 256; % Rows
n = 256; % Cols
mn = m*n; % Number of Pixels (Size)
M = [1 5 35]; % Sample sizes

% Create the image
for i = 1:m;
    for j = 1:n;
          I1(i,j) = cos(2* sqrt(10) * pi * j);
    end
end

% Prep Image
a = 1/3;
angle = atan(a) * (180 / pi);
I2 = imrotate(I1, angle); 

% Downsample
% Sample X in steps of M
I3 = imresize((I2(1:M(1):end, 1:1:end)),[m,n]); 
I4 = imresize((I2(1:M(2):end, 1:1:end)),[m,n]); 
I5 = imresize((I2(1:M(3):end, 1:1:end)),[m,n]); 

% Disply Results
figure(1)
subplot (2,3,1), imshow(I1), title('Original');
subplot (2,3,2), imshow(I2), title('Rotated');
subplot (2,3,4), imshow(I3), title(['Sampled ' num2str(M(1)) ' Times']);
subplot (2,3,5), imshow(I4), title(['Sampled ' num2str(M(2)) ' Times']);
subplot (2,3,6), imshow(I5), title(['Sampled ' num2str(M(3)) ' Times']);




