function extracted_data = extracting(input, header)

header_length = length(header);
headers = [];

assert(length(input)>header_length, 'input too short');

for i = 1:length(input)-header_length
    if (input(i:i+header_length-1))==header
        headers(end+1)=i;
    end
end

if length(headers)>=2
    for i = 1:length(headers)-1
        extracted_data(i,:)=input(headers(1)+header_length:headers(2)-1);
    end
else
    disp('Fail to find a complete block in image');
    disp(strcat('Headers deteced:', int2str(headers)));
    extracted_data = [];
end

end