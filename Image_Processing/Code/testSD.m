function testSD(imageFile, testLimit)
%Test different standard deviation values for deblurring and check which
%one produces the best score

fontsize = 16;
fontsizeAxis = 11;

previousFig = gcf;

figure("Name", 'Testing deblurring standarad deviation values');
set(gcf,'units','normalized','outerposition',[0 0 1 1])

range = [0.2:0.1:testLimit];

for i=1:length(range)
    
cSDPSF = range(1,i);

sizePSF = round(cSDPSF*6+1);

testImage = imageDeconv(imageFile, sizePSF, cSDPSF, 2);
testImage = normColorVal(testImage);

plotDataNiqe(i,:) = [cSDPSF, niqe(testImage)];
plotDataBrisque(i,:) = [cSDPSF, brisque(testImage)];

end

plot(plotDataNiqe(:,1), plotDataNiqe(:,2),'color','r'); hold on;
plot(plotDataBrisque(:,1), plotDataBrisque(:,2),'color','b');
title('Graph of standard deviation values across NIQE and BRISQUE test scores', 'FontSize', fontsize);
xlabel('Standard Deviation values','FontSize',fontsizeAxis);
ylabel('Score','FontSize',fontsizeAxis);
legend('y = NIQUE Score','y = BRISQUE Score');

figure(previousFig);

end

