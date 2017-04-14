Rsa = zeros(1,1000);
Rls = zeros(1,1000);
Rev = zeros(1,1000);
c = 0;
for n = 1:1000
    for m = 1:n
        a= v_k(m,1);
        b= i_k(m,1);
        c=c+a/b;    

    end
    Rsa(:,n)= c/m;
    c=0;
end

for n = 1:1000
    a=0;b=0;
    for m = 1:n
        a= a+ v_k(m,1) * i_k(m,1);
        b= b+ i_k(m,1) * i_k(m,1);
    end
    a=a/n;
    b=b/n;
    Rls(:,n)=a/b;
end

for n = 1:1000
    a=0;b=0;
    for m = 1:n
        a= a+ v_k(m,1);
        b= b+ i_k(m,1);
    end
    a=a/n;
    b=b/n;
    Rev(:,n)=a/b;
end
y= 1:1:1000;
plot(y,Rsa,'r',y,Rls,'--b',y,Rev,'-.m');

title('Ex1 3a')
xlabel('Number of mesurements');
ylabel('Estimated resistance'); 
legend('Simple approach','Least squares','Error in Variables')