%Lab 2

clc;
clear all;

% r=imread('cat.jpg');
% info=imfinfo('cat.jpg');


%Negative Transform (Negatron)

% r=[0:255];
% c=-1;
% b=100;
% 
% s=(c.*r)+b;
% plot(r,s);


%Gamma Transform (Gamatron)

% r=[0:255];
% gam=[0.5, 0.1, 2, 10];
% 
% for i=1:4;
%     c(i)=(max(r)) / (255.^gam(i));
% end
% 
% 
% s1=c(1).*(r).^gam(1);
% s2=c(2).*(r).^gam(2);
% s3=c(3).*(r).^gam(3);
% s4=c(4).*(r).^gam(4);
% 
% plot(r,s1,r,s2,r,s3,r,s4);

% #2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% figure(1)
% % Original
% r=imread('Cameraman256.png');
% subplot(1,3,1), imshow(r)
% 
% c=1;
% b=60;
% %Linear
% s=(c.*r)+b;
% subplot(1,3,2), imshow(s)
% %imadd
% z = imadd(r,60);
% subplot(1,3,3), imshow(z)
% 

%#3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% r=imread('Cameraman256.png');
% 
% count1 = 0;
% count2 = 0;
% 
% m1 = max(r(:))
% m2 = min(r(:))
% 
% 
% for col = 1:256
%     for row = 1:256
%         if r(row,col)== m1
%             count1=count1 + 1;
%         elseif r(row,col)== m2
%             count2=count2 + 1;
%         end
%     end
% end
% 
% count1
% count2

%#4 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% figure(2)
% r=imread('tire.tif');
% subplot(1,3,1), imshow(r)
% 
% c=(1);
% b=255;
% 
% s=b-r;
% subplot(1,3,2), imshow(s)
% 
% s=imcomplement(r);
% subplot(1,3,3), imshow(s)

%#5 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% r=imread('tire.tif');   % Read Image
% gam=[0.4,1,3];          % Define Gama
% 
% Convert Image array to double 
% s1=im2double(r, 'indexed');
% s2=im2double(r, 'indexed'); 
% s3=im2double(r, 'indexed'); 
% 
% Compute 'C' values for each gamma
% for i = 1:3;
%     c(i)=(255) / (255.^gam(i));
% end
% 
% Apply Gamma transform
% for col=1:205;
%     for row=1:232;
%         s1(col,row) = c(1).*s1(col,row).^gam(1);
%         s2(col,row) = c(2).*s2(col,row).^gam(2);
%         s3(col,row) = c(3).*s3(col,row).^gam(3);
%     end
% end
% 
% Reconvert back to uint8 for tiff
% s1=uint8(s1);
% s2=uint8(s2);
% s3=uint8(s3);
% 
% Display Image;
% figure(1)
% subplot(1,3,1), imshow(s1)
% subplot(1,3,2), imshow(s2)
% subplot(1,3,3), imshow(s3)

%#6 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% r=imread('tire.tif');   % Read Image
% c = [1,200,50]
% 
% 
% % Convert Image array to double 
% s1=im2double(r, 'indexed');
% s2=im2double(r, 'indexed');
% s3=im2double(r, 'indexed');
% 
% 
% % Apply Gamma transform
% for col=1:205;
%     for row=1:232;
%         s1(col,row) = 5*log(1+  s1(col,row) );
%         s2(col,row) = 10*log(1+  s2(col,row) );
%         s3(col,row) = 20*log(1+  s3(col,row) );
%     end
% end
% 
% 
% % Reconvert back to uint8 for tiff
% s1=uint8(s1);
% s2=uint8(s2);
% s3=uint8(s2);
% 
% % Display Image;
% figure(1)
% subplot(1,3,1), imshow(s1)
% subplot(1,3,2), imshow(s2)
% subplot(1,3,3), imshow(s3)

%#8 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% % Read Image
% r=imread('tire.tif'); 
% 
% % Define Threshold levels
% lowthresh = [0,100,255];
% 
% % Convert Image array to double 
% s1=im2double(r, 'indexed');
% s2=im2double(r, 'indexed');
% s3=im2double(r, 'indexed');
% 
% % Negative TX Params
% c=(1);
% b=255;
% 
% % Apply Transform to Pixels
% 
% 
%     for col=1:205;
%         for row=1:232;
%             % Test for smallest threshold
%             if s1(col,row) < lowthresh(1);
%                 s1(col,row) = b - s1(col,row);
%                 s2(col,row) = b - s2(col,row);
%                 s3(col,row) = b - s3(col,row);
%             % Test for second largest threshold
%             elseif s1(col,row) < lowthresh(2);
%                 s2(col,row) = b - s2(col,row);
%                 s3(col,row) = b - s3(col,row);
%             % Test for largest threshold
%             elseif s1(col,row) < lowthresh(3);
%                 s3(col,row) = b - s3(col,row);
%             end
%         end
%     end
% 
% % Reconvert back to uint8 for tiff
% s1=uint8(s1);
% s2=uint8(s2);
% s3=uint8(s3);
% 
% % Display Image;
% figure(1)
% subplot(1,3,1), imshow(s1);
% subplot(1,3,2), imshow(s2);
% subplot(1,3,3), imshow(s3);

%#9%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% % Create sub image (2x2 Matrix) 
% M = 2;  %ROWS
% N = 2;  %COLS
% 
% I = [4 2;  % 1 3
%      3 6]; % 2 4
% 
% % Pixel Desired
% d = [1.7, 1.2]; %[x,y]
% 
% % Nearest Pixel Percentage
% a1 = M - d(1);
% a2 = d(1) - 1;
% b1 = M - d(2);
% b2 = d(2) - 1;
% 
% % Find Nearest X axis Pixel 
%     if a1 < 0.5;
%         nearX1 = I(3);
%         nearX2 = I(4);
%         farX1 = I(1);
%         farX2 = I(2);
%     else
%         nearX1 = I(1);
%         nearX2 = I(2);
%         farX1 = I(3);
%         farX2 = I(4);
%     end
% 
% % Interpolate    
% a = (nearX1.*a2) + (farX1.*a1);
% b = (nearX2.*a2) + (farX2.*a1);
% 
% % Find Nearest Y axis Pixel
%     if a < 0.5;
%         nearX1 = b;
%         farX1 = a;
%     else
%         nearX1 =a
%         farX1 = b;
%     end
%     
% % Interpolate
% c =(nearX1.*b1)+(farX1.*b2)

%#10%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 I = [(1:255),(1:255)];
 imshow(I)

%#11%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% % Read Image
% r=imread('tire.tif');  
% 
% % Set Params
% m = mean2(r);
% e = [4, 5, 10];
% 
% % Convert Image array to double 
% s1=im2double(r, 'indexed');
% s2=im2double(r, 'indexed');
% s3=im2double(r, 'indexed');
% 
% % Apply Contrast transform
% s1=1./(1 + (m./(s1)).^e(1));
% s2=1./(1 + (m./(s2)).^e(2));
% s3=1./(1 + (m./(s3)).^e(3));
% 
% % Display Image;
% figure(1)
% subplot(1,4,1), imshow(r)
% subplot(1,4,2), imshow(s1)
% subplot(1,4,3), imshow(s2)
% subplot(1,4,4), imshow(s3)
% 
% 














