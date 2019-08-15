%% lab 6d runner

thresh = 15*pi/180;
Kpump = 150;
clp = .01661;
start_time = 0.05;
SAT = 6;
extract_theta = [0 0 1 0;
                 0 0 0 1];

Kt = 7.67 * 10^-3;
Km = 7.67 * 10^-3;
Kg = 3.71;
Jm = 3.9 * 10^-7;
Rm = 2.6;
r = 6.36 * 10^-3;
m = .23;
Lp = .3302;
M = .94;
g = 9.81;

denom = r^2*(m/4+M)+Jm*Kg^2;

a_22 = -Kt*Km*Kg^2/Rm/denom;
a_23 = -3*m*g*r^2/4/denom;
a_42 = 3*Kt*Km*Kg^2/4/Rm/Lp/denom;
a_43 = 3*g*(r^2*(m+M)+Jm*Kg^2)/4/Lp/denom;
b_2 = r*Kt*Kg/Rm/denom;
b_4 = -3*r*Kt*Kg/4/Rm/Lp/denom;

A = [0, 1, 0, 0;
     0, a_22, a_23, 0;
     0, 0, 0, 1;
     0, a_42, a_43, 0];
 
B = [0; b_2; 0; b_4];

C = [1, 0, 0, 0;
     0, 0, 1, 0];

D = [0, 0, 0, 0];

K = [-13.0283303673756 -14.7848226904404 -48.1649225128586 -6.6213771417843];

L = [16.1595   -2.3767;
  254.9779   -5.4833;
   15.7136   21.0282;
  180.7737  378.2196];

set_param('lab6d_dynamics', 'SimulationCommand', 'start');
