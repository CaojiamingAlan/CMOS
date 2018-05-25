%%%%%%%%%%%%%%% video to images %%%%%%%%%%%%%%%%%%%%%%
head=VideoReader('V80524-155249.mp4');
frame_num=floor(head.Duration*head.FrameRate);
for i=1:frame_num
  frame = read(head, i);
  imwrite(frame,strcat(num2str(i),'.jpg'));
end
