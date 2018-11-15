function K = Whiten( U, im, sigma )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[m, n] = size(U);
for i = 1:m
    for j = 1:n
        K(i, j) = sqrt(log(U(i, j)\sqrt(sigma^2*2*pi)*(-2)*sigma^2));
    end
end
K = K + im; 
end

