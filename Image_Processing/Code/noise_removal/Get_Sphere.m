function [ F_next, R, sigma_bar ] = Get_Sphere( F_n, sigma_prev, sigma_n )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
sigma_bar = sqrt(sigma_prev^2 + sigma_n^2);
dim = size(F_n(:));
R = sigma_bar * sqrt(dim);

end

