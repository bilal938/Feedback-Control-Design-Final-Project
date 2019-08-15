A = [ 0, 1, 0, 0;
      0, -6.81228, -1.49727, 0;
      0, 0, 0, 1;
      0, 15.4731, 25.6828, 0];
  
B = [0;
      1.52258;
      0;
      -3.45831];

C = [1 0 0 0; 
     0 0 1 0];
 
D = [0;0];

sys = ss(A, B, C, D);

% change values in Q and R matrix to their non-nominal values repsectively

Q = [50/(.3^2), 0, 0, 0;
     0, 0, 0, 0;
     0, 0, 10/(.05^2), 0;
     0, 0, 0, 0];
 
L = [16.1595   -2.3767;
  254.9779   -5.4833;
   15.7136   21.0282;
  180.7737  378.2196];
 
R = [10/(6^2)];

K = lqr(sys, Q, R)

poles = eig(A-B*K)
set_param('lab_6c_model_copy', 'SimulationCommand', 'start');


%subplot(1, 3, 1); plot(t, x); title('Sine wave reference with .05 amplitude resposne with q1 = 50, q3 = 10, and r = 10'); xlabel('time(s)'); ylabel('amplitude (m)'); subplot(1, 3, 2); plot(t, theta); title('Sine wave reference angle response with .05 amplitude with q1 = 50, q3 = 10, and r = 10'); 
