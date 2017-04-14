function y = checktimeStamp(timeStamp)
m=1;
z=0;
for n = 2 : 4248
    if timeStamp(n,1) == timeStamp(n-1,1)
        m=m+1;
    elseif timeStamp(n,1) ~= timeStamp(n-1,1) && m == 8
        m=1;
    elseif timeStamp(n,1) ~= timeStamp(n-1,1) && m ~= 8
        z=1;
    end
end;
if z == 1 
    y = 0;
else
    y = 1;
end