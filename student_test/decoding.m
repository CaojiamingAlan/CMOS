load('OOK_sequence_test.mat')
images=cell(21,1);
image_sequence = cell(21,1);
blocks = cell(0);
sample_column = 1200;
ys = cell(21,1);

for index=5:25
  pic_index = num2str(index);
  s=strcat('gray_scale/',num2str(index),'_gray.jpg');
  images{index-4,1}=imread(s);
end
[height,width] = size(images{1,1});
sample_rate = 676/148;
num_of_samples = round(height/sample_rate);

x=ones(1,num_of_samples);
y=ones(1,num_of_samples);
for i = 1:num_of_samples
    x(1,i)=i;
end

for i = 1:21
    for j = 1:num_of_samples
        y(1,j)=images{i,1}(round(j*sample_rate),sample_column);
    end
    p = polyfit(x,y,2);
    y_normalized = y-polyval(p,x);
    image_sequence{i,1}=y_normalized>0;
    ys{i,1}=y_normalized;
end

for i = 1:21
    block = sampleing(image_sequence{i,1}, '', 1200);
    i
    if length(block)~=0
        blocks{end+1,1}=block;
    end
end



