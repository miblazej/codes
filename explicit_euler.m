function x = explicit_euler(t)
%calculation of number of steps important to fully simulate function
steps = length(t);
% initialization of variable used to integration process
x_init=[1;0];
x_vec = zeros(2,steps);
x_vec(:,1)=x_init;
h=0.125;
% integration with usage of explicit euler integrator
for n = 1: steps
   x_vec(:,n+1)= x_vec(:,n) + h * expl_integrator(t(1,n),x_vec(:,n));
end
% assigment of calculated value to output value
x = x_vec;
end

