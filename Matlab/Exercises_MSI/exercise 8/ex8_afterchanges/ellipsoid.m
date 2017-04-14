%Compute eigenvalues and eigenvectors for estimators
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
plot(elipse2(1,:),elipse2(2,:),'r');
legend('ellipse LLS','elipse WLS');
title('Confidence ellipses for covariance matrices WLS and LLS')