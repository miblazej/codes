% Exercise 4: Weighted Least Squares
close all; clear;
clear variables;

%% Task 1: Linear Least Squares
%% a) Load data 
import_data;
% pressure: contains all pressure values in the order given by the dataset
% temperature: contains all temperature values in the order given by the dataset
% incomplete dataset (i.e. not all measurements of a day available).
% timeStamp: contains the date when the measurement was taken as numerical
% value.

% Plot Measurements



%% b) Mean, Standard Deviation, Variance
%check are all data sets complete
b=checktimeStamp(timeStamp); %% if b == 1 data correct
if b == 1
    a = 'Data correct'
end
pres = [0.9 0.8 0.7 0.6 0.5 0.4 0.3 0.2];
% Creates matrix with mean,standart deviation and variation and place every
% experiment in different row
% V[8x3] - matrix with mean ....
% temp_vect[531x8] - table with all data one row for every experiment  
[V,temp_vect]=ex1_b(temperature); % data is divided
% plot of computed data
subplot(3,2,2);
plot(pres,V(:,1));
xlabel('pressure');
ylabel('temperature mean value');
title('Relationship beetween temperature and  prressure');
legend('mean');
grid on
subplot(3,2,3);
plot(pres,V(:,2));
xlabel('pressure');
ylabel('temperature std');
title('Relationship beetween standart deviation of temperature and  pressure');
legend('standart deviation')
grid on
subplot(3,2,4);
plot(pres,V(:,3));
xlabel('pressure');
ylabel('temperature variance');
title('Relationship beetween temprerature variance and pressure');
legend('variation');
grid on
%% c) Plot Histogram + educated guess on distribution
% preperation of data from every value the mean value for specific pressure
% level is substracted,histogram is showing the noise noise is gausian 
temp_wo_mean_juan = zeros(1,4248);
for n = 1 : 4248
g=mod(n,8);
if g == 0
    g=8;
end
temp_wo_mean_juan(1,n) = temperature(n,1) - V(g,1);    
    
end
subplot(3,2,5)
histogram(temp_wo_mean_juan,40);
xlabel('Temperature');
ylabel('Number of measurements')
title('histogram');
grid on
%% d) Linear Least Squares
% Linear Fit
% Compute estimator for each data
theta_vec = zeros(2,531);
pressure1 = [0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9];
%for every experiment different values of theta1 and theta2 are computed
for n = 1 : 531
fi = ones(8,2);
y=transpose(fliplr(temp_vect(n,:)));
fi(:,2)=pressure1';
theta_vec(:,n) = inv(fi'*fi)*fi'*y;
end
% Average estimator over all dates
% computation of mean value and ploting them on one plot
th2=mean(theta_vec(1,:));
th1=mean(theta_vec(2,:));
subplot(3,2,1)
pressure_f=fliplr(pres);
y_LLS=th2+th1*pressure1;
plot(pressure,temperature,'*');
hold on
plot(pressure1,y_LLS);
xlabel('Pressure');
ylabel('Temperature');
title('Relationship beetween temperature and pressure')
legend('Experiments data','LLS');
grid on

%% e) Compute the covariance matrix of the estimator
% Hint: Search for sample covariance matrix, e.g. in MATLAB documentation
% on command COV.
% values computed with respect to equation
cov_mat=zeros(2,2);
cov_mat(1,1) =  (1/(length(theta_vec)-1))*sum(theta_vec(1,:).^2-mean(theta_vec(1,:)).^2);
cov_mat(1,2) = (1/(length(theta_vec)-1))*sum(theta_vec(1,:).*theta_vec(2,:)-mean(theta_vec(1,:))*mean(theta_vec(2,:)));
cov_mat(2,1)=cov_mat(1,2);
cov_mat(2,2) = (1/(length(theta_vec)-1))*sum(theta_vec(2,:).^2-mean(theta_vec(2,:)).^2)
%% Task 2: Weighted Least Squares:
%% a) Formulate WLS formula
% On paper
%% Write WLF formula on the paper
%% b) Compute covariance matrix of measurement noise (y - mean)
% Creation of matrix with noise and computetion of Weight matrix, diagonal
% values in coveriance matrix are equal to variation then you just need to
% extract them invert and put to another matrix
temp_vect_mean = zeros(531,8);
r=1;
for n = 1 :4248
    g=mod(n,8);
    if g == 0
        g=8;
    end
temp_vect_mean(r,g) = temp_wo_mean_juan(1,n);
if g == 8
    r=r+1;
end
end
cov_matrix=cov(temp_vect_mean);
cov_diag=diag(cov_matrix);
ones1=ones(8,1);
cov_diag=ones1./cov_diag;
W=diag(cov_diag);

%% c) WLS
% Compute estimator for each dat
% same stuf as in exercise 1 the only difference is that here matrix W is
% used
theta_vec_2 = zeros(2,531);
pressure1 = [0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9];
for n = 1 : 531
fi = ones(8,2);
y=transpose(fliplr(temp_vect(n,:)));
fi(:,2)=pressure1';
theta_vec_2(:,n) = inv(fi'*W*fi)*fi'*W*y;
end
% Average estimator over all dates
th2_2=mean(theta_vec_2(1,:));
th1_2=mean(theta_vec_2(2,:));
subplot(3,2,6)
y_LLS_W=th2_2+th1_2*pressure1;
plot(pressure,temperature,'*');
hold on
plot(pressure1,y_LLS_W);
xlabel('Pressure');
ylabel('Temperature');
title('Relationship beetween temperature and pressure')
legend('Experiments data','LLS W');
grid on
%% d) Compute the covariance matrix of the estimator \theta_WLS
% Hint: Search for sample covariance matrix, e.g. in MATLAB documentation
% on command COV.
cov_mat_W=zeros(2,2);
cov_mat_W(1,1) = (1/(length(theta_vec)-1))*sum(theta_vec_2(1,:).^2-mean(theta_vec_2(1,:)).^2);
cov_mat_W(1,2) = (1/(length(theta_vec)-1))*sum(theta_vec_2(1,:).*theta_vec_2(2,:)-mean(theta_vec_2(1,:))*mean(theta_vec_2(2,:)));
cov_mat_W(2,1)=cov_mat(1,2);
cov_mat_W(2,2) = (1/(length(theta_vec)-1))*sum(theta_vec_2(2,:).^2-mean(theta_vec_2(2,:)).^2);
% Compare matrices
cov_mat
cov_mat_W
%% e) confidence ellipsoids
%Compute eigenvalues and eigenvectors for estimators
% Just used code from script
[V1,D1] = eig(cov_mat);
[V2,D2] = eig(cov_mat_W);
%Generate coordinates of 50 points on a unit circle
xy_circle=[cos(linspace(0,2*pi,50));sin(linspace(0,2*pi,50))];
%Generate the points of the confidence ellipse
elipse1 = [th1;th2] * ones(1,50) + V1*sqrt(D1)*xy_circle;
elipse2 = [th1_2;th2_2] * ones(1,50) + V2*sqrt(D2)*xy_circle;
figure(2)
plot(elipse1(1,:),elipse1(2,:));
hold on
plot(elipse2(1,:),elipse2(2,:));
legend('elipse1','elipse2');

