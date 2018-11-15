function testSigma(imageFile, testLimit)
%Test different values of denoising sigma using non-refference metric
%systems

fontsize = 16;
fontsizeAxis = 11;

previousFig = gcf;

figure("Name", 'Testing denoising sigma values');
set(gcf,'units','normalized','outerposition',[0 0 1 1])

range = [0.001:0.001:testLimit];

for i=1:length(range)
    
sigma = range(1,i);

testImage = denoiseImage(imageFile, sigma);

plotDataNiqe(i,:) = [sigma, niqe(testImage)];
plotDataBrisque(i,:) = [sigma, brisque(testImage)];

end

plot(plotDataNiqe(:,1), plotDataNiqe(:,2),'color','r'); hold on;
plot(plotDataBrisque(:,1), plotDataBrisque(:,2),'color','b');
title('Graph of sigma values across NIQE and BRISQUE test scores', 'FontSize', fontsize);
xlabel('Sigma values', 'FontSize', fontsizeAxis);
ylabel('Score', 'FontSize', fontsizeAxis);
legend('y = NIQUE Score','y = BRISQUE Score');

figure(previousFig);

end

