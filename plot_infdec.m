% Plots impulse-response functions
%
%To run this independently for a single specification, first define countadj=0.


%alternating color for irf plots
% linescolorGrid = {'r.-','bo-','gs-'};  % linecol = 1, 2, 3 for 'r.-','gs-','bo-'
% if ~exist('linecol','var') || linecol==3; 
%      linecol=1;
% else
%      linecol=linecol+1;
% end;

set(0,'DefaultFigureWindowStyle','docked')  % docks all figures

MarkerSize = 5;
%countadj=0;
figure(11) 

%subplot(2,3,countadj+1)
subplot(1,4,countadj+1)
hold on
plot(intensive_path,linescolor,'MarkerSize', MarkerSize)
title('Intensive margin')
box off
xlabel('Months')
ylim([-0.05 2])

%subplot(2,3,countadj+2)
subplot(1,4,countadj+2)
hold on
plot(extensive_path,linescolor,'MarkerSize', MarkerSize)
title('Extensive margin')
box off
xlabel('Months')
ylim([-0.05 2])

%subplot(2,3,countadj+3)
subplot(1,4,countadj+3)
hold on
plot(selection_path,linescolor,'MarkerSize', MarkerSize)
title('Selection effect')
box off
xlabel('Months')
ylim([-0.05 2])

subplot(1,4,countadj+4)
hold on
plot(error_path,linescolor,'MarkerSize', MarkerSize)
title('Error margin')
box off
xlabel('Months')
ylim([-0.05 2])
