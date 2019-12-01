function mu = infparam(x)
% Loads a selection of money growth rates to choose from

switch x
    
case 'ACNiel'  
    %mu = 0.999831;      % AC Nielsen inflation (TIME UNIT)
                         % (roughly zero inflation)
case 'Dominicks'
    %mu = 1+4.2604e-004; % Dominick's WEEKLY regular price inflation
    mu = (1+4.2604e-004)^4; % Dominick's MONTHLY regular price inflation
                        % (2.07% annual)
case 'GLlow'  
    mu = 1.0064^(1/3);  % GL07 baseline MONTHLY money growth (2.58% annual)
case 'GLhigh' 
    mu = 1.21^(1/3);    % GL07 high MONTHLY money growth (114.36% annual) 
case 'GanLow' 
    mu = 1.0037;        % MONTHLY Gagnon low (4.53% annual)
case 'GanMed' 
    mu = 1.0214;        % MONTHLY Gagnon medium (28.93% annual)
case 'GanHi'  
    mu = 1.0416;        % MONTHLY Gagnon high (63.08% annual)
case 'UShigh' 
    mu = 1.10^(1/12);   % MONTHLY US high in the 1970s (10% annual)
otherwise
    mu = str2num(x);      
end
    