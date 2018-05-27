function processed = threshold(raw, method, para)
methods={'poly'};
assert(ismember(method, methods),'Method not found');
method=str2func(method);
processed=method(raw, para);
end

function out = poly(raw, ord)
x=[1:1:length(raw)];
p=polyfit(x,raw,ord);
out=raw-polyval(p, x);
end