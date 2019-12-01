function lambda = adjustment(adjtype, L, ksi, alpha, lbar)
% Returns matrix of adjustment probabilities as a function of the state

switch adjtype
    case 1                    % SSDP 
        aL = (alpha./L).^ksi;                          
        lambda = lbar./((1-lbar)*aL+lbar);             
    case 2                    % CALVO
        lambda = lbar*ones(size(L)) ;
    case {3,6,7}              % MC, PPS, ENT: INDICATOR FUNCTION L>=adjcost
        lambda = lamcontin_indicator(L);
    case {4,5}                    % WOOD-LOG and WOOD-ENT
        argexp = (alpha-L)/ksi;      %our model says alpha=0, tho Woodford allows alpha>0.
        lambda = lbar./((1-lbar).*exp(argexp) + lbar); 
    case {8,9}                    % NESTED LOGIT and NESTED ENTROPY with interpolation 
        argexp = -L/ksi;
        lambdaW = lbar./((1-lbar).*exp(argexp) + lbar); 
            
        nr = size(argexp,1);
        argexpinterp = interp1((1:nr)',argexp,(0.5:0.1:nr+0.5)','linear','extrap');
                
        lambdaSmoothBIG = lbar./((1-lbar).*exp(argexpinterp) + lbar); 
        for i = 0:nr-1
          lambdaSmooth(i+1,:) = mean(lambdaSmoothBIG(i*10+1:i*10+11,:));
        end
        weightS = 1./(1+argexp.^2);           %MUST ENSURE THIS IS POSITIVE!!!!
        lambda = (1-weightS).*lambdaW + weightS.*lambdaSmooth;
        
    case 0
        lambda = atan(alpha*L/max(max(L)))/atan(alpha);
    case -1
        lambda = min(1, (L/alpha).^ksi);
end  

