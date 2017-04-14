function [x_sim] = sim_rk4(t,x0,u,param)
    x_simulated(1,:) = x0;
    for m = 1:length(u)
        x_simulated(m+1,:) = rk4_step(t, x0, u(m,:), @robot_ode, param);
        x0 = transpose(x_simulated(m+1,:));
    end
    x_sim = x_simulated;
end