L = 0:0.001:1;
a = 0.05;
for b = 0.1:0.1:10
    l =  min(1,(L/a).^(b));
    plot(L,l)
    hold on
end


