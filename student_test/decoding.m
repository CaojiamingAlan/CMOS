images=cell(21,1)
for index=5:25
  pic_index = num2str(index);
  s=strcat('gray_scale/',num2str(index),'_gray.jpg');
  images{index-4,1}=imread(s);
end
x=ones(1,1080);
y=images{1,1}(:,90);
for i = 1:1080
    x(1,i)=i;
end
plot(x,y)