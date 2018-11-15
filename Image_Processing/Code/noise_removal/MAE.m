function X = MAE( F_true, F_den )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

[m, n] = size(F_true);
X = sum(sum(abs(F_true - F_den)))/(m*n);

end

