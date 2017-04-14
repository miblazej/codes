function [ x_sim ] = sim_euler2( t,x0,u,param)
len=length(u(:,1));
x_sim=zeros(3,len);
for a= 1 : len
    if a == 1
     x_sim(:,a)= euler_step2(0.01,x0,u,param);
    else
   x_sim(:,a)= euler_step2(0.01,transpose(x_sim(:,(a-1))),u,param);
    end
end
end

