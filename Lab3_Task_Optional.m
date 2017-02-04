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


% Zero Pad Test 
I1 = zeros(M+2,N+2); % Blank Canvas
for i = 1:M
    for j = 1:N
        I1(i+1,j+1) = I(i,j); % Place image in center of Canvas
    end
end
%


% Setup Filter (NxN Mask)
f = 1/9; %Filter Value
mask = [f f f; f f f; f f f];
%mask = [f f f f f; f f f f f; f f f f f; f f f f f; f f f f f];
m1 = size(mask,1); % 3
n1 = size(mask,2); % 3
temp1 = (n1/2) - 0.5; % 1 defines center of array FOR COUNT ONLY -> [0 1 2]
pxstart = temp1 - temp1; % 0
pxend = temp1 + temp1; % 2




% Loops offset to compute inner part of image only (no padding)
for i = (temp1+1):(M-temp1); 
    for j = (temp1+1):(N-temp1); 
        %          
        maskcount = 1; % Reset Mask Index
        newpx = 0; % Reset new PX
        
        for i1 = pxstart : pxend;  % 0-2        
            for j1 = pxstart : pxend; % 0-2
                % Filter by Correlation Equation
                newpx = newpx + I1(i+i1-temp1 , j+j1-temp1) * mask(maskcount);
                maskcount = maskcount + 1; % Increment Mask Index
            end 
        end
        
        I2(i,j) = newpx; % Apply filter to center px
        %
    end
end

figure(2)
imtool(I2);

figure(1)
subplot (1,2,1), imshow(I);
subplot (1,2,2), imshow(I2);



