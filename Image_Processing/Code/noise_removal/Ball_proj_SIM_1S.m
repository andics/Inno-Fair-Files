function M = Ball_proj_SIM_1S( P, S, R, B )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
[k,m,n] = size(B);
proj = P;
    vec = proj-S;
    proj = P - sum(dot(vec, B)) * B;
vec = proj-S;
len = norm(vec, 'fro');
%if (len < R) 
 %   M = P;
%else
    M = (R/len)*vec + S;

end

