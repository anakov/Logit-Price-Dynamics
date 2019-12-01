function adjcost = timingcost(adjtype, lbar, timenoise, lambda)
% Returns adjustment cost to be subtracted from profit flow
% "cost" refers to COST OF CHOOSING TIMING OF ADJUSTMENT.

switch adjtype
    case {1,2,3,4,6,7,8,0,-1}                          % Calvo, SSDP, MC, Wood-log, PPS, ENT, Nest-log
      adjcost = zeros(size(lambda));       
      
    case {5,9}                                  %Wood-ENT, Nest-ENT
      adjcost = timenoise * (lambda.*log(max((lambda/lbar),eps^.5)) + (1-lambda).*log(max((1-lambda)/(1-lbar),eps^.5))) ;              
    
end  
     
