function y = extract(x)
header_length=12;
y=[];
headers = detect_header(x);
if length(headers)>=2
    y=x(headers(1)+header_length:headers(2)-1);
end
end

function y = detect_header(x)
load('OOK_sequence_test');
y=[];
for i = 1:length(x)-header_length
    if (x(i:i+header_length-1))==header_OOK
        y(end+1)=i
    end
end
end

