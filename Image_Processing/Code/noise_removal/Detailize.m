function D = Detailize( U, step, sigma )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

[m, n] = size(U);
%Lx = L(m);
%Ly = L(n);
D = ones(2*m, 2*n)*(-1);
%Dy = zeros(2*m, 2*n);
%temp = zeros(m, n);
%Ux = Lx * U;
%Uy = U * Ly';
max = 3;

    for i = 0.:step:1.
    temp = (U>i);
    temp = temp.*(U<(i+step));
    for j = 1:m-1
        for k = 1:n-1
            p = temp(j, k);
            if p == 0 
                continue;
            end
            kernel = closest([j k], temp, max);
            for idx = 1:size(kernel, 1);
                x = kernel(idx, 1);
                y = kernel(idx, 2);
                val = U(x, y);
                diff = double(y-k)/double(x-j);
                dist = 2. * ceil((y - k)^2 - (x - j)^2);
                st = (val - U(j, k))/dist;
                p_bar_x = double(j);
                p_bar_y = double(k);
                D(j*2-1, k*2-1) = U(j, k);
                valX = U(j, k);
                if(p_bar_x == x)
                    while(p_bar_y ~= y)
                        p_bar_y = p_bar_y + 0.5;
                        D(p_bar_x*2, round(p_bar_y*2)) = valX;
                        valX = valX + st;
                    end
                end     
                while(p_bar_x ~= x)
                    p_bar_x = p_bar_x + 0.5;
                    p_bar_y = 0.5 * diff + p_bar_y;
                    if(round(2 * p_bar_y) - 2 * p_bar_y ~= 0.)
                        D(p_bar_x*2, floor(p_bar_y*2)) = valX + G(1, sigma);
                        D(p_bar_x*2, ceil(p_bar_y*2)) = valX - G(1, sigma);
                    else
                        D(p_bar_x*2, round(p_bar_y*2)) = valX;
                    end
                    valX = valX + st;
                end
                if(valX == 0)
                   valX 
                end
            end
            temp(j, k) = 0;
            j
            k
        end
    end
    for j = 2:m-1
       for k = 2:n-1
           if(D(j, k) ~= -1)
                continue;
           end
           subK = [D(j - 1, k-1) D(j, k) D(j + 1, k+1); D(j - 1, k) D(j, k) D(j + 1, k); D(j - 1, k+1) D(j, k+1) D(j + 1, k+1)];
           sTemp = (subK>0);
           n = sum(sum(sTemp));
           D(j, k) = sum(sum((subK.*sTemp).*G(1, sigma)))/n;
       end    
    end
    end
end

