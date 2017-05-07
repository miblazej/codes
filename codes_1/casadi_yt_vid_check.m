clc;
import casadi.*;
x0=[1;0];
Ts=0.5;
rk4 = {};
h=0.125;
xk = x0;
x=MX.sym('x',2,1);
disp(x)

%% function declaration
F = Function('F',{x},...
{x(2,1),-0.2*x(2,1)-x(1,1)});
x_vec = zeros(2,20);
x_vec(:,1) = x0;


%%
for k=1:19
   k1 = f(x_vec(:,k)).ode;
   k2 = f(x_vec(:,k)+(h/2)*k1);
   k3 = f(x_vec(:,k)+(h/2)*k2);
   k4 = f(x_vec(:,k)+h*k3);
   x_vec(:,k+1)= x_vec(:,k)+(h/6)*(k1+2*k2+2*k3+k4);
end

