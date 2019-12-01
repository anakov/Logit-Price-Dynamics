function stop = optimprint(x,optimValues,state)
% Prints and stores to disk current parameter estimate

stop = false;
switch state
case 'iter'
      %FOR ADJTYPE 4, 5:
          %fprintf('\n Noise = %0.5g', x) 
      %OTHER CASES:
          fprintf('\n Parameter Vector = (%0.5g)', x)  
      
      fprintf('\n')  
      fprintf('\n')  
      load estiparam_v
      
      x_fval = [x_fval [x; optimValues.fval]];
      
      save estiparam_v  x_fval 
end
end

