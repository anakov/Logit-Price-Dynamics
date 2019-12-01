% Loads Midrigan's price change statistics and histogram

% load acnielsen ; 
load dominicks ; % if version==1, disp('Dominick''s data'), end;
data = deltapR; clear deltapR;   %capital R indicates "regular"

MeanPriceChange     = mean(data);
MeanAbsPriceChange  = mean(abs(data));
MedAbsPriceChange   = median(abs(data));
MeanPriceIncrease   = mean(data(data>0));
MedianPriceIncrease = median(data(data>0));
MeanPriceDecrease   = mean(data(data<0));
MedianPriceDecrease = median(data(data<0));
StdPriceChanges     = std(data);
KurtPriceChanges    = kurtosis(data);
FracPriceIncreases  = sum(data>0)/length(data);
FracPriceDecreases  = sum(data<0)/length(data);
PctLessthan5        = sum(abs(data)<=0.05+eps^.5)/length(data);
PctLessthan25        = sum(abs(data)<=0.025+eps^.5)/length(data);

pdfdata = ksdensity(data,Pchangegrid);
pdfdata = pdfdata/sum(pdfdata);

data_nosmall = data(abs(data)>=0.01);
pdfdata_nosmall = ksdensity(data_nosmall,Pchangegrid);
%pdfdata_nosmall = hist(data_nosmall,61);
pdfdata_nosmall = pdfdata_nosmall/sum(pdfdata_nosmall);



% from Midrigan (2011)
%freqdata = 0.0265; % WEEKLY frequency of regular price changes: mean(changeR) (unweighted by quantity) 
freqdata = 1 - (1-0.0265)^4;   % = 10.2 - MONTHLY frequency of regular price changes
% more accurately it should be freqdata = 1 - (1-0.0265)^(365/7/12) = 0.11

% mean(deltapR) = 0.0160 % average regular price change (unweighted by quantity)
% weekly regular price inflation = 4.2604e-004

;