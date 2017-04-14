function [ xdot ] = robot_ode(t,x,u,param)
% velocity is calculted with equation (vr+vl)/2*
% found at this website : http://www.egr.msu.edu/classes/me451/me451_labs/robot/
v=(u(1)*param(1,1)+u(2)*param(1,2))/2;
xdot(1,1) = v*cos(x(3));
xdot(1,2) = v*sin(x(3));
xdot(1,3) = (u(1)*param(1,1)-u(2)*param(1,2))/param(1,3);
end

