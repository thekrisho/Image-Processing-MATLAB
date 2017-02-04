clc;
clear all;

% Open Image, Calculate M x N
I=imread('pentagon.tif');
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
   output(i) = round(output(i));
end

% Creat output image array 
I2 = uint8(zeros(size(I,1),size(I,2)));
for col = 1:M;
    for row = 1:N;
            I2(col,row) = output(I(col,row)+1);
    end
end

% Calculate New Histogram 
hist = zeros(1, L);
for col = 1:M;
    for row = 1:N;
        % n(r) = Index pixel intensity and increment histogram level
        hist((I2(col,row))+1) = hist((I2(col,row))+1)+1;
    end
end

% Create Table and fill with variables
dat=cell(256,6);
columnname =   {'Bin',     'Histogram', 'Probability', 'Cumulative histogram','CDF',    'Output'};
columnformat = {'numeric', 'numeric',   'numeric',     'numeric',             'numeric','numeric'};
columneditable = [false false false false false false];
for i=1:256  
    dat(i,:)={i,freq(i),prob(i),cum(i),probcum(i),output(i)};   
end

% Display table
figure(2)
t = uitable('Units','normalized','Position',[0.1 0.1 0.9 0.9], 'Data', dat,'ColumnName', columnname,'ColumnFormat', columnformat,'ColumnEditable', columneditable,'RowName',[]); 

% Display Images: Original, Algorithym, Function
figure(1)
subplot(2,2,1); imshow(I);
subplot(2,2,3); imshow(I2);

% Display Histograms: Original, Algorithym, Function
subplot(2,2,2); bar((1:L),freq);
subplot(2,2,4); bar((1:L),hist);



