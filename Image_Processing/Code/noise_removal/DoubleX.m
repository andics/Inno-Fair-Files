function DetX = DoubleX( X )

curr = double(0);
[m, n] = size(X);
DetX = zeros(round(m*2), round(n*2));
for i = int32(1:m)
    for j = int32(1:n)
        curr = X(i, j);
        DetX(i*2 - 1, j * 2 - 1) = curr;
        DetX(i*2, j*2-1) = curr;
        DetX(i * 2 - 1, j * 2) = curr;
        DetX(i*2, j*2) = curr;
    end
end
addNoise(DetX, 0.2);
end