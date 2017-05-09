function x_dot = expl_integrator(t,x)
%definition of t vector
x_dot=zeros(2,1);
x_dot(1) = x(2);
x_dot(2) = -0.2*x(2)-x(1);
end

