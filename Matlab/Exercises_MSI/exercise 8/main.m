%% Michal Blazej, Mohamed Emara, Juanito Sebastian Diaz
%% Hi comrades,This is first version of solution to exercise 8 MSI,probably it is not completly right when I was not sure about
% something I put that in commend, every not trivial calculation is
% comented
%% Data import
clc;
clear variables;
XY=importdata('exercise8_data.mat');
wL= XY(:,1);
wR= XY(:,2);
%%1 a) 4-th order polynomial through data
% Declaration of regresion matrix
t = 0:0.0159:79*0.0159;
fi=ones(80,4);
fi(:,2)=transpose(t);
fi(:,3)=transpose(t).^2;
fi(:,4)=transpose(t).^3;
% Calculation of LLS estimatiors
thetaL= inv(fi'*fi)*fi'*wL;
thetaR= inv(fi'*fi)*fi'*wR;
% Data plot
thetaL_vector= thetaL(4,1)*t.^3 + thetaL(3,1)*t.^2+ thetaL(2,1) * t + thetaL(1,1) * ones(1,80);
thetaR_vector= thetaR(4,1)*t.^3 + thetaR(3,1)*t.^2+ thetaR(2,1) * t + thetaR(1,1) * ones(1,80);
thetaL_vector = thetaL_vector';
thetaR_vector = thetaR_vector';
subplot(3,1,1);
plot(t,wL,'*',t,thetaL_vector);
xlabel('time[s]');
% not sure
ylabel('wL[m/s]');
title('Angular velocity of left wheel');
legend('real values','estimated value');
subplot(3,1,2);
plot(t,wR,'*',t,thetaR_vector);
xlabel('time[s]');
% not sure
ylabel('wR[m/s]');
title('Angular velocity of right wheel');
legend('real values','estimated value');
subplot(3,1,3);
plot(wL,wR,'*',thetaL_vector,thetaR_vector);
xlabel('X position[m]');
ylabel('Y position[m]');
title('Position of robot in X-Y plane');
legend('real values','estimated value');
% It do not work properly but I have expected that kind of behaviour
%% 1 b) Recursive square to estimate 4-th order polynomial
% Things that I am not sure about:
% 1 Initial value of QnR and QnL parameters,according to the script it
% should be inverse of theta parameter, but in case when one is using this
% algorithm one does not know the value of this parameter, anyway i used it
% values of theta for every another measurements is calculated with
% equation 5.23 from the script
% 2 Initial value of theta, In 5.3.1 there is info about prior knowledge of
% theta, in case we now theta we can use it, I decided to use theta from
% 1a)
% calculation of covariance of theta values
covL=cov(thetaL);
covR=cov(thetaR);
% assigment of values to variable used in algorithm
thetaMLL=thetaL;
thetaMLR=thetaR;
% inversion covariance values
QnL=inv(covL);
QnR=inv(covR);
% calculation of recursive least squares for every new value of fi
for n = 1:80;
QnL=QnL+fi(n)*transpose(fi(n));
QnR=QnR+fi(n)*transpose(fi(n));
thetaMLL=thetaMLL+(inv(QnL)*fi(n)*(wL(n)-fi(n)*thetaMLL));
thetaMLR=thetaMLR+(inv(QnR)*fi(n)*(wR(n)-fi(n)*thetaMLR));
thetaRLSL_vector(n)= thetaMLL(4,1)*t(n).^3 + thetaMLL(3,1)*t(n).^2+ thetaMLL(2,1) * t(n) + thetaMLL(1,1) * 1;
thetaRLSR_vector(n)= thetaMLR(4,1)*t(n).^3 + thetaMLR(3,1)*t(n).^2+ thetaMLR(2,1) * t(n) + thetaMLR(1,1) * 1;
end
% ploting section, the same as in 1 a) until the end of section
subplot(3,1,1);
plot(t,wL,'*',t,thetaL_vector,t,thetaRLSL_vector,'--');
xlabel('time[s]');
ylabel('wL[m/s]');
title('Angular velocity of left wheel');
legend('real values','estimated value','recursive least squares');
subplot(3,1,2);
plot(t,wR,'*',t,thetaR_vector,t,thetaRLSR_vector,'--');
xlabel('time[s]');
% not sure
ylabel('wR[m/s]');
title('Angular velocity of right wheel');
legend('real values','estimated value','recursive least squares');
subplot(3,1,3);
plot(wL,wR,'*',thetaL_vector,thetaR_vector,thetaRLSL_vector,thetaRLSR_vector,'--');
xlabel('X position[m]');
ylabel('Y position[m]');
title('Position of robot in X-Y plane');
legend('real values','estimated value','recursive least squares');
%% 1 c) Recursive factor with forgeting factors
% code is a copy of previous one with few changes of names and added two forgeting factors
% in this part i have used the same coveriance matrix and the same theta as before still I am not sure about it
% in this part for every wheel I have to use two different forgeting factor
% you can easly recognize them just take a look at the name of variable
% calculation of covariance of theta values
covL=cov(thetaL);
covR=cov(thetaR);
% assigment of values to variable used in algorithm
thetaMLLF1=thetaL;
thetaMLLF2=thetaL;
thetaMLRF1=thetaR;
thetaMLRF2=thetaR;
% inversion covariance values
QnLF1=inv(covL);
QnLF2=inv(covL);
QnRF1=inv(covR);
QnRF2=inv(covR);
% Values of forgeting factors for every case, !!!!!
% VALUES ALE COMPLETLY RANDOM WE NEED TO TUNE THAT THINK
F1L= 0.95;
F2L= 0.9;
F1R=F1L;
F2R=F2L;
% calculation of recursive least squares for every new value of fi
for n = 1:80;
    % recursive least squares forgeting factor algorithm
