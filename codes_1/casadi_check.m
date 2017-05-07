import casadi.*;
clc;
% declaration of matrix with size(2,1) 
x = MX.sym('x',2,1);
% declaration of function
f = Function('f',{x}, {x(2,1),-0.2*x(2,1)-x(1,1)});
% declaration of function
x(1,1) = 1;
x(2,1) = 0;
[r0,q0] = f(x);
k=MX.sym('k',4,2);
h=MX.sym('h',1,1);
x=MX.sym('x',1,2);
rk4 = Function('rk4',{k,h,x},...
    {f(x),...
    f(x(1,:)+(h/2)*k(1,:)),...
    f(x(1,:)+(h/2)*k(2,:)),...
    f(x(1,:)+h*k(3,:)),...
    h,...
    x(1,1)+1/6*(k(1,1)+k(2,1)+k(3,1)+k(4,1)),...
    x(1,2)+1/6*(k(1,2)+k(2,2)+k(3,2)+k(4,2))},...
    {'k','h','x'});
% creatom of input vectors
k1 = SX.zeros(4,2);
h1 = SX.sym('h1');
h1 = 0.125;
x1 = SX.sym('x',2,1);
x1(1,1)= 1;
x1(1,2) = 0;
rk4(k1,h1,x1);
