%% variable declaration
clc;
clear variables;
x0=[1,0];
% t computation
k=0:1:19;
Ts=0.5;
t=k*Ts;
%calculation of damped oscilator with usage of ode45 function
[t1,x_ode] = ode45('expl_integrator',t,x0); 
% calculation of damped oscilator with explicit euler scheme
k_1=0:1:79;
Ts_e=0.125;
t_e=k_1*Ts_e;
x_explicit_euler=explicit_euler(t_e);
%% 1b calculation of damped oscilaotr with usage of rk_4 integrator
x_rk4=rk4_1(t);
% processing of data to suit it for data plot
x_explicit_euler=transpose(x_explicit_euler(:,1:20));
x_rk4=transpose(x_rk4(:,1:20));
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
%% plot of data
figure(1)
plot(t1,x_ode(:,1),'g-o',t1,x_ode(:,2),'g-o',t1,x_explicit_euler(:,1),'b--',t1,x_explicit_euler(:,2),'b--',t1,x_rk4(:,1),'r-*',t1,x_rk4(:,2),'r-*',t1,xs1,'c*',t1,xs2,'c*');
legend('ode45','ode45','Euler explicit','Euler explicit','rk_4','rk_4','rk4 casadi','rk4 casadi');
xlabel('time[s]');
ylabel('oscilation');
title('Simulation of behavoir of damped oscilator')
grid on;
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
for n = 1:10000z
[k1(1,1),k1(2,1),k1(3,1)] = f(x1);
[k2(1,1),k2(2,1),k2(3,1)] = f(0.005*k1+x1);
[k3(1,1),k3(2,1),k3(3,1)] = f(0.005*k2+x1);
[k4(1,1),k4(2,1),k4(3,1)] = f(0.01*k3+x1);
x1=x1+(0.01/6)*(k1+2*k2+2*k3+k4);
xs(n+1,:)=x1;
end
% plot and data extraction
xs1 = full(xs(:,1));
xs2 = full(xs(:,2));
xs3 = full(xs(:,3));
figure(2)
plot3(xs1,xs2,xs3);
grid on
xlabel('x1')
ylabel('x2')
zlabel('x3')
title('Lorenz Atractor')
