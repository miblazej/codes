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
figure(1)
subplot(211)
plot(t1,x(:,1),'g-o',t1,x(:,2),'g-o',t1,x_explicit_euler(:,1),'b--',t1,x_explicit_euler(:,2),'b--',t1,x_rk4(:,1),'r-*',t1,x_rk4(:,2),'r-*');
legend('ode45','ode45','Euler explicit','Euler explicit','rk_4','rk_4');
xlabel('time[s]');
ylabel('oscilation');
title('Simulation of behavoir of damped oscilator')
grid on;
%% 1c Implement the RK4 scheme as a CasADi function
import casadi.*;
% declaration of ordinary equations
x = SX.sym('x',2,1);
exp1 = x(2,1);
exp2 = -0.2*x(2,1) - x(1,1);
f = Function('f',{x},{exp1,exp2});
%declaration of variable with initial conditions
x1 = DM(2,1);
x1(1,1) = 1;
x1(2,1) = 0;
% runge-kunta variables
k1=DM(2,1)
k2=DM(2,1)
k3=DM(2,1)
k4=DM(2,1)
% vector with map
xs = DM(20,2);
% assignemt of initial conditions to map
xs(1,:)=x1;
% integration process
for n = 1:19
[k1(1,1),k1(2,1)] = f(x1);
[k2(1,1),k2(2,1)] = f(0.25*k1+ x1);
[k3(1,1),k3(2,1)] = f(0.25*k2+x1);
[k4(1,1),k4(2,1)] = f(0.5*k3+x1);
x1=x1+(0.5/6)*(k1+2*k2+2*k3+k4);
xs(n+1,:)=x1;
end
% plot and data extraction
t = 0:0.5:9.5;
xs1 = full(xs(:,1));
xs2 = full(xs(:,2));
subplot(212)
plot(t,xs1,t,xs2);
grid on
xlabel('time[t]')
ylabel('oscilation')
legend('x1','x2')
title('Calculation of map with casadi')
%% 3.II Lorenz Atractor
% declaration of ordinary equations
x = SX.sym('x',3,1);
exp1 = 10*(x(2,1)-x(1,1));
exp2 = x(1,1)*(28-x(3,1))-x(2,1);
exp3 = x(1,1)*x(2,1) - ((8/3)*x(3,1));
f = Function('f',{x},{exp1,exp2,exp3});
%declaration of variable with initial conditions
x1 = DM(3,1);
x1(1,1) = 1;
x1(2,1) = 0;
x1(3,1) = 0;
% runge-kunta variables
k1=DM(3,1);
k2=DM(3,1);
k3=DM(3,1);
k4=DM(3,1);
% vector with map
xs = DM(10001,3);
% assignemt of initial conditions to map
xs(1,:)=x1;
% integration process
for n = 1:10000
[k1(1,1),k1(2,1),k1(3,1)] = f(x1);
[k2(1,1),k2(2,1),k2(3,1)] = f(0.25*k1+x1);
[k3(1,1),k3(2,1),k3(3,1)] = f(0.25*k2+x1);
[k4(1,1),k4(2,1),k4(3,1)] = f(0.5*k3+x1);
x1=x1+(0.5/6)*(k1+2*k2+2*k3+k4);
xs(n+1,:)=x1;
end
% plot and data extraction
xs1 = full(xs(:,1));
xs2 = full(xs(:,2));
xs3 = full(xs(:,3));
plot3(xs1,xs2,xs3);
grid on
xlabel('x1')
ylabel('x2')
zlabel('x3')
title('Lorenz Atractor')
