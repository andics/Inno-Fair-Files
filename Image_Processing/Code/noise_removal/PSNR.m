function X = PSNR( F_true, F_denoised )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

[m, n] = size(F_true);
MAX_F = max(max(F_true));
MIN_F = min(min(F_true));
X = 10*log10((m * n) * (MAX_F - MIN_F)^2/(norm(F_true - F_denoised, 'fro')^2));

end

