% Sets idiosyncratic shock and adjustment parameters
%rho   = 0.95^(7/30); % Blundell and Bond (2000): 0.5 annual = 0.95 monthly --> 7/30 for WEEKLY.
rho = 0.95;          % Blundell and Bond (2000): 0.5 annual = 0.95 MONTHLY
stdMC = 0.06;        % Eichenbaun, Jaimovich, Rebelo (2009): 
                     % stdMC = 0.06 (NBER WP13829 Table 2)
                     
%noise refers to noise in PRICE decision
%ksi refers to noise in TIMING decision
%   BOTH ARE CALLED KAPPA IN THE PAPER
                     
                     
switch adjtype            
    
   case 1  % SSDP (JME calibration)
        lbar = 0.10892; ksi = 0.29367; alpha = 0.03108;
        rho = 0.88115; stdMC = 0.14742;

   case 2 % CALVO 
        if version<3
        lbar  = 0.10;                    
        end
        ksi = []; alpha = 0;
      
   case 3 % MENU COST  
        if version<3
        alpha = 0.00808650443112;         
        end
        ksi = []; lbar = [];

   case 4 % WOODFORD-LOGIT
        if version<3   
        ksi =  0.0050838;   
        lbar = 0.044302;  
        %alpha = 0.02; 
        end
        alpha = 0;    %pure logit version of Woodford has NO adj cost
        noise = 0;
        
   case 5 % WOODFORD-ENT
        if version<3   
        ksi =  0.0079873;   
        lbar = 0.045384;  
        %alpha = 0.02; 
        end
        alpha = 0;    %pure logit version of Woodford has NO adj cost
        noise = 0;
        
   case 6 % PPS        
        if version<3
        %noise = 0.038182374403334;  % grid with pstep=0.02     % noise = 0.042760772863787; % on old grid
        noise = 0.049094;   %from estimate_pps.m, 28/04/12, from [0.002,0.2].
        end
        alpha = 0; ksi = []; lbar = [];   
   
   case 7 % ENT aka PPS CONTROL
        if version<3
        %noise = 0.004094663384698;  % grid with pstep=0.02     % noise = 0.004953755120325; % on old grid
        %noise = 0.0043849;   %from estimate_pps.m, 28/04/12, from [0.002,0.2].
        noise = 0.0043829;   %from estimate_pps.m, 28/04/12, from [0.002,0.2].
        end
        alpha = []; ksi = []; lbar = [];   
        
   case 8 % NESTED LOGIT  
        if version<3      
        %noise =  0.048868065749246; % with rho 0.95 weekly: 0.066038139067016;
        %noise = 0.005;
        %lbar =   0.054763959347898; % with rho 0.95 weekly: 0.052088399924356;
        noise = 0.013437;  %from estimate_nested.m 28/04/12.
        lbar = 0.082722;   %from estimate_nested.m 28/04/12.
        ksi = noise;
        end
        alpha = []; 
        
   case 9 % NESTED ENTROPY COSTS 
        if version<3      
                
        % noise = 0.062247579605313; % from estimate without price changes less than 5% (with smoothing)
        % lbar = 0.184454581043167; % from estimate without price changes less than 5% (with smoothing)
        
        %noise = 0.027400586030652; % without price changes less than 1% without smoothing
        %lbar =  0.213422173287564; % without price changes less than 1% without smoothing

        noise = 0.0176749;     % baseline
        lbar = 0.223438;       % baseline 
        ksi = noise;           % baseline
        
        %noise = 0.0168;     % on estimated grid
        %lbar = 0.359;       % on estimated grid
        %ksi = noise;
        
        %noise = 0.048075837325516;
        %lbar = 0.134269726493387;
        %ksi = 0.148863936078637;

        end
    
        alpha = []; 
        
        
   case 0 % ATAN
        if version<3
        alpha = 1;         
        end
        ksi = []; lbar = [];
   
   case -1 
        if version<3
        alpha = 0.01;
        ksi = 1;
        end
        lbar = [];
end