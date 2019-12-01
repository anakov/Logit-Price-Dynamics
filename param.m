% Sets program execution and macro parameters

% PROGRAM EXECUTION PARAMETERS           
  adjtype      = 9;               % 1-SSDP; 2-Calvo; 3-FMC; 4-Wood-log 5-Wood-ent; 6-PPS; 7-ENT; 8-Nest-log;  9-Nest-ent
  version      = 1;               % program version: set 3 to estimate the model. Set 1 for calibrated parameters
  finegrid     = 0;               % choose fine (1) or coarse (0) grid
  accuracy     = 1;               % controls residual tolerance. Use 1 or more for dynamics
  showconverge = 1*(version<3);   % show convergence progress. Set to 0 when estimating (version 3)
  idioshocks   = 1;               % heterogeneity: 1-idio shocks; 0-fixed heterogeneity; -1 rep. agent
  
% AGGREGATE SHOCK AND POLICY PARAMETERS  
  mu    = infparam('Dominicks');  % long-run gross inflation target (check infparam.m for available options)
%  mus    = [0 2 10 20 40 80];
%  mu = (1 + mus(6)/100)^(1/12);
  phiR = 0.8;                     % monthly persistence of monetary policy shock 
  phiPI = 0;                      % inflation response coefficient in Taylor rule (set to 0 for money rule)
  phiC  = 0;                      % output response coefficient in Taylor rule
  phiA  = 0;                      % persistence of aggregate technology shock 
 
% DISCOUNT AND PREFERENCE PARAMETERS     
  beta = 1.04^(-1/12);            % MONTHLY time discount factor
  gamma   = 2;                    % CRRA coefficient
  chi     = 6;                    % labor supply parameter
  nu      = 1;                    % money demand parameter
  epsilon = 7;                    % elasticity of substitution among product varieties
  
% CONVERGENCE TOLERANCE LEVELS           
  tol = eps^.5/10^accuracy;       % convergence tolerance for Pidentity.m, V_iter.m, and Pdist_iter.m 

% INITIAL GUESS FOR REAL WAGE
  wflex = (epsilon-1)/epsilon;    % initial guess for real wage: flex-price, representative agent