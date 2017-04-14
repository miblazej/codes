function [x_next] = euler_step(deltaT, x0, u, ode, param)

    x_actual = ode(deltaT, x0, u, param);
    
    x = x_actual(1)*deltaT + x0(1);
    y = x_actual(2)*deltaT + x0(2);
    beta = x_actual(3)*deltaT + x0(3);
    
    x_next = [x,y,beta]';
end