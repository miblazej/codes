
%% Exercise 2

clc;
clear variables;
XY=importdata('exercise8_data.mat');
t=0:0.0159:79*0.0159;
wL= XY(:,1);
wR= XY(:,2);
RL=0.2;
RR=0.2;
L=0.6;
x0=[0;0;0];
param = [RL,RR,L];
u=[wL,wR];
[x_sim] = sim_euler(t,x0,u,param); 
[x_sim1] = sim_rk4(t,x0,u,param);
% cirlces are similiar however one calculated with rk4 method is driffted
% the reason for that is value of half step that is added to xj you can
% created for data comparision
all_data=[x_sim;x_sim1];
data_deviation=x_sim-x_sim1;