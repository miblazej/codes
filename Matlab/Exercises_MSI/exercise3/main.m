%Exercise 3

%Point 2: Variance by squared mean deviation

vec = rand(1,1000);
a_test = myVar(vec);
a_variance = var(vec);

% We can check that the implementation of the function is correct by
% contrasting the values of test and variance at the top of the workspace.
% If they are the same, then it is correct.


% Point 4: Plot of the Altitude vs. the Air Pressure data
% From the graphic you can see that the best fit would have an exponential
% form, so at least you should expect a second order polynomial equation or
% perhaps a higuer order to give a meaningful linear least squares fit

load variablesEx2

figure(1);
hold on;
plot(pressure',height','x');
title('Weather ballon data plot and estimations with LLS');
xlabel('Pressure [Pa]');
ylabel('Altitude [m]');
N=9235;

% Point 3b-e: The data fulfills the properties are defined in point 3c in
% order to correspond to the linear least squares problem form

% In order to determine the best polynomial order fit we will solve the 
% linear least squares problem and find the coefficients from order 1
% and up, until we observe a good fit.

% Polynomial degree 1
order=1;
temp = linspace(1,1,N);
ones = transpose(temp);
phi1 = zeros(N,order+1);
phi1(:,1)= ones;
phi1(:,2)= pressure;

% Initially we solved the estimators using the inv function, like it is now
% commented in the code. However, following the exercises instructions, we
% changed it to backslash. Although MATLAB recommends using backslash
% operator, because "the calculations are quicker and has less residual
% error by several orders of magnitude", we didn't observed much difference
% between them. The results were almost the same: the differences of the
% coefficients are in the order of nanopercent (as can be seen in the 
% diffPercent column vector, in the workspace), and the execution is rather
% quicker, but almost not appreciable. However, we could appreciate that the
% "badly scaled" warning appeared from second order on using in, and with the
% backslash method it starts to appear from third order on.

