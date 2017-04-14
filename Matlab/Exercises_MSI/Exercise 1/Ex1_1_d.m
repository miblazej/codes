% Function code for 
T=[5 15 35 60 70];
L=[6.55 9.63 17.24 29.64 32.89];
syms A;
syms B;
syms L0;
sumfa = 2*5*(-6.55+5*A+L0)+2*15*(-9.63+15*A+L0)+2*35*(-17.24+35*A+L0)+2*60*(-29.64+60*A+L0)+2*70*(-32.89+70*A+L0);
sumfL0= 2*(-6.55+5*A+L0)+2*(-9.63+15*A+L0)+2*(-17.24+35*A+L0)+2*(-29.64+60*A+L0)+2*(-32.89+70*A+L0);
A=[19950 370 ; 370 10]; B = [48613/5;1919/10];
x=linsolve(A,B);
% Polynomial third order
polynomial_3rd_order_d;
A1=[332309343750 5023168750 77043750 1210750;5023168750 77043750 1210750 19950;77043750 1210750 19950 370;1210750 19950 370 10];  
B1=[36911990;582629;48613/5;1919/10];
x1=linsolve(A1,B1);
t=0:0.1:70;
y=x(2,1)+x(1,1)*t;
y1=x1(1,1)*t.^3+x1(2,1)*t.^2+x1(3,1)*t+x1(4,1);
plot(T,L,'X',t,y,':r',t,y1,'--b');
xlabel('temperature[K]');
ylabel('L[cm]'); 
legend('Measurements','linear system','3rd order polynomial');
title('MSI Ex1 1d');