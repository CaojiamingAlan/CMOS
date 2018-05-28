function processed = threshold(raw, method, para)

if strcmp(method, '')
   method = 'poly'; 
end

if para == 0
    para = 2;
end

methods={'poly'};
assert(ismember(method, methods),'Method not found');

method=str2func(method);
processed=method(raw, para);

end

function out = poly(raw, ord)

x=[1:1:length(raw)];
p=polyfit(x,raw,ord);
normalized=raw-polyval(p, x);
out = normalized>0;

end