function out = distance(in)
% Computes distance criterion for estimation
%
%CAN BE USED TO ESTIMATE VARIOUS VERSIONS OF THE MODEL.
%  
%SHOULD CHANGE THE SUBSET OF PARAMETERS CALLED IN THE ESTIMATION
%  depending on whether we are running estimate_pps.m, estimate_wood.m, or estimate_nested.m.

global noise alpha lbar ksi

%IT APPEARS THAT THIS CAN BE RUN WITH ANY SUBSET OF PARAMETERS SUBJECT TO ESTIMATION.


%TO ESTIMATE WOODFORD (4 or 5):
%ksi = in(1);
%lbar  = in(2);


%TO ESTIMATE PPS or ENT (6 or 7):
%noise = in ;

%TO ESTIMATE NESTED VERSIONS (8 or 9):
alpha = in(1);
ksi   = in(2);

%noise = in(1);
%lbar  = in(2);
%ksi   = in(3);


gess;    %gess calls param.m.
         %   adjparam.m sets params IF version<3. 
         %   When version=3 (estimating) SOME of the params are NOT set by adjparam.m.
         %   Check param.m or adjparam.m to see which parameters are controlled by estimation routine.
         
%out = length(denspchanges)*norm(freqnonzeropchanges-0.10); %+ norm(denspchanges-pdfdata);        

%out = sqrt(length(denspchanges))*norm(freqnonzeropchanges-freqdata) + norm(denspchanges-pdfdata_nosmall);     

out = norm(freqnonzeropchanges-freqdata) + norm(denspchanges-pdfdata)/sqrt(length(denspchanges)) + norm(flipud(mean_lambda_markup)-cej_lambda_markup')/sqrt(length(mean_lambda_markup));         

          %Since freqdata is a scalar and pdfdata is a vector of length n, 
          %   the norm of the latter is automatically sqrt(n) times larger
          %   than the norm of the former (cet par).
          %Hence scale first term by sqrt(n) for comparable weighting.
         