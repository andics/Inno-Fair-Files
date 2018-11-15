function Lx = L( m )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
Lx = zeros(m, m);
for i = 1:m-1
    Lx(i, i) = -1;
    Lx(i, i+1) = 1;

end

