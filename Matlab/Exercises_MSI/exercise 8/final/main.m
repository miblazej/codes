%% Michal Blazej, Mohamed Emara, Juanito Sebastian Diaz
%% Data import
clc;
clear variables;
XY=importdata('exercise8_data.mat');
% Asigment of imported data to specific values
X = XY.XYm(:,1); 
Y = XY.XYm(:,2);
%% 1 a) 4-th order polynomial through data
% Declaration of regresion matrix
t = 0:0.0159:79*0.0159;
phi=ones(80,5); 
phi(:,2)=transpose(t);
phi(:,3)=transpose(t).^2; 
phi(:,4)=transpose(t).^3; 
phi(:,5)=transpose(t).^4;
% Calculation of LLS estimatiors
thetaX= (phi'*phi)\(phi'*X); 
thetaY= (phi'*phi)\(phi'*Y); 
% Data calculation
predict_LLS_X = (thetaX(5,1)*t.^4+thetaX(4,1)*t.^3 + thetaX(3,1)*t.^2+ thetaX(2,1) * t + thetaX(1,1) * ones(1,80))';
predict_LLS_Y = (thetaY(5,1)*t.^4+thetaY(4,1)*t.^3 + thetaY(3,1)*t.^2+ thetaY(2,1) * t + thetaY(1,1) * ones(1,80))';
% Plot LLS
figure(1);
subplot(2,2,1);
plot(t,X,'*',t,predict_LLS_X);
xlabel('time[s]');
ylabel('X[cm]');
title('Position X of Robot (real vs. estimation LLS)');
legend('real values','estimated values');

subplot(2,2,2);
plot(t,Y,'*',t,predict_LLS_Y);
xlabel('time[s]');
ylabel('Y[cm]');
title('Position Y of Robot (real vs. estimation LLS)');
legend('real values','estimated value');

subplot(2,2,[3 4]);
plot(X,Y,'*',predict_LLS_X,predict_LLS_Y)
xlabel('X position[cm]');
ylabel('Y position[cm]');
title('Position of robot in X-Y plane (LLS)');
legend('real values','estimated value');
% It do not work properly but I have expected that kind of behaviour
%% 1 b) Recursive square to estimate 4-th order polynomial
% calculation of covariance of theta values
QnX= inv(cov(thetaX));
QnY= inv(cov(thetaY));
% % assigment of values to variable used in algorithm
thetaML_X=thetaX;
thetaML_Y=thetaY;
% calculation of recursive least squares for every new value of fi
for n = 1:80;
  QnX = QnX + phi(n)*transpose(phi(n));
  QnY = QnY + phi(n)*transpose(phi(n));
  thetaML_X = thetaML_X +(inv(QnX)*phi(n)*(X(n)-phi(n)*thetaML_X)); 
  thetaML_Y = thetaML_Y +(inv(QnY)*phi(n)*(Y(n)-phi(n)*thetaML_Y)); 
  predict_RLS_X(n) = thetaML_X(5,1)*t(n).^4 + thetaML_X(4,1)*t(n).^3 + thetaML_X(3,1)*t(n).^2+ thetaML_X(2,1) * t(n) + thetaML_X(1,1) * 1; 
  predict_RLS_Y(n) = thetaML_Y(5,1)*t(n).^4 + thetaML_Y(4,1)*t(n).^3 + thetaML_Y(3,1)*t(n).^2+ thetaML_Y(2,1) * t(n) + thetaML_Y(1,1) * 1;
end
% Plot RLS
figure(2);
subplot(2,2,1);
plot(t,X,'*',t,predict_RLS_X);
xlabel('time[s]');
ylabel('X[cm]');
title('Position X of Robot (real vs. estimation RLS)');
legend('real values','estimated values');

subplot(2,2,2);
plot(t,Y,'*',t,predict_RLS_Y);
xlabel('time[s]');
ylabel('Y[cm]');
title('Position Y of Robot (real vs. estimated RLS)');
legend('real values','estimated value');

subplot(2,2,[3 4]);
plot(X,Y,'*',predict_RLS_X,predict_RLS_Y);
xlabel('X position[cm]');
ylabel('Y position[cm]');
title('Position of robot in X-Y plane (RLS)');
legend('real values','estimated value');

