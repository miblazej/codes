Ex1_3_b;
z=1:1:200;
meanarray = zeros (1,200);
meanvalues = mean(transpose(Rsac));
suma=0;
for n=1:200
    for m =1:n
    suma =suma + mean(Rsac(m,:));
    end
    suma = suma/m;
    meanarray(1,n)= suma;
    suma = 0;
end
plot(z,meanarray);
title('Ex1 3c')
xlabel('Number of mesurements');
ylabel('mean'); 
legend('mean');