% phiPlus1 = inv(phi1'*phi1)*phi1';
% locMin1 = phiPlus1*height;

phi1B = phi1' * height;
phi1A = phi1' * phi1;
locMin1 = phi1A \ phi1B;

teta0 = locMin1(1,1);
teta1 = locMin1(2,1);
newPressure = 1:1:90000;
newHeight1=teta0+teta1*newPressure;
plot(newPressure,newHeight1,'r:');

% As it was expected, we can observe in the plot that this is a very poor fit, 
% it only crosses two points of the data. 

% Polynomial degree 2
order=2;
phi2 = zeros(N,order+1);
phi2(:,1)= ones;
phi2(:,2)= pressure;
phi2(:,3)= (pressure).^2;

%phiPlus2 = inv(phi2'*phi2)*phi2';
%locMin2 = phiPlus2*height;

phi2B = phi2' * height;
phi2A = phi2' * phi2;
locMin2 = phi2A \ phi2B;

teta0 = locMin2(1,1);
teta1 = locMin2(2,1);
teta2 = locMin2(3,1);
newHeight2=teta0+teta1*newPressure+teta2*newPressure.^2;
plot(newPressure,newHeight2,'g:');

% This second order polynomial is a much better fit than the first order. 
% It crosses most of the points, some better than others. However for the
% first point P=5000 Pa), the fit is clearly unacceptable (far away from 
% the measurements). 

% Polynomial degree 3
order=3;
phi3 = zeros(N,order+1);
phi3(:,1)= ones;
phi3(:,2)= pressure;
phi3(:,3)= (pressure).^2;
phi3(:,4)= (pressure).^3;

%phiPlus3 = inv(phi3'*phi3)*phi3';
%locMin3 = phiPlus3*height;

phi3B = phi3' * height;
phi3A = phi3' * phi3;
locMin3 = phi3A \ phi3B;

teta0 = locMin3(1,1);
teta1 = locMin3(2,1);
teta2 = locMin3(3,1);
teta3 = locMin3(4,1);
newHeight3=teta0+teta1*newPressure+teta2*newPressure.^2+teta3*newPressure.^3;
plot(newPressure,newHeight3,'r--');

% The third order polynomial is very similar to the second. It crosses all the
% points, but the first one continues to be away from the measurements. 

order=4;
phi4 = zeros(N,order+1);
phi4(:,1)= ones;
phi4(:,2)= pressure;
phi4(:,3)= (pressure).^2;
phi4(:,4)= (pressure).^3;
phi4(:,5)= (pressure).^4;

%phiPlus4 = inv(phi4'*phi4)*phi4';
%locMin4 = phiPlus4*height;

phi4B = phi4' * height;
phi4A = phi4' * phi4;
locMin4 = phi4A \ phi4B;

teta0 = locMin4(1,1);
teta1 = locMin4(2,1);
teta2 = locMin4(3,1);
teta3 = locMin4(4,1);
teta4 = locMin4(5,1);
newHeight4=teta0+teta1*newPressure+teta2*newPressure.^2+teta3*newPressure.^3+teta4*newPressure.^4;
plot(newPressure,newHeight4,'g--');

% The fourth order is a good fit. It crosses all the points, including the
% first one. However in that specific first point, it almost misses the 
% measurements the curve barely touches the bottom values). So we will try
% with one order more.

order=5;
phi5 = zeros(N,order+1);
phi5(:,1)= ones;
phi5(:,2)= pressure;
phi5(:,3)= (pressure).^2;
phi5(:,4)= (pressure).^3;
phi5(:,5)= (pressure).^4;
phi5(:,6)= (pressure).^5;

phiPlus5alt = inv(phi5'*phi5)*phi5';
locMin5alt = phiPlus5alt*height;

phi5B = phi5' * height;
phi5A = phi5' * phi5;
locMin5 = phi5A \ phi5B;

diffPercent = (locMin5 - locMin5alt)./locMin5*100;

teta0 = locMin5(1,1);
teta1 = locMin5(2,1);
teta2 = locMin5(3,1);
teta3 = locMin5(4,1);
teta4 = locMin5(5,1);
teta5 = locMin5(6,1);
newHeight5=teta0+teta1*newPressure+teta2*newPressure.^2+teta3*newPressure.^3+teta4*newPressure.^4+teta5*newPressure.^5;
plot(newPressure,newHeight5,'b');
legend('Measurements','1st order polynomial','2nd order polynomial', '3rd order polynomial','4th order polynomial','5th order polynomial');

% The fifth order is a very good fit. It crosses all the points (like in the
% fourth order polynomial), but with the difference that it crosses the first 
% point almost in the middle of the measurements. We can conclude that the 
% fifth order ploynomial is the best fit for our data, and we predict that 
% for higuer order polynomials, it will behave very much like this curve.

figure(2);
plot(newPressure,newHeight5);
title('Fifth order polynomial estimation with LLS (not scaled)');
xlabel('Pressure [Pa]');
ylabel('Altitude [m]');


%Point 3f
pScaled = 1/100000*pressure;
hScaled = 1/1000*height;

phiScaled = zeros(N,5);
temp = linspace(1,1,N);
ones = transpose(temp);
phiScaled(:,1)= ones;
phiScaled(:,2)= pScaled;
phiScaled(:,3)= (pScaled).^2;
phiScaled(:,4)= (pScaled).^3;
phiScaled(:,5)= (pScaled).^4;
phiScaled(:,6)= (pScaled).^5;

%phiPlusScaled = inv(phiScaled'*phiScaled)*phiScaled';
%locMinScaled = phiPlusScaled*hScaled;

phiScaledB = phiScaled' * height;
phiScaledA = phiScaled' * phiScaled;
locMinScaled = phiScaledA \ phiScaledB;

teta1Scaled = locMinScaled(1,1);
teta2Scaled = locMinScaled(2,1);
teta3Scaled = locMinScaled(3,1);
teta4Scaled = locMinScaled(4,1);
teta5Scaled = locMinScaled(5,1);
teta6Scaled = locMinScaled(6,1);
newPressureScaled = 0:0.001:0.9;
newHeightScaled=teta1Scaled+teta2Scaled*newPressureScaled+teta3Scaled*newPressureScaled.^2+teta4Scaled*newPressureScaled.^3+teta5Scaled*newPressureScaled.^4+teta6Scaled*newPressureScaled.^5;

figure(3);
plot(newPressureScaled,newHeightScaled);
title('Fifth order polynomial estimation with LLS (scaled)');
xlabel('Pressure [10^5 Pa]');
ylabel('Altitude [km]');

% With the scaling we observe that the curve in the plot is exactly the same,
% but the scaling in both axis, is of course different. However in this case 
% MATLAB does not show any warning messages. That is because the values we 
% are now working with, in the phi matrix, are not so large, and thus the 
% values of theta are all in the order of 10^4 and 10^5. This is
% a major difference with the unscaled values of theta coefficients,
% that were ranging from 10^4 to 10^20 (in fifth order), and increasing 
% approximately by 10^5, when we raised by 1 the order of the polynomial. 

    