clc; clear;

N = 8;
n = 8;
u = 0;

I = imread('Barbara.jpg');

r1 = zeros(N,N);

for u = 0:N-1;
    for i = 0:N-1;   
           r1(u+1,i+1) = alph(u+1,N)*DCTcos(u,i,N); 
    end
end

r2 = transpose(r1);

for temp1 = 1:N;
    for temp2 = 1:N;
            r3(:,:,temp1,temp2) = r1(:,temp1)*r2(temp2,:);
    end
end

r4 = zeros(N*n,N*n);

for y = 1:N*N;
    for x = 1:N*N;
        for j = 1:N;
            for i = 1:N;
                r4(y,x) = 
            end
        end
    end
end

r4((((y-1)*N)+1):(((y-1)*N)+1) + (N-1),(((x-1)*N)+1):(((x-1)*N)+1) + (N-1)) = r3((((y-1)*N)+1):(((y-1)*N)+1) + (N-1),(((x-1)*N)+1):(((x-1)*N)+1) + (N-1),y,x);

i = 0;
xiter = 1;
xlim = n-(N-1);
ylim = xlim;


while(i < 12)
    
for y = 0:N;
    for x = 0:N;
        r4(((i*N)+1)+y,x+1) = r3(y+((i*N)+1),x+1,i,xiter);
    end
end

if xiter == n/N;
    i = i+1;
else
    xiter=xiter+(1);
end
    
end

for y = 1:N:(N^3)
     for x = 1:N:(N^3)
        for j = 1:(N)
            for i = 1:(N)
                r4(y,x) = r3(j,i,y,x);
                x = x+1;
            end
            y = y+1;
        end
    end
end

imshow((r4*127.5)+127.5);












