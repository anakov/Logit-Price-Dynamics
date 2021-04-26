% Simulates quarterly inflation and growth

TT = 12*20;      % stochastic simulation (12 months*20 years) 
INITCONDIT=0;

data = xlsread('US_data.xls');

data_begin = 1947;
data_end = 2020;

high_infl_begin = 1968;
high_infl_end = 1984;

high_begin = 4*(high_infl_begin - data_begin);
high_end = 4*(high_infl_end - data_begin);

dataselect_high = high_begin:high_end;
dataselect_low = high_end:4*(data_end - data_begin);

if mu>(1 + mus(1)/100)^(1/12)
   dataselect = dataselect_high;
else
   dataselect = dataselect_low;
end  

gdpdef = data(dataselect,1)/100;
rgdp = data(dataselect,2);

growth_rgdp = rgdp(2:end)./rgdp(1:end-1)-1;


% SPECIFY MONEY SHOCK PROCESS for periods 1:TT
rng('default')

% shocksize = jacstep;
% scalefactor = 1/shocksize;

Rshocks = 0.75/400*randn(1,TT);   %simulating random history
TFPshocks = 0.007*randn(1,TT);

time1Rshock = Rshocks(1);
time1TFPshock = TFPshocks(1);

distsim;
if phiPI > 0, computeirf; else  computeirfM; end    % run Taylor rule or money growth shock

% convert to quarterly frequency
  C_pathQ = mean(reshape(C_path,3,TT/3));
  PI_pathQ = mean(reshape(PI_path,3,TT/3));
  
  growth_sim = C_pathQ(2:end)./C_pathQ(1:end-1)-1;
  infl_sim = 4*(PI_pathQ-1);
  correl_sim = corr(growth_sim',infl_sim(2:end)');
  
% gdp growth and delfator inflation quarterly s.d. during 1984-2008
%  std_gdp_growth = 0.00510;  % okay:  cgg_mpr_qje.wf1
%  std_infl       = 0.00246;  % okay:  cgg_mpr_qje.wf1 
 
 std_gdp_growth = std(growth_rgdp);
 std_infl = std(gdpdef);
 correl_data = corr(growth_rgdp,gdpdef(2:end));

% Print output
  fprintf('\n\n')  
  fprintf('Model implied 100 x std of quarterly inflation             : %0.3g\n',100*std(infl_sim))
  fprintf('Data 100 x std of quarterly deflator inflation             : %0.3g\n',100*std_infl)
  fprintf('Share of inflation variance explained                      : %0.3g%%\n', 100*std(infl_sim)/std_infl)
  fprintf('\n\n') 
  fprintf('Model implied 100 x std of quarterly output growth         : %0.3g\n',100*std(growth_sim))
  fprintf('Data 100 x std of quarterly output growth                  : %0.3g\n',100*std_gdp_growth )
  fprintf('Share of output variance explained                         : %0.3g%%\n',100*std(growth_sim)/std_gdp_growth)
  fprintf('\n\n')
  fprintf('Model correlation of gdp growth with inflation             : %0.3g\n', correl_sim)
  fprintf('Data correlation of gdp growth with inflation              : %0.3g\n', correl_data)
  fprintf('\n\n')
  
  
% Plots
  figure(100)
  plot(growth_rgdp)
  hold on
  plot(gdpdef)

  figure(101)
  plot(growth_sim)
  hold on
  plot(infl_sim)
  