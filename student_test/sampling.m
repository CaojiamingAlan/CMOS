function sampled_data = sampling(image, method, para)

if strcmp(method, '')
   method = 'column'; 
end

%Set of methods, to be extended
methods = {'column', 'segment'};
assert(ismember(method, methods),'Method not found');

method=str2func(method);
sampled_data=method(image, para);

end

function samp_rate = calc_samp_rate(image)
samp_rate = 4.5685;
end

function out = column(image, column_index)
out=[];
[height, width] = size(image);
samp_rate = calc_samp_rate(image);
num_of_samples = round(height/samp_rate);
for i = 1:num_of_samples
    out(i)=image(round(i*samp_rate),column_index);
end
end

function out = segment(image, para)
out = [];
[height, width] = size(image);
pieces = para(1);
column = para(2);
samp_rate = calc_samp_rate(image);
num_of_samples = round(height/samp_rate);
samples_per_segment = floor(num_of_samples/pieces);
steps = round((column - round(width/2))/floor((pieces-1)/2));

for i = 1:pieces-1
    for j = (i-1) * samples_per_segment + 1:i*samples_per_segment
        out(j)=image(round(j*samp_rate), column - abs(steps*(i-floor((pieces+1)/2))));
    end
end

%Length of the last segment varies
for j = (pieces-1) * samples_per_segment + 1:num_of_samples
    out(j)=image(round(j*samp_rate), round(width/2));
end
    
end




