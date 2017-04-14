Rsac= zeros (200,1000);
y= 1:1:1000;
for o = 1:200
for n = 1:1000
    a=0;b=0;
    for m = 1:n
        a= a+ v_k(m,o);
        b= b+ i_k(m,o);
    end
    a=a/n;
    b=b/n;
    Rsac(o,n)=a/b;
end
plot(y,Rsac(o,:))
axis([0 1000 0 10]);
hold on;
title('Ex1 3b')
xlabel('Number of mesurements');
ylabel('Estimated resistance'); 
end
hold off;

