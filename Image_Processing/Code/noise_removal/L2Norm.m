function M = L2Norm( F )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    G = Grad(F);
    M = sum(sum(G.^2));
end
