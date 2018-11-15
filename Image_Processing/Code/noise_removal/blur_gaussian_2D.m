function [U,K_l,K_r] = blur_gaussian_2D(F,sigma)
%--------------------------------------------------------------------------
%blurr Gaussian K \otimes K

[m,n] = size(F);
len = fix(3*sigma) + 1;

%normalized gaussfilter
gaussfilter = 1/(sigma*sqrt(2*pi)) * exp(-(0:len).^2./(2*sigma^2));
normalizer = gaussfilter(1) + 2*sum(gaussfilter(2:len+1));
gaussfilter = gaussfilter/normalizer;
gaussfilter = [fliplr(gaussfilter(2:len+1)), gaussfilter];

%blurr matrix
H_l = toeplitz([gaussfilter(1),zeros(1,m-1)], [gaussfilter,zeros(1,m-1)]);
H_r = toeplitz([gaussfilter(1),zeros(1,n-1)], [gaussfilter,zeros(1,n-1)]);

%(Neumann boundary conditions)
K_l = H_l(:,len+1:m+len);
K_l(1:len,1:len) = K_l(1:len,1:len) + fliplr(H_l(1:len,1:len));
K_l(m-len+1:m, m-len+1:m) = K_l(m-len+1:m, m-len+1:m) + fliplr(H_l(m-len+1:m, m+len+1:m+2*len));
K_l = sparse(K_l);

K_r = H_r(:,len+1:n+len);
K_r(1:len,1:len) = K_r(1:len,1:len) + fliplr(H_r(1:len,1:len));
K_r(n-len+1:n, n-len+1:n) = K_r(n-len+1:n, n-len+1:n) + fliplr(H_r(n-len+1:n, n+len+1:n+2*len));
K_r = sparse(K_r);


U = K_l*F*K_r';