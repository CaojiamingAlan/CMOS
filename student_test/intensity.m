function intensity(image)

subplot(2,2,1);
title('raw');
imshow(image);

[height, width] = size(image);
x = [1:1:236];
y = sampling(image, 'column', 1200);
subplot(2,2,2);
title('sampled');
plot(x,y);

y_normalized = y-polyval(polyfit(x,y,2), x);
subplot(2,2,3);
title('threshold');
plot(x,y_normalized);

end

