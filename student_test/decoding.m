load('OOK_sequence_test.mat')
starting_index = 5;
num_of_images = 21;
images=cell(num_of_images,1);
image_sequence = cell(num_of_images,1);
blocks = [];
sample_column = 1200;
ys = cell(num_of_images,1);

for index = starting_index:starting_index + num_of_images - 1
    pic_index = num2str(index);
    s=strcat('gray_scale/',num2str(index),'_gray.jpg');
    images{index - starting_index + 1,1}=imread(s);
end

for index = 1:num_of_images
    disp(strcat('processing image',int2str(index)));
    out = sampling(images{index,1}, 'column', 1200);
    out = threshold(out, 'poly', 2);
    out = extracting(out, header_OOK);
    [num_blocks, block_length] = size(out);
    blocks(end + 1: end + num_blocks, 1:block_length) = out; 
end



