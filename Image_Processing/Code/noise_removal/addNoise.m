function NX = addNoise( X, max )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[m, n] = size(X);
NX = X + rand([m, n]).*max; 

end

