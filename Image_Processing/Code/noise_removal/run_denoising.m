%path('D:\Downloads\bin', path);
image = boat_part;
sigma = 0.1;
noisy = imnoise(image, 'gaussian', 0, sigma);
U = PDHGMp(noisy, 0.2, 0.5, sigma^2);
blurry = blur_gaussian_2D(noisy, 1.6);
PSNR_image = [PSNR(image, noisy) PSNR(image, blurry) PSNR(image, U) ]
MAE_image = [MAE(image, noisy) MAE(image, blurry) MAE(image, U) ]