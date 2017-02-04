clc; clear;

%----------------------------Task 1----------------------------------
%SPECTRAL CONTENT OF IMAGE

% Read Image
I = imread('cameraman256.png');
I1 = double(I);

ft = fft2(I1);

xmin = min(min(ft));
xmax = max(max(ft));

ft_shift=fftshift(ft);

% figure(1)
% imshow (log(1+abs(ft_shift)),[]);
% 
% figure(2)
% imshow ((ft_shift),[0 255]);

%----------------------------Task 2----------------------------------
%DISTANCE MATRIX

[m,n] = size(I);
mn = m*n; % Total number of pixels
centx = m/2 ;
centy = m/2 ;

distmatrix2 = zeros(n,m);

for i = 1:n;
    for j = 1:m;
           distmatrix2(i,j) = sqrt( (i-centx)^2 + (j-centy)^2 )*-1;
    end
end
distmatrix2 = (distmatrix2) - (min(min(distmatrix2)));


distmatrix2 = distmatrix(m,n);

% figure(1)
% mesh(distmatrix1);
% 
% figure(2)
% mesh(distmatrix2);

%----------------------------Task 3----------------------------------
%[m,n] = size (I);
%distmatrix2 = distmatrix(m,n);

% High Frequency Emphasis Enhancer Variables 
a = 1;
b = 3; % b > a

% A. Create Ideal HPF Filter
H = ones(m,n); %ones (instead of zeros in LPF)
radius = 35; % Control Variable
ind = distmatrix2 <= radius;
H(ind)=0; % 0 (instead of 1 for LPF)
H_ideal = double(a+(b.*H)); % 'a','b' adjust high frequency emphasis recovery

% B. Create Gaussian HPF Filter
Sigma = 30; % Control Variable
H_gaussian = 1- (exp(-(distmatrix2.^2) / (2*Sigma^2))); % 1 - LPF
H_gaussian = a+(b.*H_gaussian); % 'a','b' adjust high frequency emphasis recovery

% C. Create Butterworth HPF
d0 = 50; % Control Variable
n = 9; % Control Variable 
H_butter = 1- (1./(1 + (distmatrix2./d0).^(2*n)));
H_butter = a + (b.*H_butter);

% Apply Filters
ideal_dft = H_ideal.*ft;
gauss_dft = H_gaussian.*ft;
butt_dft = H_butter.*ft;

% Convert FT image back to Spatial Domain
I2 = uint8(real(ifft2(ideal_dft)));
I3 = uint8(real(ifft2(gauss_dft)));
I4 = uint8(real(ifft2(butt_dft)));

figure(1)
subplot(3,3,1), imshow(I), title('Original');
subplot(3,3,2), imshow(I2), title('Filtered');
subplot(3,3,3), imshow(fftshift(H)), title('Ideal HPF');
subplot(3,3,4), imshow(I), title('Original');
subplot(3,3,5), imshow(I3), title('Filtered');
subplot(3,3,6), imshow(fftshift(H_gaussian)), title('Gaussian HPF');
subplot(3,3,7), imshow(I), title('Original');
subplot(3,3,8), imshow(I4), title('Filtered');
subplot(3,3,9), imshow(fftshift(H_butter)), title('Butterworth HPF');




