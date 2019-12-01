

%load nestent
%clear lambda_markup


one_minus_lambda_q = (1-lambda).^3.062395473197264;
lambda_q = 1 - one_minus_lambda_q;

numpoints = 25;
markupgrid = linspace(-0.15,0.15,numpoints);
for s=1:nums
    x = 0;
    for markup = markupgrid 
       x = x + 1; 
       
       pindex_hi = find(Pgrid > pstar(s)-markup,1,'First');
       if size(pindex_hi,1)==0, pindex_hi=nums; end
       
       pindex_lo = find(Pgrid < pstar(s)-markup,1,'Last');
       if size(pindex_lo,1)==0, pindex_lo=1; end
       
       lambda_markup(x,s) = 0.5*lambda_q(pindex_lo,s) + 0.5*lambda_q(pindex_hi,s);
    end
end
mean_lambda_markup = mean(lambda_markup,2);

cej_lambda_markup_lo = linspace(0.58, 0.175, (numpoints+1)/2);
cej_lambda_markup_hi = linspace(0.175, 0.53,(numpoints+1)/2);
cej_lambda_markup_hi = cej_lambda_markup_hi(2:end);

cej_lambda_markup = [cej_lambda_markup_lo cej_lambda_markup_hi];

if 0
    %set(0,'DefaultFigureWindowStyle','docked')  % docks all figures
    figure(2)
    plot(-markupgrid,mean_lambda_markup,'k')
    hold on
    plot(markupgrid,cej_lambda_markup,'r')
end