%% 1 c) Recursive factor with forgeting factors
 % Initial variables
    QnX1= inv(cov(thetaX));
    QnY1= inv(cov(thetaY));
    QnX2=QnX1;
    QnY2=QnY1;

    thetaML_X1=thetaX;
    thetaML_Y1=thetaY;
    thetaML_X2=thetaML_X1;
    thetaML_Y2=thetaML_Y1;
    
    alpha1 = 0.98;
    alpha2 = 0.1;
   
    for n = 1:80;
        % calcluation with forgeting factor alpha1
        QnX1 = alpha1*QnX1 + phi(n)*transpose(phi(n));
        QnY1 = alpha1*QnY1 + phi(n)*transpose(phi(n));
        thetaML_X1 = thetaML_X1 +(inv(QnX1)*phi(n)*(X(n)-phi(n)*thetaML_X1)); 
        thetaML_Y1 = thetaML_Y1 +(inv(QnY1)*phi(n)*(Y(n)-phi(n)*thetaML_Y1)); 
        predict_RLS_X_ff1(n) = thetaML_X1(5,1)*t(n).^4 + thetaML_X1(4,1)*t(n).^3 + thetaML_X1(3,1)*t(n).^2+ thetaML_X1(2,1) * t(n) + thetaML_X1(1,1) * 1; 
        predict_RLS_Y_ff1(n) = thetaML_Y1(5,1)*t(n).^4 + thetaML_Y1(4,1)*t(n).^3 + thetaML_Y1(3,1)*t(n).^2+ thetaML_Y1(2,1) * t(n) + thetaML_Y1(1,1) * 1;
        %calculation with forgeting factor alpha2
        QnX2 = alpha2*QnX2 + phi(n)*transpose(phi(n));
        QnY2 = alpha2*QnY2 + phi(n)*transpose(phi(n));
        thetaML_X2 = thetaML_X2 +(inv(QnX2)*phi(n)*(X(n)-phi(n)*thetaML_X2)); 
        thetaML_Y2 = thetaML_Y2 +(inv(QnY2)*phi(n)*(Y(n)-phi(n)*thetaML_Y2)); 
        predict_RLS_X_ff2(n) = thetaML_X2(5,1)*t(n).^4 + thetaML_X2(4,1)*t(n).^3 + thetaML_X2(3,1)*t(n).^2+ thetaML_X2(2,1) * t(n) + thetaML_X2(1,1) * 1; 
        predict_RLS_Y_ff2(n) = thetaML_Y2(5,1)*t(n).^4 + thetaML_Y2(4,1)*t(n).^3 + thetaML_Y2(3,1)*t(n).^2+ thetaML_Y2(2,1) * t(n) + thetaML_Y2(1,1) * 1; 
    end
    
    % Plot RLS with forgetting factor 1 and 2, value of forgeting factor is
    % printed in legend

    figure(3);

    subplot(2,2,1);
    hold on;
    plot(t,X,'*',t,predict_RLS_X,t,predict_RLS_X_ff1,'g--',t,predict_RLS_X_ff2,'b--');
    xlabel('time[s]');
    ylabel('X[cm]');
    title('Position X of Robot (real vs. estimation RLS with ff)');
    legend('real values','recursive least squares',sprintf('recursive least squares ff(%1.3f)',alpha1),sprintf('recursive least squares ff(%1.3f)',alpha2));

    subplot(2,2,2);
    hold on;
    plot(t,X,'*',t,predict_RLS_Y,t,predict_RLS_Y_ff1,'g--',t,predict_RLS_Y_ff2,'b--');
    xlabel('time[s]');
    ylabel('Y[cm]');
    title('Position Y of Robot (real vs. estimated RLS with ff)');
    legend('real values','recursive least squares',sprintf('recursive least squares ff(%1.3f)',alpha1),sprintf('recursive least squares ff(%1.3f)',alpha2));

    subplot(2,2,[3 4]);
    hold on;
    plot(X,Y,'*',predict_RLS_X,predict_RLS_Y,predict_RLS_X_ff1,predict_RLS_Y_ff1,'g--',predict_RLS_X_ff2,predict_RLS_Y_ff2,'b--');
    xlabel('X position[cm]');
    ylabel('Y position[cm]');
    title('Position of robot in X-Y plane (RLS with ff)');
    legend('real values','recursive least squares',sprintf('recursive least squares ff(%1.3f)',alpha1),sprintf('recursive least squares ff(%1.3f)',alpha2));
    
    %% 1 d) "one step ahead prediction"
    % Value assigments
    QnX1_p= inv(cov(thetaX));
    QnY1_p= inv(cov(thetaY));
    thetaML_X_p=thetaX;
    thetaML_Y_p=thetaY;
    
    % Forgeting factor, not used
    % alpha1 = 0.98;
    
    % Calculation of data for each step
    
    for n = 1:80
    if (n == 1) 
    % Calculation of initial value of predicitions     
    QnX1_p = QnX1_p + phi(n)*transpose(phi(n));
    QnY1_p = QnY1_p + phi(n)*transpose(phi(n));    
    thetaML_X_p = thetaML_X_p +(inv(QnX1_p)*phi(n)*(X(n)-phi(n)*thetaML_X_p)); 
    thetaML_Y_p = thetaML_Y_p +(inv(QnY1_p)*phi(n)*(Y(n)-phi(n)*thetaML_Y_p));  
    % calculation for initial point
    predict_RLS_X_p(n) = thetaML_X_p(5,1)*t(n).^4 + thetaML_X_p(4,1)*t(n).^3 + thetaML_X_p(3,1)*t(n).^2+ thetaML_X_p(2,1) * t(n) + thetaML_X_p(1,1) * 1; 
    predict_RLS_Y_p(n) = thetaML_Y_p(5,1)*t(n).^4 + thetaML_Y_p(4,1)*t(n).^3 + thetaML_Y_p(3,1)*t(n).^2+ thetaML_Y_p(2,1) * t(n) + thetaML_Y_p(1,1) * 1; 
    % extrapolation calculated with initial values of theta  
    predict_RLS_X_p(n+1) = thetaML_X_p(5,1)*t(n+1).^4 + thetaML_X_p(4,1)*t(n+1).^3 + thetaML_X_p(3,1)*t(n+1).^2+ thetaML_X_p(2,1) * t(n+1) + thetaML_X_p(1,1) * 1; 
    predict_RLS_Y_p(n+1) = thetaML_Y_p(5,1)*t(n+1).^4 + thetaML_Y_p(4,1)*t(n+1).^3 + thetaML_Y_p(3,1)*t(n+1).^2+ thetaML_Y_p(2,1) * t(n+1) + thetaML_Y_p(1,1) * 1;
    % calculation and maybe plot of confidence elipsoids
    
    elseif ((n >1 ) && (n<80))
    QnX1_p = QnX1_p + phi(n)*transpose(phi(n));
    QnY1_p = QnY1_p + phi(n)*transpose(phi(n)); 
    thetaML_X_p = thetaML_X_p +(inv(QnX1_p)*phi(n)*(X(n)-phi(n)*thetaML_X_p)); 
    thetaML_Y_p = thetaML_Y_p +(inv(QnY1_p)*phi(n)*(Y(n)-phi(n)*thetaML_Y_p));  
    predict_RLS_X_p(n+1) = thetaML_X_p(5,1)*t(n+1).^4 + thetaML_X_p(4,1)*t(n+1).^3 + thetaML_X_p(3,1)*t(n+1).^2+ thetaML_X_p(2,1) * t(n+1) + thetaML_X_p(1,1) * 1; 
    predict_RLS_Y_p(n+1) = thetaML_Y_p(5,1)*t(n+1).^4 + thetaML_Y_p(4,1)*t(n+1).^3 + thetaML_Y_p(3,1)*t(n+1).^2+ thetaML_Y_p(2,1) * t(n+1) + thetaML_Y_p(1,1) * 1; 
    % calculation and maybe plot of confidence elipsoids
    
    
    
    end      
    end
    
    
    
    figure(4)
    % for plot
    subplot(2,2,1);
    hold on;
    plot(t,X,'*',t,predict_RLS_X_p);
    xlabel('time[s]');
    ylabel('X[cm]');
    title('Position X of Robot (real vs. estimation RLS with extralpolation)');
    legend('real values','rls with extrapolatation');

    subplot(2,2,2);
    hold on;
    plot(t,X,'*',t,predict_RLS_Y_p);
    xlabel('time[s]');
    ylabel('X[cm]');
    title('Position X of Robot (real vs. estimation RLS with extralpolation)');
    legend('real values','rls with extrapolatation');
    
    subplot(2,2,[3 4]);
    hold on;
    plot(X,Y,'*',predict_RLS_X_p,predict_RLS_Y_p);
    xlabel('X position[cm]');
    ylabel('Y position[cm]');
    title('Position of robot in X-Y plane (RLS with extrapolation)');
    legend('real values','rls with extrapolatation');
    
   
    
    
    
%% Exercise 2
% parameters
t=0:0.0159:79*0.0159;
wL= XY.u(:,1);
wR= XY.u(:,2);
RL=0.2;
RR=0.2;
L=0.6;
x0=[0;0;0];
param = [RL,RR,L];
u=[wL,wR];
% use of sim functions
[x_sim] = sim_euler(t,x0,u,param); 
[x_sim1] = sim_rk4(t,x0,u,param);
% cirlces are similiar however one calculated with rk4 method is driffted
% the reason for that is value of half step that is added to xj you can
% created for data comparision
all_data=[x_sim;x_sim1];
data_deviation=x_sim-x_sim1;
