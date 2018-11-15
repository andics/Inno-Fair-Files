path('D:\Downloads\bin', path);
image1 = cameraman;
image2 = boat;
i = 0;
for sigma = 0.01:0.005:0.05;
i = i+1
noisy = imnoise(image2, 'gaussian', 0, sigma);
U = PDHGMp(noisy, 0.2, 0.5, sigma);
blurry = blur_gaussian_2D(noisy, 1.6);
sigma 
PSNR_image = [PSNR(image2, noisy) PSNR(image2, blurry) PSNR(image2, U) ]
MAE_image = [MAE(image2, noisy) MAE(image2, blurry) MAE(image2, U) ]
end