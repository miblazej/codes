function plot_and_calculation( theta, x0, u, t,XData)
% theta=[Rr;Rl;L]
% x0= [0,0,0]
% u = [omegaL,omegaR];
% t - time vector
% XData - Data positions
% sigmaData - it might be either vector with two variances or data with
% added noise
simData=sim_euler2(t,x0,u,theta);
pos_1(:,1)=transpose(simData(1,:));
pos_1(:,2)=transpose(simData(2,:));
pos_1(300,1:2)=0;
plot(pos_1(:,1),pos_1(:,2),XData(:,1),XData(:,2));


end

