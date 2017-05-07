%% variable declaration
clc;
clear variables;
x0=[1,0];
% t computation
k=0:1:19;
Ts=0.5;
t=k*Ts;
%calculation of damped oscilator with usage of ode45 function
[t1,x] = ode45('expl_integrator',t,x0); 
% calculation of damped oscilator with explicit euler scheme
x_explicit_euler=explicit_euler(t);
%% 1b calculation of damped oscilaotr with usage of rk_4 integrator
x_rk4=rk4_1(t);
% processing of data to suit it for data plot
x_explicit_euler=transpose(x_explicit_euler(:,1:20));
x_rk4=transpose(x_rk4(:,1:20));
%% plot of data
plot(t1,x(:,1),'g-o',t1,x(:,2),'g-o',t1,x_explicit_euler(:,1),'b--',t1,x_explicit_euler(:,2),'b--',t1,x_rk4(:,1),'r-*',t1,x_rk4(:,2),'r-*');
legend('ode45','ode45','Euler explicit','Euler explicit','rk_4','rk_4');
xlabel('time[s]');
ylabel('oscilation');
title('Simulation of behavoir of damped oscilator')
grid on;
%% 1c Implement the RK4 scheme as a CasADi function


