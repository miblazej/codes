function [ r ] = residual( theta, x0, u, t,XData, sigmaData)
% theta=[Rr;Rl;L]
% x0= [0,0,0]
% u = [omegaL,omegaR];
% t - time vector
% XData - Data positions
% sigmaData - it might be either vector with two variances or data with
% added noise
simData=sim_euler(t,x0,u,theta);
positions(:,1)=transpose(simData(1,:));
positions(:,2)=transpose(simData(2,:));
positions(300,1:2)=0;
% Delete of last number in a vector to make computation going
XData(300,1:2)=0;
% Exercise 2 b Adaptation of function to incoroprate measurements corectly
XData(:,1)=XData(:,1)/sqrt(sigmaData(1,1));
XData(:,2)=XData(:,2)/sqrt(sigmaData(1,2));
r=XData-positions;
end

