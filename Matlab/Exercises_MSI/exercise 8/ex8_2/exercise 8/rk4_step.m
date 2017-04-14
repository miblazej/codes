function [ x_next ] = rk4_step( deltaT,x0,u,param)
% deltaT - value of time change
% x0 - initial state of the system
% u - vector with all data
% param - vector with robot parameters
% base on value of delta T we are going to compute number of steps that
% will be integrated
steps=deltaT/0.0159;
% changed it to integer because I will use it in for loop
% assigmend of x0 to help variable
x_next_dummy(1,1)=x0(1,1);
x_next_dummy(1,2)=x0(2,1);
x_next_dummy(1,3)=x0(3,1);
% calculation of runge kutta
k1 = robot_ode(steps,x_next_dummy,u(steps,:),param);
k2 = robot_ode(steps,x_next_dummy + k1 * (steps/2),u(steps,:),param);
k3 = robot_ode(steps,x_next_dummy + k2 * (steps/2),u(steps,:),param);
k4 = robot_ode(steps,x_next_dummy + (k3*steps),u(steps,:),param);
x_next_dummy = x_next_dummy + (steps/6) .* (k1+(2*k2)+(2*k3)+k4);
% final assigmend of x_next
x_next = x_next_dummy;

end

