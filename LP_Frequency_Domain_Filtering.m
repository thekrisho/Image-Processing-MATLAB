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

distmatrix1 = zeros(n,m);

for i = 1:n;
    for j = 1:m;
           distmatrix1(i,j) = (sqrt( (i-centx)^2 + (j-centy)^2)) .*-1;
    end
end

distmatrix1 = (distmatrix1) - (min(min(distmatrix1)));


distmatrix2 = distmatrix(m,n);

% figure(1)
% mesh(distmatrix1);
% 
% figure(2)
% mesh(distmatrix2);

%----------------------------Task 3----------------------------------
%[m,n] = size (I);
%distmatrix2 = distmatrix(m,n);

% A. Create Ideal LPF Filter
H = zeros(m,n);
radius = 35; % Control Variable
ind = distmatrix2 <= radius;
H(ind)=1;
H_ideal = double(H);

% B. Create Gaussian LPF Filter
Sigma = 30; % Control Variable
H_gaussian = exp(-(distmatrix2.^2) / (2*Sigma^2));

% C. Create Butterworth LPF
d0 = 35; % Control Variable
n = 3; % Control Variable
H_butter = 1./(1 + (distmatrix2./d0).^(2*n));

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
subplot(3,3,3), imshow(fftshift(H)), title('Ideal LPF');
subplot(3,3,4), imshow(I), title('Original');
subplot(3,3,5), imshow(I3), title('Filtered');
subplot(3,3,6), imshow(fftshift(H_gaussian)), title('Gaussian LPF');
subplot(3,3,7), imshow(I), title('Original');
subplot(3,3,8), imshow(I4), title('Filtered');
subplot(3,3,9), imshow(fftshift(H_butter)), title('Butterworth LPF');




