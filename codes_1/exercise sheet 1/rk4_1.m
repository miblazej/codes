function x = rk4_1(t)
%calculation of number of steps important to fully simulate function
steps = length(t);
% initialization of variable used to integration process
x_init=[1;0];
x_vec = zeros(2,steps);
x_vec(:,1)=x_init;
h=0.5;
% integration with usage of rk4 integrator
for n = 1: steps
   k1=expl_integrator(t(1,n),x_vec(:,n));
   k2=expl_integrator(t(1,n),x_vec(:,n)+(h/2)*k1);
   k3=expl_integrator(t(1,n),x_vec(:,n)+(h/2)*k2);
   k4=expl_integrator(t(1,n),x_vec(:,n)+h*k3);
   x_vec(:,n+1) = x_vec(:,n)+(h/6)*(k1+(2*k2)+(2*k3)+k4);
end
% assigment of calculated value to output value
x = x_vec;
end

