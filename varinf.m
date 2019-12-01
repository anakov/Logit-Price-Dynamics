clear STATEHISTORY; clear JumpHistory 
% Computes variance decomposition and Phillips curve regression

disp(sprintf('\n'))  
TT = 3*33;      % stochastic simulation 
INITCONDIT=0;

% SPECIFY MONEY SHOCK PROCESS for periods 1:TT
randn('state',0)
shocksize = jacstep;
scalefactor = 1/shocksize;
Rshocks = [shocksize *randn(1,TT)];  %#ok<NBRAK> %simulating random history
time1Rshock = Rshocks(1);

TFPshocks = zeros(1,TT);
time1TFPshock = TFPshocks(1);

distsim;
if phiPI > 0, computeirf; else  computeirfM; end    % run Taylor rule or money growth shock

if rem(TT,3)==0 
  
% convert to quarterly frequency
  C_pathQ = mean(reshape(C_path,3,TT/3));
  PI_pathQ = mean(reshape(PI_path,3,TT/3));
  stdPIq = scalefactor*std(PI_pathQ);
  stdPI = scalefactor*std(PI_path);
   
end  
[stdPIq stdPI scalefactor*std(Rshocks)]