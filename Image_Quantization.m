clc; clear all;
% Kris's Code Notes:

% Read Image / Calculate Size
I = imread('barbara.jpg'); 
n = size(I,1); 
m = size(I,2); 
mn = m*n; % Number of Pixels (Size)
I1 = I;

% Min Max Values, (Pixel Intensity Range)
xmax = 0;
xmin = 255;
for i = 1:m;
    for j = 1:n
        if I(i,j) > xmax;
            xmax = I(i,j);
        end
        if I(i,j) < xmin;
            xmin = I(i,j);
        end
    end
end

% Solve Levels for # data of bits
B = [3 5];
L(B(1)) = 2^(B(1)); % 3 Bits 
L(B(2)) = 2^(B(2)); % 5 Bits

% Solve range between levels (Total Range of Levels/# of bits to represent)
D(B(1)) = (xmax-xmin)/L(B(1)); %32 Levels
D(B(2)) = (xmax-xmin)/L(B(2)); %8 Levels

% Quantize
r = round(D(3));
I2 =  r*(I1/r); % 3 bits
r = round(D(5));
I3 =  r*(I1/r); % 8 bits

% figure(1)
% subplot (1,3,1), imshow(I1), title('Quantized with  8 Bits');
% subplot (1,3,2), imshow(I3), title(['Quantized with ' num2str(B(2)) ' Bits']);
% subplot (1,3,3), imshow(I2), title(['Quantized with ' num2str(B(1)) ' Bits']);

% Error
err = abs(int16(I3) - int16(I1)); 
histogram(err); 

 

for i = 1:256
        I3(i)= round(D(5)) * round(i/D(5));
        I2(i)=i;
end
 
plot(I3, I2);
title('Reconstruction vs Decision Levels');
xlabel('Decision Levels');
ylabel('Reconstruction Levels');
