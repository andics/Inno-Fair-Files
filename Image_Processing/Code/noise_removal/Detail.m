function DetX = DoubleX( X )

curr = double(0);
[m, n] = size(X);
DetX = zeros(round(m*2), round(n*2));
for i = 1:m
    for j = 1:n
        if (mod(i, 2) > 0 && (mod(j, 2) > 0))
            curr = X(i, j);
        end
        DetX(i, j) = curr;
    end
end
imnoise(X, 'gaussian', 0.01);
end