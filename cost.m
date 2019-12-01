function adjcost = cost(adjtype, alpha, noise, relentropy)
% Returns adjustment cost to be subtracted from profit flow
% "cost" refers to COST OF PRICE ADJUSTMENT: menu or information cost for choosing p.

switch adjtype
    case {1,2,4,5,6,8,0,-1}   % Calvo, SSDP, PPS, Wood-log, Wood-ent
      adjcost = 0;       % Wood-ent has an entropy cost, but it is not the cost of choosing p:
                         %  It is instead the cost of choosing whether to adjust (which is calculated elsewhere).
    case 3               % FMC
      adjcost = alpha;                               
    case {7,9}           % ENT and Nest-ENT
      adjcost = noise*relentropy;              
    
end  
     

