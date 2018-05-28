function sampled_data = sampling(image, method, para)

if strcmp(method, '')
   method = 'column'; 
end

%Set of methods, to be extended
methods = {'column'};
assert(ismember(method, methods),'Method not found');

method=str2func(method);
sampled_data=method(image, para);

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

function samp_rate = calc_samp_rate(image)
samp_rate = 4.5685;
end


