
% ---------------  Question 1a ---------------------------
load('exercise8_data.mat');

% Time vector

time = 0;
for n = 1:80
    time(n) = (n-1)*0.0159;
end

time = time';

% Position vectors

X = XYm(:,1);

Y = XYm(:,2);

% LLS estimator

t2=time.^2;
t3=time.^3;
t4=time.^4; 

phi = [ones(80,1), time ,t2 ,t3 ,t4];

% LLS For X

thetax = inv(phi'*phi)*phi'*X;

xmodel = (thetax(1) + time*thetax(2) + t2*thetax(3) + t3*thetax(4) +t4*thetax(5));



% LLS For Y

thetay = inv(phi'*phi)*phi'*Y;

ymodel = (thetay(1) + time*thetay(2) + t2*thetay(3) + t3*thetay(4) +t4*thetay(5));


% ----------------  Question 1b  --------------------

% Recursive Least Squares for X dimension
Qn = phi(1:8,:)'*phi(1:8,:); % Initial value for phi

phiprevious_X = phi(1:8,:); % Initial value for phi

theta_previous_X = inv(phiprevious_X'*phiprevious_X)*phiprevious_X'*X(1:8); % Initial value for theta

X_LLS = (theta_previous_X(1) + time(1:8)*theta_previous_X(2) + t2(1:8)*theta_previous_X(3) + t3(1:8)*theta_previous_X(4) +t4(1:8)*theta_previous_X(5));

for i = 9:80
    Qn_1 = Qn + phi(i,:)'*phi(i,:); % Compute new Q value
    Qn = Qn_1;
    thetanew_X = theta_previous_X+inv(Qn_1)*phi(i,:)'*(X(i)-phi(i,:)*theta_previous_X); % New theta value
    theta_previous_X = thetanew_X; 
    X_RLS_alpha(i) = (thetanew_X(1) + time(i)*thetanew_X(2) + t2(i)*thetanew_X(3) + t3(i)*thetanew_X(4) +t4(i)*thetanew_X(5)); % Calculating X value recursively
end

X_estimated = [X_LLS',X_RLS_alpha(9:80)];


% Recursive Least Squares for Y dimension
Qn = phi(1:8,:)'*phi(1:8,:); % Initial value for phi

phiprevious_Y = phi(1:8,:); % Initial value for phi

theta_previous_Y = inv(phiprevious_Y'*phiprevious_Y)*phiprevious_Y'*Y(1:8); % Initial value for theta

Y_LLS = (theta_previous_Y(1) + time(1:8)*theta_previous_Y(2) + t2(1:8)*theta_previous_Y(3) + t3(1:8)*theta_previous_Y(4) +t4(1:8)*theta_previous_Y(5));

for i = 9:80
    Qn_1 = Qn + phi(i,:)'*phi(i,:); % Compute new Q value
    Qn = Qn_1;
    thetanew_Y = theta_previous_Y+inv(Qn_1)*phi(i,:)'*(Y(i)-phi(i,:)*theta_previous_Y); % New theta value
    theta_previous_Y = thetanew_Y; 
    Y_RLS_alpha(i) = (thetanew_Y(1) + time(i)*thetanew_Y(2) + t2(i)*thetanew_Y(3) + t3(i)*thetanew_Y(4) +t4(i)*thetanew_Y(5)); % Calculating X value recursively
end

Y_estimated = [Y_LLS',Y_RLS_alpha(9:80)];

% ----------------  Question 1c  --------------------

% Using alpha = 0.3

% Recursive Least Squares for X dimension
Qn = phi(1:8,:)'*phi(1:8,:); % Initial value for phi

phiprevious_X = phi(1:8,:); % Initial value for phi

theta_previous_X = inv(phiprevious_X'*phiprevious_X)*phiprevious_X'*X(1:8); % Initial value for theta

X_LLS = (theta_previous_X(1) + time(1:8)*theta_previous_X(2) + t2(1:8)*theta_previous_X(3) + t3(1:8)*theta_previous_X(4) +t4(1:8)*theta_previous_X(5));

for i = 9:80
    Qn_1 = 0.3*Qn + phi(i,:)'*phi(i,:); % Compute new Q value
    Qn = Qn_1;
    thetanew_X = theta_previous_X+inv(Qn_1)*phi(i,:)'*(X(i)-phi(i,:)*theta_previous_X); % New theta value
    theta_previous_X = thetanew_X; 
    X_RLS_alpha(i) = (thetanew_X(1) + time(i)*thetanew_X(2) + t2(i)*thetanew_X(3) + t3(i)*thetanew_X(4) +t4(i)*thetanew_X(5)); % Calculating X value recursively
end

X_estimated_alpha1 = [X_LLS',X_RLS_alpha(9:80)];


% Recursive Least Squares for Y dimension
Qn = phi(1:8,:)'*phi(1:8,:); % Initial value for phi

phiprevious_Y = phi(1:8,:); % Initial value for phi

theta_previous_Y = inv(phiprevious_Y'*phiprevious_Y)*phiprevious_Y'*Y(1:8); % Initial value for theta

Y_LLS = (theta_previous_Y(1) + time(1:8)*theta_previous_Y(2) + t2(1:8)*theta_previous_Y(3) + t3(1:8)*theta_previous_Y(4) +t4(1:8)*theta_previous_Y(5));

for i = 9:80
    Qn_1 = 0.3*Qn + phi(i,:)'*phi(i,:); % Compute new Q value
    Qn = Qn_1;
    thetanew_Y = theta_previous_Y+inv(Qn_1)*phi(i,:)'*(Y(i)-phi(i,:)*theta_previous_Y); % New theta value
    theta_previous_Y = thetanew_Y; 
    Y_RLS_alpha(i) = (thetanew_Y(1) + time(i)*thetanew_Y(2) + t2(i)*thetanew_Y(3) + t3(i)*thetanew_Y(4) +t4(i)*thetanew_Y(5)); % Calculating X value recursively
end

Y_estimated_alpha1 = [Y_LLS',Y_RLS_alpha(9:80)];
% Using alpha = 0.9

% Recursive Least Squares for X dimension
Qn = phi(1:8,:)'*phi(1:8,:); % Initial value for phi

phiprevious_X = phi(1:8,:); % Initial value for phi

theta_previous_X = inv(phiprevious_X'*phiprevious_X)*phiprevious_X'*X(1:8); % Initial value for theta

X_LLS = (theta_previous_X(1) + time(1:8)*theta_previous_X(2) + t2(1:8)*theta_previous_X(3) + t3(1:8)*theta_previous_X(4) +t4(1:8)*theta_previous_X(5));

for i = 9:80
    Qn_1 = 0.7*Qn + phi(i,:)'*phi(i,:); % Compute new Q value
    Qn = Qn_1;
    thetanew_X = theta_previous_X+inv(Qn_1)*phi(i,:)'*(X(i)-phi(i,:)*theta_previous_X); % New theta value
    theta_previous_X = thetanew_X; 
    X_RLS_alpha(i) = (thetanew_X(1) + time(i)*thetanew_X(2) + t2(i)*thetanew_X(3) + t3(i)*thetanew_X(4) +t4(i)*thetanew_X(5)); % Calculating X value recursively
end

X_estimated_alpha2 = [X_LLS',X_RLS_alpha(9:80)];


% Recursive Least Squares for Y dimension
Qn = phi(1:8,:)'*phi(1:8,:); % Initial value for phi

phiprevious_Y = phi(1:8,:); % Initial value for phi

theta_previous_Y = inv(phiprevious_Y'*phiprevious_Y)*phiprevious_Y'*Y(1:8); % Initial value for theta

Y_LLS = (theta_previous_Y(1) + time(1:8)*theta_previous_Y(2) + t2(1:8)*theta_previous_Y(3) + t3(1:8)*theta_previous_Y(4) +t4(1:8)*theta_previous_Y(5));

for i = 9:80
    Qn_1 = 0.7*Qn + phi(i,:)'*phi(i,:); % Compute new Q value
    Qn = Qn_1;
    thetanew_Y = theta_previous_Y+inv(Qn_1)*phi(i,:)'*(Y(i)-phi(i,:)*theta_previous_Y); % New theta value
    theta_previous_Y = thetanew_Y; 
    Y_RLS_alpha(i) = (thetanew_Y(1) + time(i)*thetanew_Y(2) + t2(i)*thetanew_Y(3) + t3(i)*thetanew_Y(4) +t4(i)*thetanew_Y(5)); % Calculating X value recursively
end

Y_estimated_alpha2 = [Y_LLS',Y_RLS_alpha(9:80)];


% ----------------  Question 1d  --------------------
% Recursive Least Squares for Y dimension
Qn = phi(1:8,:)'*phi(1:8,:); % Initial value for phi

phiprevious_Y = phi(1:8,:); % Initial value for phi

theta_previous_Y = inv(phiprevious_Y'*phiprevious_Y)*phiprevious_Y'*Y(1:8); % Initial value for theta

Y_LLS = (theta_previous_Y(1) + time(1:8)*theta_previous_Y(2) + t2(1:8)*theta_previous_Y(3) + t3(1:8)*theta_previous_Y(4) +t4(1:8)*theta_previous_Y(5));

for i = 9:79
 %    Y_RLS_next(i) = phi(1:8)'*theta_previous_Y'
   Y_RLS_next(i) = (theta_previous_Y(1) + time(i+1)*theta_previous_Y(2) + t2(i+1)*theta_previous_Y(3) + t3(i+1)*theta_previous_Y(4) +t4(i+1)*theta_previous_Y(5)); % Calculating X value recursively

    Qn_1 = 0.3*Qn + phi(i,:)'*phi(i,:); % Compute new Q value
    Qn = Qn_1;
    thetanew_Y = theta_previous_Y+inv(Qn_1)*phi(i,:)'*(Y_RLS_next(i)-phi(i,:)*theta_previous_Y); % New theta value
    theta_previous_Y = thetanew_Y; 
end

Y_estimated_nextstep = [Y_LLS',Y_RLS_next(9:79)];



figure
hold on 
plot(time,X);
plot(time,xmodel);
plot(time,X_estimated)
plot(time,X_estimated_alpha1,'--')
plot(time,X_estimated_alpha2)
xlabel('Time[s]')
ylabel('X position [m]')
legend('Original data', 'LLS Model', 'RLS Model', 'RLS Model with alpha = 0.3', 'RLS Model with alpha = 0.9')
hold off

figure
hold on
plot(time,Y);
plot(time,ymodel);
plot(time,Y_estimated)
plot(time,Y_estimated_alpha1,'--')
plot(time,Y_estimated_alpha2)
%plot(time,Y_estimated_nextstep)
xlabel('Time[s]')
ylabel('Y position [m]')
legend('Original data', 'Model', 'RLS Model', 'RLS Model with alpha = 0.3', 'RLS Model with alpha = 0.9','next step extimate')

% X-Y fit

figure 
hold on
plot(X,Y)
plot(xmodel, ymodel)
plot(X_estimated, Y_estimated)
plot(X_estimated_alpha1, Y_estimated_alpha1,'--')
plot(X_estimated_alpha2, Y_estimated_alpha2)
xlabel('X position [m]')
ylabel('Y position [m]')
legend('Original data', 'LLS Model', 'RLS Model', 'RLS Model with alpha = 0.3', 'RLS Model with alpha = 0.9')
hold off

%% Question 2
load('exercise8_data.mat');
% Parameters
L = 0.6;
RL = 0.2;
RR = 0.2;
t = 0.0159;
x0 = [0,0,0]';
param = [RL, RR, L]';
deltaT = t;

% Time
time = 0;
for n = 1:91
    time(n) = (n-1)*0.0159;
end

% a), b), c)
euler = sim_euler(t,x0,u,param);

% d)
rk4 = sim_rk4(t,x0,u,param);

% It can be seen a small difference along the X-Y position graph.
% This is due that the Runge-Kutta method has an accuracy in the order of
% O(h^n), which is much highier than the Euler approximation.

figure
hold on
plot(euler(:,1),euler(:,2))
plot(rk4(:,1),rk4(:,2))
xlabel('X position [m]')
ylabel('Y position [m]')
legend('Euler', 'Runge-kutta')
legend('Location','best')
hold off
