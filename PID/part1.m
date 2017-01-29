%PD Controller
%Meros A

close all;
clear all;

kp = 200;%210
kd = 0.475;%0.5

%(4500kp+4500kd*s)/(s^2 + (361.2+4500kd)*s + 4500kp)
nom_1 = 4500*kd;
nom_2 = 4500*kp;
denom_1 = 1;
denom_2 = 361.2+nom_1;
denom_3 = nom_2;

sys = tf([nom_1,nom_2], [denom_1,denom_2,denom_3]);
t = linspace(0,0.2,1600);
R = ones( size(t) ) .* (t >= 0) ;
R=R.*t;
figure(1);
plot(t,R);
title('Input Ramp');
xlabel('time(sec)');

Y = lsim(sys,R,t); 
error = abs(Y' - R); 
figure(2);
plot(t,Y);
title('Output');
xlabel('time(sec)');
figure(3);
plot(t, error);
title('Error');
xlabel('Time(sec)');
assert(all(error<0.2),'Large error')
figure(4);
stepplot(sys);
stepinfo(sys)