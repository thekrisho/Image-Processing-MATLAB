clc; clear all;

% % Read Images
% I1=imread('bcitworks.jpg'); % Input Image
% I2=imread('peppers256.png'); % Output Image

I1=imread('bcitworks.jpg'); % Input Image
I2=imread('barbara.jpg'); % Output Image

% # of Intensities 
L = 256;
% Create map array
map = zeros(256,1);

% Solve Input Hist Equalization
for i = 1;
% Open Image, Calculate M x N
I=I1;
M = size(I,1);
N = size(I,2);
numofpixels = M * N;

% Number of intensities / bins in histogram
L = 256; 

% Create variables for table 
freq=zeros(256,1);      %nr
prob=zeros(256,1);      %Pr(r)
probcum=zeros(256,1);   %S=T(r)
cum=zeros(256,1);
input=zeros(256,1);

% Calculate Histogram and Probability 
for col = 1:M
    for row = 1:N
        % n(r) = Index pixel intensity and increment histogram level
        freq((I(col,row))+1) = freq((I(col,row))+1)+1;
        % Pr(r) = Probability of pixel intensity / total number of pixels
        prob((I(col,row))+1) = freq((I(col,row))+1)/numofpixels;
    end
end

% Reset summation
sum = 0; 

% Calculate Equalized Hist: s=T(r)=(L-1)*sum(Pr(rk))
for i = 1:size(prob)
   % Manage Sums as count increments 
   sum = sum + freq(i);
   % Just for tabulating dat
   cum(i) = sum;
   % Cumulative probability = sum / total number of pixels
   probcum(i) = cum(i) ./ numofpixels;
   % Equalization equation
   input(i) = (L-1) .* probcum(i);
   % Round for output
   input(i) = round(input(i));
end
end
pdfin = probcum;

% Solve Output Hist Equalization 
for i = 1;
% Open Image, Calculate M x N
I=I2;
M = size(I,1);
N = size(I,2);
numofpixels = M * N;

% Number of intensities / bins in histogram
L = 256; 

% Create variables for table 
freq=zeros(256,1);      %nr
prob=zeros(256,1);      %Pr(r)
probcum=zeros(256,1);   %S=T(r)
cum=zeros(256,1);
output=zeros(256,1);

% Calculate Histogram and Probability 
for col = 1:M
    for row = 1:N
        % n(r) = Index pixel intensity and increment histogram level
        freq((I(col,row))+1) = freq((I(col,row))+1)+1;
        % Pr(r) = Probability of pixel intensity / total number of pixels
        prob((I(col,row))+1) = freq((I(col,row))+1)/numofpixels;
    end
end

% Reset summation
sum = 0; 

% Calculate Equalized Hist: s=T(r)=(L-1)*sum(Pr(rk))
for i = 1:size(prob)
   % Manage Sums as count increments 
   sum = sum + freq(i);
   % Just for tabulating dat
   cum(i) = sum;
   % Cumulative probability = sum / total number of pixels
   probcum(i) = cum(i) ./ numofpixels;
   % Equalization equation
   output(i) = (L-1) .* probcum(i);
   % Round for output
  output(i) = round(input(i));
end
end
pdfout = probcum;

% Temp Variable
j = 1;

% Remap 
for i = 1:L;
     % Check for closest greater or equal value on output
     while pdfout(j) < pdfin(i);
         j=j+1;
     end
     % Write to map
     map(i) = j; 
     j = 1;
end

% Creat output image array 
I3 = uint8(zeros(size(I1,1),size(I1,2)));
for col = 1:size(I1,1);
    for row = 1:1:size(I1,2);
            I3(col,row) = map(I1(col,row)+1);
    end
end

figure
subplot(2,3,1), imshow(I1);
subplot(2,3,2), imshow(I2);
subplot(2,3,3), imshow(I3);
subplot(2,3,4), imhist(I1);
subplot(2,3,5), imhist(I2);
subplot(2,3,6), imhist(I3);


