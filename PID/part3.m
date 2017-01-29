%PID Controller
%Meros C

close all;
clear all;

%Here we initialize the two gains of the controller...
%K_p = 0;
%K_i = 0;
%K_d = 0;

K = 2.718*(10^9);
denom_1 = 1;
denom_2 = 3008;
denom_3 = 400.26;

checked = 0;
babies = 0;
limit = 15*11*10*11*2*11;
%while (checked < limit)      
    %Create the system transfer function. See report for the details...
    %...we chose a rather brute-force way to get the desired parameters.
    for kp = 0:0.1:15
        for ki = 0:0.1:10
            for kd = 0:0.1:2
                checked = checked+1;
                nom_1 = K*kd;
                nom_2 = K*kp;
                nom_3 = K*ki;
                denom_4 = nom_1+400.26*3008;
                denom_5 = nom_2;
                denom_6 = nom_3;
                H = tf([nom_1 nom_2 nom_3], [denom_1 denom_2 denom_3 denom_4 denom_5 denom_6]);
                
                S = stepinfo(H);
                %[y,t] = step(H);
                %No point if there was no output...
                if (isnan(S.Overshoot))
                    continue;
                end
                %So here we KNOW we had SOME output. Let's check it!
                if ((S.Overshoot>5) || (S.RiseTime>0.005) || (S.SettlingTime>0.005)) 
                    continue;
                end
                babies = babies+1;
                goodones(babies,:) = [kp ki kd];
            end
        end
        kp
    end
%end

%We also pick a 5 kHz sampling frequency, and a final time of 0.1 sec.
%Fs = 1000;
%T_f = 2;
%t = 0:1/Fs:T_f;
%This is our input for the time response simulation: a ramp function.
%u = t.*heaviside(t);

%output = lsim(H,u,t);
%error = abs(output'-u);
%We compare and plot input and output. Is the desired difference achieved?
%plot(t, error);
%title('Parabolic Response: Absolute Error');
%xlabel('Time (sec)');

%We also need information on the step response.
%figure;
%step(H);