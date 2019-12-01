figure
for s=1:nums
    color_s=s/nums;
    plot(Pgrid-sgrid(s),lambda(:,s),'Color',[0 color_s color_s])
    hold on
end
xlim([-.25 .25]) 
xlabel('log(price)-log(cost)')
ylabel('Probability of adjustment')
title('Blue is high cost, black is low cost')


figure
for s=1:nums
    color_s=s/nums;
    plot(Pgrid-sgrid(s),logitprobMAT(:,s),'Color',[0 color_s color_s])
    hold on
end
xlim([-.25 .25]) 
xlabel('log(price)-log(cost)')
ylabel('Probability of prices')
title('Blue is high cost, black is low cost')