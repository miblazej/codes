function y = myVar(vec)
m = mean(vec);
l = length(vec);
sums = 0;
for n = 1:l
   vec(:,n) = vec(:,n)-m;
end
variance = var(vec);
for n = 1:l
   sums = sums+abs(vec(:,n)).^2;    
end
a = sums./ (l-1);
y = a; 

end
