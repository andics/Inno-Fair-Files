clear all; load('testImages.mat');
images = {cameraman, boat, pepper, lena, boat_part};
PSNR_image = zeros(5,4,4);
MAE_image = zeros(5, 4, 4);
for i=1:5
    i
    j = -1;
    for sigma = 0.01:0.01:0.04
        k = 1;
        j = j+2;
        %sigma
        image = images{i};
        size(image)
        noisy = imnoise(image, 'gaussian', 0, sigma);
        sigma1 = sigma; %var(noisy(:) - image(:));
        sigma1
        U = PDHGMp(noisy, 0.2, 0.5, sigma1);
        blurry = blur_gaussian_2D(noisy, 1.6);
        U_SIM = SIM_1S(noisy, 0.2, 0.5, sigma1);
%         figure(j);
%         imshow(U);
%         figure(j+1);
%         imshow(U_SIM);
        PSNR_image(i,k,1) = PSNR(image, noisy);
        PSNR_image(i,k,2) = PSNR(image, blurry);
        PSNR_image(i,k,3) = PSNR(image, U);
        PSNR_image(i,k,4) = PSNR(image, U_SIM);
        MAE_image(i,k,1) = MAE(image, noisy);
        MAE_image(i,k,2) =  MAE(image, blurry);
        MAE_image(i,k,3) =  MAE(image, U);
        MAE_image(i,k,4) =  MAE(image, U_SIM);
        k = k+1;
    end     
end
save('SRSresults.mat');