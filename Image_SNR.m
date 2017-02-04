clc; clear all;
% Kris's Code Notes:

% # of Bits
B = 7;

% Solve SNR for each B
for i = 1:B;
    SNR(i) = 10*log10(2^(2*i));
end

%Display in Log Graph
loglog(1:B,SNR(1:B));
title('SNR VS #Bits')
xlabel('# of Bits')
ylabel('SNR (db)') 