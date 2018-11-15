function [ S, R, B ] = Get_Intersection( C, R1, B_prev, D, R2 )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
len = norm(C-D, 'fro');
B = B_prev;
B(end+1,:,:) = (D - C)/len;
a = (R2^2 - R1^2 + len^2)/(2*len^2);
S = D - a*(D-C);
len1 = norm(D-S, 'fro');
R = sqrt(R2^2-len1^2);
end

