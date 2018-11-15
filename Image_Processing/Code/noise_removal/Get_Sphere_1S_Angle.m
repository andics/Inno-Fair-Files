function [ F1, R ] = Get_Sphere_1S_Angle( F, sigma )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

dim = size(F(:),1);
sigma1 = 0.01;
U = zeros(size(F))+0.5;
mu = 0;
N1 = imnoise(U, 'gaussian', 0, sigma1) - U;
N1 = N1 - mean(N1(:));
F1 = F + N1;
%imshow(N1);
sigma1 = var(N1(:));
sigma_bar = sigma + sigma1;
a = sigma/(sigma + 1);
b = 2;
c = sigma+sigma1;
D = b^2 - 4*a*c;
mu1 = -1000000000;
%(-b-sqrt(D))/2*a;
%Norm = norm(F1 - U, 'fro');
%Norm
mu1
F1 = F1 + mu1;
mu_bar = mu + mu1;
sigma_bar
mu_bar
R = sqrt((sigma_bar+mu_bar^2) * dim);
R
end

