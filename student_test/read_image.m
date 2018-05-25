clc;
clear;
close all;
load('OOK_sequence_test.mat'); % load the parameters

% header_length: the length of header is 12 bits
% header_OOK: the header signal
% OOK_pack_length: the length of header+payload
% sequence_OOK: the complete sequence (only payload included and without repetition)

% About the camera
% frame rate: 30 frame per second
% resolution: 1080 x 1920
% blind time: about 30% of the frame duration
% each bit corresponds to 4.5 rows of the image

% For the final result, we care about the bit error rate (BER), i.e. the
% ratio of the number of the wrongly detected bits and the number of the
% total bits.

% For the image processing functions or the polynomial fitting functions that you need, just google it.
for index= 5:25
    
    %% read image 
    pic_index = num2str(index);
    s=strcat(pic_index,'.jpg'); 
    A=imread(s); % read image
    Agray=rgb2gray(A); % gray image
    [row,~] = size(Agray); 
    %%figure,imshow(Agray);
    imwrite(Agray,strcat('gray_scale/',num2str(index),'_gray.jpg'));
end