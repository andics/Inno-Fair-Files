function M = Spherical_proj( P, S, R )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

vec = P-S;
len = sqrt(vec(1)^2 + vec(2)^2);
M = (R/len)*vec;

end

