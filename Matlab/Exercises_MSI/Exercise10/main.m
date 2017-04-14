% Exercise 10: Frequency Domain Identyfication
% Michal Blazej, Mohamet Emara, Juan Sebastian Diaz
% Function test_system acepts Nx1 vector u[V] and sampling time dt[s]
% Function returns Nx1 output vector
% Amplitude of input vector should be beetween -10 and +10 V
%% Exercise 1 a) Periodic signal calculatio of amplification and phase shift
% Definition of frequency, input vector and simulation time
clc;clear variables;
Fs = 1000;            % Sampling frequency
T = 1/Fs;             % Sampling period
L = 1000;             % Length of signal
t = (0:L-1)*T;        % Time vector
F=1;
% Acording to Nyquist frequency the minimal frequency of sampling time
% should be at lest twice higher than highest frequency in signal, so it
% should be more than 2 Hz however I am using here higher sampling time
% becouse it will give me a good view of signal sampling frequency is equal
% to 1/dt
u=cos(2*pi*F*t);
% Use of test_system
y=test_system(u',T);
y=y';
figure(1)
subplot(2,2,1)
plot(t,u);
legend('Input vector');
title('Input signal with respect to time');
xlabel('time[s]');
ylabel('value of signal[V]');
subplot(2,2,2)
plot(t,y);
legend('Input vector');
title('Output signal with respect to time');
xlabel('time[s]');
ylabel('value of signal[V]');
% We can use Syste
u=transpose(u);y=transpose(y);
Y = fft(y);
U= fft(u);
% calculation of frequency response for input vector
U2 = abs(U/L);
U1 = U2(1:L/2+1);
U1(2:end-1) = 2*U1(2:end-1);
U1=U1(1:10);
f = 0:1:9;
subplot(2,2,3)
plot(f,U1);
legend('FFT of input signal');
title('Single-Sided Amplitude Spectrum of u(t)');
xlabel('Frequency[Hz]');
ylabel('Peak values(f)');
% calculation of frequency respose for output vector
Y2 = abs(Y/L);
Y1 = Y2(1:L/2+1);
Y1(2:end-1) = 2*Y1(2:end-1);
Y1=Y1(1:10);
subplot(2,2,4);
plot(f,Y1)
title('Single-Sided Amplitude Spectrum of y(t)')
xlabel('f (Hz)')
ylabel('|Peak values(f)|')
legend('FFT of output signal');
% This is another aproach to calculate Amplitude and Phase shift
magnitude=Y(2,1)/U(2,1);
angle=rad2deg(angle(Y(2,1)));
%output of function looks wierd
% Computation of amplitude and phase shift of data code from Matlab forum
% webstie 
% http://de.mathworks.com/matlabcentral/newsreader/view_thread/154499
%% 1c) Generation of multi sine
% N = 10;
%time vector declaration
Fs = 1000;            % Sampling frequency
T = 1/Fs;             % Sampling period
L = 3000;             % Length of signal
t = (0:L-1)*T;        % Time vector
f_base=1;
% declaration of the u_dummy variable
u_dummy=0;
% auxiliary variables
N=10;
s=2;
b=1;
% Amplitude computation
A = 9.99/(N/s);
for k = 1:s:N
    f_base=1;
    u_dummy=u_dummy+A*cos(2*pi*k*f_base*t); 
    freq_vector(b,1)=k;
    b=b+1;
end
u_multisine=u_dummy;
u_multisine=transpose(u_multisine);
%% 1 d) Aplication of multisine to system
% computation of fft for multisine
y_multisine=test_system(u_multisine,T);
% plots of input and output functions
figure(2);
subplot(2,2,1)
plot(t,u_multisine);
legend('Input vector');
title('Multisinisoudal input signal with respect to time');
xlabel('time[s]');
ylabel('value of signal[V]');
subplot(2,2,2);
plot(t,y_multisine);
legend('Input vector');
title('Multisinisoudal output signal with respect to time');
xlabel('time[s]');
ylabel('value of signal[V]');
% computation of fft changed lenght of the vector, I have noticed that fft
% works properly only for signal of one period, that is the reason why
% vectors u_multisine and y_multisine has changed, it works properly for
% input vector
u_multisine=u_multisine(1:1000,1);
y_multisine=y_multisine(1:1000,1);
L=1000;
U_MULTI= fft(u_multisine);
Y_MULTI= fft(y_multisine);
UMULTI2 = abs(U_MULTI/L);
UMULTI1 = UMULTI2(1:L/2+1);
UMULTI1(2:end-1) = 2*UMULTI1(2:end-1);
YMULTI2 = abs(Y_MULTI/L);
YMULTI1 = YMULTI2(1:L/2+1);
YMULTI1(2:end-1) = 2*YMULTI1(2:end-1);
t_f=0:1:500;
subplot(2,2,3);
plot(t_f,UMULTI1);
axis([0 N 0 A]);
legend('FFT of multisinusidiol input signal');
title('Single-Sided Amplitude Spectrum of u(t)');
xlabel('Frequency[Hz]');
ylabel('Peak values(f)');
subplot(2,2,4)
plot(t_f,YMULTI1);
axis([0 N 0 10]);
legend('FFT of multisinusidiol output signal');
title('Single-Sided Amplitude Spectrum of u(t)');
xlabel('Frequency[Hz]');
ylabel('Peak values(f)');
% We have to find a different way to plot a bode diagram of test_system.p




%% 1 f) Computation of crest factor
input_max=max(u_multisine);
input_rms=rms(u_multisine);
cf=input_max/input_rms;
%% 1 g) Frequency domain multisine
t=0:1:2000;
U_MULTISINE_1=0:1:2000;
U_MULTISINE_1(1)=9.99;
U_MULTISINE_1(3)=9.99;
U_MULTISINE_1(5)=9.99;
U_MULTISINE_1(7)=9.99;
U_MULTISINE_1(9)=9.99;
u_multisine_1=ifft(U_MULTISINE_1);
figure(3)
plot(t,u_multisine_1);

 
    
