function M = Ball_proj( P, S, R )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

vec = P-S;
len = norm(vec, 'fro');
if (len < R) 
    M = P;
else M = (R/len)*vec + S;

end