QnLF1=F1L*QnLF1+fi(n)*transpose(fi(n));
QnLF2=F2L*QnLF2+fi(n)*transpose(fi(n));
QnRF1=F1R*QnRF1+fi(n)*transpose(fi(n));
QnRF2=F2R*QnRF2+fi(n)*transpose(fi(n));
thetaMLLF1=thetaMLLF1+(inv(QnLF1)*fi(n)*(wL(n)-fi(n)*thetaMLLF1));
thetaMLLF2=thetaMLLF2+(inv(QnLF2)*fi(n)*(wL(n)-fi(n)*thetaMLLF2));
thetaMLRF1=thetaMLRF1+(inv(QnRF1)*fi(n)*(wR(n)-fi(n)*thetaMLRF1));
thetaMLRF2=thetaMLRF2+(inv(QnRF2)*fi(n)*(wR(n)-fi(n)*thetaMLRF2));
% Below are placed all vectors with calculated values
thetaRLSLF1_vector(n)= thetaMLLF1(4,1)*t(n).^3 + thetaMLLF1(3,1)*t(n).^2+ thetaMLLF1(2,1) * t(n) + thetaMLLF1(1,1) * 1;
thetaRLSLF2_vector(n)= thetaMLLF2(4,1)*t(n).^3 + thetaMLLF2(3,1)*t(n).^2+ thetaMLLF2(2,1) * t(n) + thetaMLLF2(1,1) * 1;
thetaRLSRF1_vector(n)= thetaMLRF1(4,1)*t(n).^3 + thetaMLRF1(3,1)*t(n).^2+ thetaMLRF1(2,1) * t(n) + thetaMLRF1(1,1) * 1;
thetaRLSRF2_vector(n)= thetaMLRF2(4,1)*t(n).^3 + thetaMLRF2(3,1)*t(n).^2+ thetaMLRF2(2,1) * t(n) + thetaMLRF2(1,1) * 1;
a=cov(thetaMLLF1);
end
% ploting section, the same as in 1 a) until the end of section there might
% be to much of this plots you know how to delete this
subplot(3,1,1);
plot(t,wL,'*',t,thetaL_vector,t,thetaRLSL_vector,'--',t,thetaRLSLF1_vector,'*-',t,thetaRLSLF2_vector,'b--o');
xlabel('time[s]');
ylabel('wL[m/s]');
title('Angular velocity of left wheel');
legend('real values','estimated value','recursive least squares',sprintf('recursive least squares ff(%1.3f)',F1L),sprintf('recursive least squares ff(%1.3f)',F2L));
subplot(3,1,2);
plot(t,wR,'*',t,thetaR_vector,t,thetaRLSR_vector,'--',t,thetaRLSLF1_vector,'*-',t,thetaRLSLF2_vector,'b--o');
xlabel('time[s]');
% not sure
ylabel('wR[m/s]');
title('Angular velocity of right wheel');
legend('real values','estimated value','recursive least squares',sprintf('recursive least squares ff(%1.3f)',F1R),sprintf('recursive least squares ff(%1.3f)',F2R));
subplot(3,1,3);
plot(wL,wR,'*',thetaL_vector,thetaR_vector,thetaRLSL_vector,thetaRLSR_vector,'--',thetaRLSLF1_vector,thetaRLSRF1_vector,'*-',thetaRLSLF2_vector,thetaRLSRF2_vector,'b--o');
xlabel('X position[m]');
ylabel('Y position[m]');
title('Position of robot in X-Y plane');
legend('real values','estimated value','recursive least squares',sprintf('recursive least squares ff(%1.3f)',F1R),sprintf('recursive least squares ff(%1.3f)',F2R));
%% 1 d) "one step ahead prediction"
% So about this point I do know sh*t so i decided that there is no point in
% doing that stuff I can imagine how it should look like it is not so hard
% to se that but first I want you guys to to something with there prevoius
% exercises
% Same assumption as in previous subpoints still all of them might be wrong
% at least code is proper
covL=cov(thetaL);
covR=cov(thetaR);
thetaSAL=thetaL;
thetaSAR=thetaR;
QnSAL=inv(covL);
QnSAR=inv(covR);
F1=0.9
for n = 1:80;
    % recursive least squares forgeting factor algorithm
