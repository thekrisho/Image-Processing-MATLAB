clc, clear;

% UNIFORM NOISE
a = 50;
b = 20;

for z = 1:256
    
    if (z >= a)||(z<=b);
        noise = 1/(b-a);
    else
        noise = 0;
    end
    
    p(z)= noise;
    
end

%plot(p);

% SALT AND PEPPER

P = 50;
S = 100;

for z = 1:256

    if z == P;
        noise = 50;
    elseif z == S;
        noise = 200;
    else 
        noise = 0;
    end
    
    p(z)= noise;

end

%plot(p);

% TASK 1.2

I1 = imread('Cameraman256.png');
I2 = imnoise(I1,'gaussian',0,0.001);
I3 = imnoise(I1,'salt & pepper',0.05);

% figure(1)
% subplot(1,3,1); imshow(I1);
% subplot(1,3,2); imshow(I2);
% subplot(1,3,3); imshow(I3);

% TASK 1.3

h1 = fspecial('average', 3);
h2 = fspecial('average', 5);
I4 = imfilter(I1,h1);
I5 = imfilter(I1,h2);



% figure(2)
% subplot(1,3,1); imshow(I1);
% subplot(1,3,2); imshow(I4);
% subplot(1,3,3); imshow(I5);

% TASK 2

% Read Image
I6 = double(I2);



ft = fft2(I6);

xmin = min(min(ft));
xmax = max(max(ft));

ft_shift=fftshift(ft);

[m,n] = size(I6);
mn = m*n; % Total number of pixels

distmatrix2 = distmatrix(m,n);

% High Frequency Emphasis Enhancer Variables 
a = 7;
b = 1; % b > a
Sigma = 45; % Control Variable

% Create Gaussian HPF Filter
H_gaussianLPF = 1-(exp(-(distmatrix2.^2) / (2*Sigma^2))); % 1 - LPF
H_gaussianLPF = a+(b.*H_gaussianLPF); % 'a','b' adjust high frequency emphasis recovery

% Create Gaussian LPF Filter
H_gaussian = exp(-(distmatrix2.^2) / (2*Sigma^2));

% Apply Filters
filt = H_gaussian;
filter = filt.*ft;

% Convert FT image back to Spatial Domain
I7 = uint8(real(ifft2(filter)));


figure(3)
subplot(1,4,1), imshow(I1), title('Original');
subplot(1,4,2), imshow(I2), title('Noisy');
subplot(1,4,3), imshow(I7), title('Corrected');
subplot(1,4,4), imshow(I7-I2);
