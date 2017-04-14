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
b=checktimeStamp(timeStamp); %% if b == 1 data correct
if b == 1
    a = 'Data correct'
end
pres = [0.9 0.8 0.7 0.6 0.5 0.4 0.3 0.2];
[V,temp_vect]=ex1_b(temperature); % data is divided
subplot(3,2,2);
plot(pres,V(:,1));
xlabel('pressure');
ylabel('temperature mean value');
title('Relationship beetween temperature and  prressure');
subplot(3,2,3);
plot(pres,V(:,2));
xlabel('pressure');
ylabel('temperature std');
title('Relationship beetween standart deviation of temperature and  pressure');
subplot(3,2,4);
plot(pres,V(:,3));
xlabel('pressure');
ylabel('temperature variance');
title('Relationship beetween temprerature variance and pressure');


%% c) Plot Histogram + educated guess on distribution
mean_temp=mean(temperature);
temp_wo_mean=temperature-mean_temp;


subplot(3,2,5)
histogram(temp_wo_mean,40);
xlabel('Temperature');
ylabel('Number of measurements')
title('histogram');

%% d) Linear Least Squares
% Linear Fit
% Compute estimator for each data
theta_vec = zeros(2,531);
pressure1 = [0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9];
for n = 1 : 531
fi = ones(8,2);
y=transpose(fliplr(temp_vect(n,:)));
fi(:,2)=pressure1';
theta_vec(:,n) = inv(fi'*fi)*fi'*y;
end
% Average estimator over all dates
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
cov_mat=zeros(2,2);
cov_mat(1,1) = mean(theta_vec(1,:).^2-mean(theta_vec(1,:)).^2);
cov_mat(1,2) = mean(theta_vec(1,:).*theta_vec(2,:)-mean(theta_vec(1,:))*mean(theta_vec(2,:)));
cov_mat(2,1)=cov_mat(1,2);
cov_mat(2,2) = mean(theta_vec(2,:).^2-mean(theta_vec(2,:)).^2);
cov_m_f=cov(theta_vec(1,:),theta_vec(2,:));
%% Task 2: Weighted Least Squares:
%% a) Formulate WLS formula
% On paper
%% Write WLF formula on the paper
%% b) Compute covariance matrix of measurement noise (y - mean)


%% c) WLS
% Compute estimator for each dat

% Average estimator over all dates

%% d) Compute the covariance matrix of the estimator \theta_WLS
% Hint: Search for sample covariance matrix, e.g. in MATLAB documentation
% on command COV.

% Compare matrices

%% e) confidence ellipsoids
%Compute eigenvalues and eigenvectors for estimators

%Generate coordinates of 50 points on a unit circle

%Generate the points of the confidence ellipse
