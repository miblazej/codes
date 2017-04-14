
function [V,temp_vect] = ex1_b(temperature)
temp_vect= zeros(4256/8,8);
V = zeros(8,3);
i=1;m=1;
for n = 1: 4248
   m=mod(n,8);
   if m == 0
       m=8; 
   end;
   temp_vect(i,m)= temperature(n,:);
   if m == 8 
       i=i+1;
   end;
end
   for b = 1: 8
      V(b,1) = mean(temp_vect(:,b));
      V(b,2) = std(temp_vect(:,b));
      V(b,3) = var(temp_vect(:,b));
   end

end