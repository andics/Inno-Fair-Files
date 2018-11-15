function G = Grad( F )
    [m, n] = size(F);
    G = zeros(m, n);
    for i = 1:m-1
        for j = 1:n-1
            G(i, j) = sqrt((F(i+1, j) - F(i, j)).^2 + (F(i, j) - F(i, j+1)).^2);
        end
    end
    for i = 1:m-1
        G(i, n) = double(F(i+1, n) - F(i, n));
    end
    for i = 1:n-1
        G(m, i) = double(F(m, i+1) - F(m, i));
    end
    G(m, n) = 0.;
end