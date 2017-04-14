% XDOT Function

function [xdot] = robot_ode(t, X, u, param)
    omegaL = u(1);
    omegaR = u(2);
    
    RL= param(1);
    RR= param(2);
    L= param(3);
    
    beta_old = X(3);
    
    v = (omegaL*RL + omegaR*RR)/2;

    x_ode = v*cos(beta_old);
    y_ode = v*sin(beta_old);
    
    beta_ode = (omegaL*RL - omegaR*RR)/L;
    
    xdot = [x_ode,y_ode,beta_ode]';
end