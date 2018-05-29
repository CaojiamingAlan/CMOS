function intensity(image)

subplot(2,2,1);
title('raw');
imshow(image);

[height, width] = size(image);
x = [1:1:236];
y_column = sampling(image, 'column', 1200);
y_segment = sampling(image, 'segment', [9,1250]);
subplot(2,2,2);

plot(x,y_column);
title('column');

subplot(2,2,3);
plot(x,y_segment);
title('segment');

y_normalized = y_segment-polyval(polyfit(x,y_segment,2), x);
subplot(2,2,4);
plot(x,y_normalized);
title('threshold');

end

