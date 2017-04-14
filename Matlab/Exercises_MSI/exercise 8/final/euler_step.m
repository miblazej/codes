function [ x_next ] = euler_step(deltaT,x0,u,param)
% base on value of delta T we are going to compute number of steps that
% will be integrated
steps=deltaT/0.0159;
% changed it to integer because I will use it in for loop
steps = int16(steps);
% In my opinion it is initial position and deviation from 0 degree
% u is all data which contains 80 measurements
% at the begining x_next has the same value af x0
x_next_dummy(1,1)=x0(1,1);
x_next_dummy(1,2)=x0(2,1);
x_next_dummy(1,3)=x0(3,1);
for a= 1:steps;
   x_next_dummy =x_next_dummy + robot_ode(steps,x_next_dummy,u(a,:),param); 
end
x_next=x_next_dummy;

end

