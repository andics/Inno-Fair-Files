function dist = Calc_Dist( A, B )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
dist = sqrt(sum(sum(((A-B).^2))));

end

