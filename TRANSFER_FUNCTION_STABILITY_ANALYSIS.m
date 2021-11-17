clear;
clc;
close all hidden

num=input('Enter numerator array of transfer function= ');
den=input('Enter denominator array of transfer function= ');
g=tf(num,den)
t=input('Enter time period (initial value:step value:final value= ');
% t=0:0.01:10;
y1=step(g,t);
y2=impulse(g,t);
resp(y1,y2,g,t)
                
function resp(y1,y2,g,t)
    fprintf('\nChoose figure to display: \n')
    fprintf('[1] Pole-zero map \t [2] Bode plot        \t [3] Nyquist plot \t [4] Root Locus \n')
    fprintf('[5] Step Response \t [6] Impulse Response \t [7] Combined Response \n')
    z=input('','s');
    switch z
        case '1'
            figure
            pzmap(g)
            grid on

        case '2'
            figure
            bode(g)
            grid on

        case '3'
            figure
            nyquist(g)
            grid on

        case'4'
            figure
            rlocus(g)
            grid on

        case'5'
            figure
            plot(t,y1)
            grid on
            title('step response')

        case'6'
            figure
            plot(t,y2)
            grid on
            title('impulse response')

        case '7'
            figure
            plot(t,y1,t,y2)
            grid on
            title('combined response')
            legend('step response','impulse response')

        otherwise
            fprintf('Invalid graph type chosen!!!\nPlease choose again!!\n\n')
            resp(y1,y2,g,t)
            
    end
    
    i=input('\nDo you wish to see another plot (Y/N)? : ','s');
    if i=='Y' || i=='y'
        resp(y1,y2,g,t)
        
    end
end
