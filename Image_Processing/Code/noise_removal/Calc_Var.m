function var = Calc_Var( A, B )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
var = sum(sum(((A-B).^2))) / (size(A, 1)*size(A, 2));

end

