clc; clear all;
% Kris's Code Notes:
% - Assumes Mask is square matrix
% - Assumes Filter Center is always the center of the mask! (aka odd# size matrix)
 
% Read Image
I=imread('bcitworks.jpg'); 
M = size(I,1); 
N = size(I,2); 
% I1=I;
I2=I; % Place holder for new image

% Create Mask (Filter)
f = 1/9; %Filter Value
g = 2/9;
mask = [f f f; f f f; g g g];



% Zero Padding
Pad = 2;
I1 = zeros(M+Pad+1,N+Pad+1); % Blank Canvas
for i = 1:M
    for j = 1:N
        I1(i+Pad/2,j+Pad/2) = I(i,j); % Place image in center of Canvas
    end
end


mask1 = [1 2 3; 4 5 6; 7 8 9];
mask1 = mask1 / 45;
% mask2 = fspecial('unsharp');
% mask3 = fspecial('sobel');



% MATLAB FILTER FUNCTION
I3 = imfilter(I1, mask1, 'symmetric');
I4 = imfilter(I1, mask1, 'conv');




figure(1)
I3 = uint8(I3);
I4 = uint8(I4);


subplot (1,4,2), imshow(I3);
subplot (1,4,3), imshow(I4);





