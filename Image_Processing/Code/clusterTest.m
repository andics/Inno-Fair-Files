function  clusterTest()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

mu = [2 2];
sigma = [1 1];
size(sigma)
rng default  % For reproducibility
R = mvnrnd(mu,sigma,10)

end

