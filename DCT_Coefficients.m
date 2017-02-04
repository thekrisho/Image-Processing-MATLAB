clc; clear;

N = 8;
u = 0;
k = zeros(N,N);

% Task 1.1
for u = 0:N-1;
    for i = 0:N-1;
        r(u+1,i+1) = alph(u,N) * DCTcos(i,u,N);  
    end
     figure(1);
     subplot(4,2,u+1), bar(r(u+1,:)), title(['u = ' num2str(u) '']); 
end











