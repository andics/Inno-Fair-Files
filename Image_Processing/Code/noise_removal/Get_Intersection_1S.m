function [ S, R, B ] = Get_Intersection_1S( C, R1, D, R2 )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
len = norm(C-D, 'fro');
B = (D - C)/len;
a = (R2^2 - R1^2 + len^2)/(2*len^2);
a
S = D - a*(D-C);
len1 = norm(D-S, 'fro');
R = sqrt(R2^2-len1^2);
R_neshto_tam = R;
R_neshto_tam
%imshow(S-mu_bar);
norm(C-S, 'fro')
end

