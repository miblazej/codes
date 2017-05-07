clc

%% import statements

% installation: http://optistack.casadi.org
addpath('/home/jgillis/programs/casadi/matlab_install')
import casadi.*

%% define constants
h= 0.2; c=2; g=9.81; 

Q = [10 0;0 10]; % Weights
R = 1;

N = 50; % Horizon
%% system modeling

ode = @(x,u) [x(2);-g*sin(x(1))-c*x(2)+u];
F   = @(x0,u) x0 + h .* ode(x0,u); % explicit euler step

%% declare symbolic primitives
x0 = SX.sym('x0',2,1);
u  = SX.sym('u',1,N);

%% construct expressions
x = x0;
obj = 0;
for k=1:N
    x = F(x,u(:,k));
    obj = obj + x'*Q*x + u(:,k)'*R*u(:,k);
end

%% construct a function
opts = struct;
%opts.verbose = true;
%opts.live_variables = false;

pendulum = SXFunction('obj',{u,x0},{obj},opts);

pendulum.printDimensions()
%%
pendulum.print()
%% 
x0_num = [pi/2;0];
u_num = zeros(50,1);

tic
out = pendulum({u_num,x0_num});
toc

pendulum_nom = out{1}

%% pendulum_forward
pendulum_forward = pendulum.derForward(1);

pendulum_forward.printDimensions()
%%
du_num = zeros(1,N);
du_num(2) = 1;

tic
celldisp(pendulum_forward({u_num, x0_num, pendulum_nom , du_num, 0}))
toc
%%
pendulum.print()
%% pendulum_reverse

pendulum_reverse = pendulum.derReverse(1);

pendulum_reverse.printDimensions()

bobj = 1;
tic
celldisp(pendulum_reverse({u_num,x0_num, pendulum_nom, bobj }))
toc
%% get Jacobian
pendulum_jac = pendulum.jacobian();

tic
celldisp(pendulum_jac({u_num,x0_num}));
toc

%% get Hessian

pendulum_hess = pendulum.hessian();

tic
celldisp(pendulum_hess({u_num,x0_num}));
toc

%% optistack (1)
addpath('/home/jgillis/programs/optistack/src')

N = 50;

% singleshooting
x0 = x0_num;
u  = optivar(1,N,'u');

x = x0;
obj = 0;
for k=1:N
    x = F(x,u(:,k));
    obj = obj + x'*Q*x + u(:,k)'*R*u(:,k);
end

optisolve(obj);

plot(optival(u));

optival(obj)

%% optistack (2)

N = 50;

% multipleshooting
x = [x0_num optivar(2,N,'x')];
u  = optivar(1,N,'u');

constraints = {};
obj = 0;
for k=1:N
    constraints = {constraints{:} x(:,k+1)==F(x(:,k),u(:,k))};
    obj = obj + x(:,k+1)'*Q*x(:,k+1) + u(:,k)'*R*u(:,k);
end

optisolve(obj,constraints);

plot(optival(u));

optival(obj)