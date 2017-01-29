clc;
clear all;
close all;
A=[0,1,0,0;20.6,0,0,0;0,0,0,1;-0.5,0,0,0];
B=[0;-1;0;0.5];
C=[1,0,0,0;0,0,1,0];
D=[0;0];

%%Erwthma 1o
Open_Loop_Question_A  % to open the model
print('-sOpen_Loop_Question_A','-dtiff','model1.tiff')
Cnt_Matrix = [B A*B A^2*B A^3*B];

Det = det(Cnt_Matrix);

if (Det ~= 0 )
    display('Det is ~= 0  so we have a Controllable System')
else
    display('Det is == 0  so we have an Uncontrollable System')
end

z = 0.5;
wn = 4;

pole_1_real = -z*wn;
pole_1_im   =  round(wn*sqrt(1-z^2),3);

pole_2_real =  -z*wn;
pole_2_im   =  round(-wn*sqrt(1-z^2),3);

%place the unimportant poles at -1500 and -3000
poles=[pole_1_real+1i*pole_1_im,pole_2_real+1i*pole_2_im,-1500,-3000];

%calculate K
K=place(A,B,poles);

%Run the simulation of the full state feedback
Full_State_Feedback_Question_A  % to open the model
print('-sFull_State_Feedback_Question_A','-dtiff','model2.tiff')
sim('Full_State_Feedback_Question_A');

figure
subplot(2,2,1)
plot(time,x(:,1))
title('Subplot 1: Gwnia')

subplot(2,2,2)
plot(time,x(:,2))
title('Subplot 2: Gwniakh Taxythta')

subplot(2,2,3)
plot(time,x(:,3))
title('Subplot 3: Thesi')

subplot(2,2,4)
plot(time,x(:,4))
title('Subplot 4: Taxythta')

figure();
plot(time,u);
title('U')
%%Erwthma 2o
Q=ones(4,4);
R=1;
[K_new,S,E] = lqr(A,B,Q,R);

%Run the simulation of the full state feedback
Full_State_Feedback_Question_B  % to open the model
print('-sFull_State_Feedback_Question_B','-dtiff','model3.tiff')
sim('Full_State_Feedback_Question_B');

figure
subplot(2,2,1)
plot(time,x(:,1))
title('Subplot 1: Gwnia')

subplot(2,2,2)
plot(time,x(:,2))
title('Subplot 2: Gwniakh Taxythta')

subplot(2,2,3)
plot(time,x(:,3))
title('Subplot 3: Thesi')

subplot(2,2,4)
plot(time,x(:,4))
title('Subplot 4: Taxythta')

figure();
plot(time,u);
title('U')

%%Erwthma 3o
%Run the simulation 
New_Wagon_Position  % to open the model
print('-sNew_Wagon_Position','-dtiff','model4.tiff')
sim('New_Wagon_Position');

figure
subplot(2,2,1)
plot(time,x(:,1))
title('Subplot 1: Gwnia')

subplot(2,2,2)
plot(time,x(:,2))
title('Subplot 2: Gwniakh Taxythta')

subplot(2,2,3)
plot(time,x(:,3))
title('Subplot 3: Thesi')

subplot(2,2,4)
plot(time,x(:,4))
title('Subplot 4: Taxythta')

%%Erwthma 4o
Obs_Matrix = [C;C*A;C*A^2;C*A^3];

Crucial = length(A)-rank(Obs_Matrix);

if (Crucial == 0 )
    display('we have an Observable System')
else
    display('we have a not Observable System')
end

K_Obs=place(A',C',poles)';

Observable_System  % to open the model
print('-sObservable_System','-dtiff','model5.tiff')
sim('Observable_System');

figure()
plot(time,x(:,1))
figure()
plot(time,x(:,2))
figure()
plot(time,x(:,3))
figure()
plot(time,x(:,4))

Q=ones(4,4);
R=1;
[K_new,S,E] = lqr(A,B,Q,R);
K = K_new;
Observable_System  % to open the model
print('-sObservable_System','-dtiff','model5.tiff')
sim('Observable_System');

figure()
plot(time,x(:,1))
figure()
plot(time,x(:,2))
figure()
plot(time,x(:,3))
figure()
plot(time,x(:,4))

%%Erwthma 5o
A=[0,1,0,0;20.9,0,0,0;0,0,0,1;-0.8,0,0,0];
B=[0;-1;0;0.5];
C=[1,0,0,0;0,0,1,0];
D=[0;0];

Cnt_Matrix = [B A*B A^2*B A^3*B];

Det = det(Cnt_Matrix);

if (Det ~= 0 )
    display('Det is ~= 0  so we have a Controllable System')
else
    display('Det is == 0  so we have an Uncontrollable System')
end

z = 0.5;
wn = 4;

pole_1_real = -z*wn;
pole_1_im   =  round(wn*sqrt(1-z^2),3);

pole_2_real =  -z*wn;
pole_2_im   =  round(-wn*sqrt(1-z^2),3);

%place the unimportant poles at -1500 and -3000
poles=[pole_1_real+1i*pole_1_im,pole_2_real+1i*pole_2_im,-1500,-3000];

%calculate K
K=place(A,B,poles);

%Run the simulation of the full state feedback
Full_State_Feedback_Question_A  % to open the model
print('-sFull_State_Feedback_Question_A','-dtiff','model2.tiff')
sim('Full_State_Feedback_Question_A');

figure
subplot(2,2,1)
plot(time,x(:,1))
title('Subplot 1: Gwnia')

subplot(2,2,2)
plot(time,x(:,2))
title('Subplot 2: Gwniakh Taxythta')

subplot(2,2,3)
plot(time,x(:,3))
title('Subplot 3: Thesi')

subplot(2,2,4)
plot(time,x(:,4))
title('Subplot 4: Taxythta')

figure();
plot(time,u);
title('U')