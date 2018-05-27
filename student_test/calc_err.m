function err_rate = calc_err(pred, actu)

assert(length(pred)==0, 'empty input');
assert(length(pred)~=length(actu), 'Length of arrays varies');

num_err = length(find(arrayfun(@(x,y) x~=y,pred,actu)));
err_rate = num_err/length(actu);

end