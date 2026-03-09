clc
clear
close all

% -------- Parameters --------
Ks = 100;
Kt = 1000;

Ws = 1000;
Wu = 100;

g = 386;

ms = Ws/g;
mu = Wu/g;

Ct = 0.01;

% -------- Parameters --------
Cs_values = [5 10 30 80];   % design variable, initial guess

figure
hold on
grid on

for i = 1:length(Cs_values)

    Cs = Cs_values(i);

% State-Space Matrices

A = [  0                1                  0                 0;
      -Ks/ms        -Cs/ms              Ks/ms            Cs/ms;
       0                0                  0                 1;
       Ks/mu         Cs/mu        -(Kt+Ks)/mu     -(Ct+Cs)/mu ];

B = [ 0;
      0;
      0;
      Kt/mu ];

C = [ -Ks/ms   -Cs/ms   Ks/ms   Cs/ms ];

D = [ 0 ];

% System

sys = ss(A,B,C,D);

% Plot 
    bodemag(sys)

end

Cs = 30;   % chosen value

legend('Cs=5','Cs=10', 'Cs=30','Cs=80')
title('Sprung Mass Acceleration / Road Input')


