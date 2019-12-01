clc
global mu
inflations = [-10 0 2 10 20 30 40 50 60 70 80];
mus = (1+inflations/100).^(1/12); 
frequs = [];
avabspchanges = [];
fracs_increases = [];
for mu=mus
    gess
    frequs=[frequs 100*freqnonzeropchanges];
    avabspchanges=[avabspchanges 100*MeanAbsPchange];
    fracs_increases=[fracs_increases 100*fracPriceIncr];
end

frequs
avabspchanges
fracs_increases
