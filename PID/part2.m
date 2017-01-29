%PI Controller
%Meros B

close all;
clear all;

kp = 14.5;
ki = 10;

%(4500kp*s+4500ki)/(s^3 + 361.2*s^2 + 4500kp*s+4500ki)
nom_1 = 4500*kp;
nom_2 = 4500*ki;
denom_1 = 1;
denom_2 = 361.2;
denom_3 = nom_1;
denom_4 = nom_2;

sys = tf([nom_1 nom_2], [denom_1 denom_2 denom_3 denom_4]);
t = linspace(0,20,100000); 
R = ones( size(t) ) .* (t >= 0) ;
R = ((t.^2)./2).*R;
%plot(t,y);
%R = ((t.^2)./2).*heaviside(t);
figure(1);
plot(t,R);
title('Input Parabola');
xlabel('time(sec)');
Y = lsim(sys,R,t);
error = abs(Y' - R); 
figure(2);
plot(t,Y);
title('Output');
xlabel('time(sec)');
figure(3);
plot(t, error);
%debugging for error
title('Parabolic Response: Absolute Error');
xlabel('time(sec)');
assert(all(error<0.2),'Large error')
figure(4);
step(sys);
stepinfo(sys)