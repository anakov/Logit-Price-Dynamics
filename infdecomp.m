%infdecomp.m: inflation decomposition.
% Called inside computeirfM.m.
%
% Calculates decomposition of inflation into intensive, extensive, selection effects

%The steady state objects needed for this calculation are:
%   Pdisteroded: beginning-of-period distribution
%   lambda: the whole function lambda(p,a), nump x nums
%   Pdistans: matrix of desired LOG price adjustments (pstar-Pgrid), nump x nums 

format compact

%period in which money shock occurs - must be same as in "irf.m"
if exist('shocktime','var')
   if Rshocks(shocktime)>0
      d_shock = d_R_path(shocktime);
   elseif TFPshocks(shocktime)>0
      d_shock = d_A_path(shocktime);
   end
else
   d_shock = 1/scalefactor;
end
if d_shock == 0, d_shock = 1/scalefactor; end     % if there is no shock, take differences

% INFLATION IMPACT RESPONSE
%dPI_dmu = (PI_path(time)-mu) / d_shock; 
dPI_dmu = (PI_path(time)-(desiredinflation+1)) / d_shock;

% NAKOV-COSTAIN DECOMPOSITION WITH PRICE ERRORS:
% INFLATION = sum(sum(Pdistans.*(lambda - sum(sum(lambda .*Pdisteroded))).*Pdisteroded)) + ...
%    sum(sum(Pdistans.*Pdisteroded ))  *  sum(sum(lambda.*Pdisteroded )) + AVGERROR ;
%
% First three terms of decomposition are identical to decomp WITHOUT price errors:
%    Only difference is now we must add on AVG ERROR too!!
    
desiredinflation_diff = (desiredinflationnow-desiredinflation)/d_shock ;
intensivenow = fracadjusters*(desiredadjnow-desiredadj)/d_shock ;
extensivenow = desiredadj*(fracadjustersnow-fracadjusters)/d_shock;
intensive_path(time) = intensivenow ;
extensive_path(time) = extensivenow;
selection_path(time) = desiredinflation_diff-intensivenow-extensivenow;
error_path(time) = avgerrornow-avgerror;

if 0
  disp(sprintf('\n'))  
  disp(sprintf('INFLATION IMPACT : %0.3g ',dPI_dmu))
  disp(sprintf('AN decomp: %0.3g   intensive: %0.3g  extensive: %0.3g  selection  : %0.3g  avg error: %0.3g',...
                       [dPI_dmu, intensive_margin, extensive_margin, selection_effect, error_margin]))
end


% KLENOW-KRYVTSOV DECOMPOSITION
% inflation = freqpchanges*EPchange
% dfreqpchanges_dmu = (frac_adjusters_path(time) - freqpchanges) / d_shock;
% dAvPchange_dmu    = (AvPchange_path(time) - EPchange) / d_shock;
% 
% KKintensive = dAvPchange_dmu * freqpchanges;
% KKextensive = dfreqpchanges_dmu * EPchange ;
% KK_decomp = KKintensive + KKextensive ;

