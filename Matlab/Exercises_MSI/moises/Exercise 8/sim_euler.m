function [x_sim] = sim_euler(t,x0,u,param)
    x_simulated(1,:) = x0;
    for m = 1:length(u)
        x_simulated(m+1,:) = euler_step(t, x0, u(m,:), @robot_ode, param);
        x0 = x_simulated(m+1,:);
    end
    x_sim = x_simulated;
end