QnSAL=F1*QnSAL+fi(n)*transpose(fi(n));
QnSAR=F2L*QnSAR+fi(n)*transpose(fi(n));

thetaSAL=thetaSAL+(inv(QnLF1)*fi(n)*(wL(n)-fi(n)*thetaSAL));
thetaSAR=thetaSAR+(inv(QnLF2)*fi(n)*(wL(n)-fi(n)*thetaSAR));

% Below are placed all vectors with calculated values
if (n == 1 )
thetaRLSLF1_vector(n)= thetaSAL(4,1)*t(n).^3 + thetaSAL(3,1)*t(n).^2+ thetaSAL(2,1) * t(n) + thetaSAL(1,1) * 1;
thetaRLSLF2_vector(n)= thetaSAR(4,1)*t(n).^3 + thetaSAR(3,1)*t(n).^2+ thetaSAR(2,1) * t(n) + thetaSAR(1,1) * 1;
thetaRLSLF1_vector(n+1)= thetaSAL(4,1)*t(n+1).^3 + thetaSAL(3,1)*t(n+1).^2+ thetaSAL(2,1) * t(n+1) + thetaSAL(1,1) * 1;
thetaRLSLF2_vector(n+1)= thetaSAR(4,1)*t(n+1).^3 + thetaSAR(3,1)*t(n+1).^2+ thetaSAR(2,1) * t(n+1) + thetaSAR(1,1) * 1;
covL=cov(thetaSAL);
covR=cov(thetaSAR);
else
    
    
end

a=cov(thetaMLLF1);
end


%%Exercise 2
% a) implementation of function robot_ode
RL=0.2;
RR=0.2;
L=0.6;
param = [RL,RR,L];




