% Author: Michal Francesco Blazej,Mohamed Emara ,Juanito Sebestian Diaz
%% Exercise 2 Evaluation of theta values
clc;clear variables;
load('ex9_robotData.mat');
% Declaration of known variances in x and y planes
variance_x = 1.6 * 10^(-3);
variance_y = 4 * 10^(-4);
sigmaData=[variance_x,variance_y];
% Implementation of function residual
% Declaration of parameters variable
Rr=0;Rl=0;L=0;
theta=[Rr,Rl,L];
% Declaration of initial position of robot
x_0=0;y_0=0;beta_0=0;
x0=[x_0,y_0,beta_0];
% Declaration of tim vector
t=0:0.01:0.01*298;
fun = @(theta)residual(theta,x0,u,t,xy_meas,sigmaData);
x1=[0.16;0.16;0.56];
lb=[0.15;0.15;0.55];
ub=[0.2*2;0.2*2;0.6*2];
r=residual(x1,x0,u,t,xy_meas,sigmaData);
theta_solved=lsqnonlin(fun,x1,lb,ub);
c=residual(theta_solved,x0,u,t,xy_meas,sigmaData);

%% Exercise 3 Prediction error minimization for forecasting
clc;clear variables;
load('ex9_windData.mat');
% flip of data vector for programing convinience
v_w_flipped=flip(v_w);
%% 2 b Calculaction of normal equation for diffferent values of M
for n=1:20
    % preperation of fi matrix
    dummy=2;
for m = 2 : (1001-n)
    for o = 1 : n
    fi(m-1,o)=v_w_flipped(dummy+o-1,1);
    end 
    dummy=dummy+1;
end
% adition of column of ones
fi(:,n+1)=1;
% creation of new y vector
y=v_w_flipped(1:(1000-n),1);
% calculation of theta
A=transpose(fi)*fi;
B=transpose(fi)*y;
theta=A\B;
% Assigment off all a coeficient and constants to one base
% in every column a0;a1.....q
for m= 1 : n+1
theta_vec(m,n)=theta(m,1);
end
% clearance of variables
clearvars fi dummy y A B theta y
end
% predictions of value y(k+1),prelocation
prediction_vector=zeros(20,1);
for n = 1 :20
% previous data    
 data=transpose(v_w_flipped(1:n,1));
 data(1,n+1)=1;
 theta=theta_vec(1:n+1,n);
 % prediction_vector contains all prediction it is a column for first
 % element M =1 it goes until M = 20
 prediction_vector(n,1)=data*theta;
    
end










