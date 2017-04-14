function [x_next] = rk4_step(deltaT, x0, u, ode, param)
    
    k1 = ode(deltaT, x0, u, param);
    
    k2 = ode(deltaT, (x0 + (deltaT/2)*k1)', u, param);
    
    k3 = ode(deltaT, (x0 + (deltaT/2)*k2)', u, param);
    
    k4 = ode(deltaT, (x0 + deltaT*k3)', u, param);
    
    x_1 = (x0 + (deltaT/6)*(k1 +2*k2 + 2*k3 + k4));
    
    
    x_next = [x_1(1), x_1(2), x_1(3)]';
    
end