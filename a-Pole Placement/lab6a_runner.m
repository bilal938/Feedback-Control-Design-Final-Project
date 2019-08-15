syms V xdot xddot t tddot Lp M m g;

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


% 
% simplify((Kt*Kg/r^2/Rm)/((M+m)*Jm*Kg^2/r^2 - 3*m/4))

eq1 = Kt*Kg*V/(r*Rm) - Kt*Km*Kg^2*xdot/(r^2*Rm) - Jm*(Kg/r)^2*xddot == (M+m)*xddot + m*Lp*tddot;
eq2 = 4/3*m*Lp^2*tddot + m*Lp*xddot - m*g*Lp*t == 0;

a_12 = 4*Kg^2*Kt*Km/(Rm*(-4*Jm*Kg^2-4*M*r^2-m*r^2));

a_23 = 3*Rm*g*m*r^2/(Rm*(-4*Jm*Kg^2-4*M*r^2-m*r^2));

a_42 = 3*Kg^2*Kt*Km/(Lp*Rm*(4*Jm*Kg^2+4*M*r^2+m*r^2));

a_43 = Rm*g*(Jm*Kg^2+M*r^2+m*r^2)/(Lp*Rm*(4*Jm*Kg^2+4*M*r^2+m*r^2));

b_2 = -4*Kg*Kt/(Rm*(-4*Jm*Kg^2-4*M*r^2-m*r^2));

b_4 = -3*r/(Lp*Rm*(4*Jm*Kg^2+4*M*r^2+m*r^2));

A = [0, 1, 0, 0;
     0, a_12, a_23, 0;
     0, 0, 0, 1;
     0, a_42, a_43, 0];
 
B = [0; b_2; 0; b_4];

C = [1, 0, 1, 0];

D = [0];

K = [-13.0283303673756,-14.7848226904404,-48.1649225128586,-6.6213771417843];
K1 = [-20, -20, -50,-10];
K2 = [-30, -30, -60, -20];


r = [0; 0; 0; 0];

set_param('lab6a_dynamics', 'SimulationCommand', 'start');
