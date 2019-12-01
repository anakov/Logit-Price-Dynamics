% Gets value function by iteration on discrete grid
% version 17 april 2008
global fzeroiter 
VDIFF=inf;                                                 % reset difference in value function
Viter=0;                                                   % reset counter
fzeroiter=fzeroiter+1;

while VDIFF>tol && Viter<10000                             % iterate to convergence of V 
  Viter=Viter+1;                                           % increment counter
  if rem(Viter,100)==0  && showconverge                     % report convergence progress
     progreport(adjtype,finegrid,fzeroiter,VDIFF,Viter); 
  end

% Time t+1 values
  if adjtype>5
     logitprobMAT = logitprob(V, noise, wbar);
     EV = sum(logitprobMAT.*V);
     relentropy = ones(nump,1)*(log(nump) + sum(logitprobMAT.*log(max(logitprobMAT,eps^.5))));
         %NOTE relentropy is conditional on k: so EACH ROW IS THE SAME.
  else 
     [EV, pstar] = M_pStar(V, Pgrid, mu);                 % quadratic value function interpolation 
     relentropy = [];
     logitprobMAT = Pmatrix(pstar,Pgrid,pstep);  
         %This gives probabilites of each p, conditional on a.
         %CALLING THIS logitprobMAT EVEN THOUGH IT IS NOT DERIVED FROM LOGIT.
  end
  
  adjcost = cost(adjtype, alpha, noise, relentropy);
  
  D = ones(nump,1)*EV - V - wbar*adjcost;                                % D is the expected gain from adjustment (can be negative)
  Dopt = ones(nump,1)*max(V) - V - wbar*adjcost;                         % Dopt is the gain from adjustment to rational optimum
  
  lambda = adjustment(adjtype, D/wbar, ksi, alpha, lbar);
  
  timecost = timingcost(adjtype, lbar, ksi, lambda);      %NEED TO CALCULATE ARGUMENTS OF THIS FUNCTION
  
      
  CONTINVALUE = V + D.*lambda - wbar*timecost;   
  
% Time t values
  iterV = PAYOFFMAT + beta*RECURSEMAT'*CONTINVALUE*TRANSMAT;  % iterV is current payoff plus disc. continuation value
 
  VdifMin = min(min(iterV-V));                             % minimum difference 
  VdifMax = max(max(iterV-V));                             % maximum difference
  VDIFF = VdifMax-VdifMin;                                 % distance between max and min difference
 % VDIFF = max(max(abs(iterV-V)));                       % change in value function (sup norm)
  V = iterV;                                             % updating V
 
end


 V = V + beta/(1-beta)*(VdifMax+VdifMin)/2;              % vertical shift of value function once shape has converged

  
