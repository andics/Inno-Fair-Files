function M = Ball_proj_SIM( P, S, R, B )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
[k,m,n] = size(B);
proj = P;
for i = 1:k 
    vec = proj-S;
    proj = P - sum(dot(vec, reshape(B(i,:),m,n))) * reshape(B(i,:,:),m,n);
end
vec = proj-S;
len = norm(vec, 'fro');
%if (len < R) 
 %   M = P;
%else
    M = (R/len)*vec + S;

end

