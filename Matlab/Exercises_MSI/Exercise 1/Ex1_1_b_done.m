T=[5 15 35 60];
L=[6.55 9.63 17.24 29.64];
syms A;
syms B;
syms L0;
sumfa = 2*5*(-6.55+5*A+L0)+2*15*(-9.63+15*A+L0)+2*35*(-17.24+35*A+L0)+2*60*(-29.64+60*A+L0)
sumfL0= 2*(-6.55+5*A+L0)+2*(-9.63+15*A+L0)+2*(-17.24+35*A+L0)+2*(-29.64+60*A+L0)
A=[10150 230 ; 230 8]; B = [5118;3153/25];
x=linsolve(A,B);
% Polynomial third order
polynomial_3rd_order;
A1=[29023750 524750 10150; 524750 10150 230; 10150 230 8];
B1=[260307;5118;3153/25];
x1=linsolve(A1,B1);
t=0:0.1:60;
y=x(2,1)+x(1,1)*t;
y1=x1(1,1)*t.^2+x1(2,1)*t+x1(3,1);
plot(T,L,'X',t,y,':r',t,y1,'--b');
xlabel('temperature[K]');
ylabel('L[cm]'); 
legend('Measurements','2nd order polynomial','3rd order polynomial');
title('MSI Ex1_1_c');