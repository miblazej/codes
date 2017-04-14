function [ x_sim ] = sim_euler( t,x0,u,param)
len=length(u(:,1));
x_sim=zeros(3,len);
for a= 1 : len
    if a == 1
     x_sim(:,a)= euler_step(0.0159,x0,u,param);
    else
   x_sim(:,a)= euler_step(0.0159,x_sim(:,(a-1)),u,param);
    end
end
figure(5)
plot(x_sim(1,:),x_sim(2,:));
hold on;


end

