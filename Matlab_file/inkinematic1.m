% ELEC404 Introduction to Robotics 
% Simulation Project
% By: Zeng Tao
% Part 5
% Function for the inverse kinematics of circle
%%
%l2=0.53+0.17=0.7
%h2/2=0.6
%-h4=-0.6
%-h4/2=-0.3
%l3=2.07-0.39-0.51=1.17
%h5=1.25
%r6=0.145

function F=inkinematic1(x)
global Sol;
t2=x(1);t3=x(2);t4=x(3);

% fix theta6 and theta7
t6=0;t7=0;t5=0;
T01=[1, 0, 0, 0;
     0, 1, 0  0;
     0, 0, 1, 0;
     0, 0, 0, 1];

T12=[cos(t2), -sin(t2), 0, 0;
     sin(t2),  cos(t2), 0  0;
        0   ,     0   , 1, 0.9;
        0   ,     0   , 0, 1];
 
T23=[1,0,0,0;
       0,0,-1,0;
       0,1,0,0;
       0,0,0,1]*[0,-1,0,0;
                 1,0,0,0;
                 0,0,1,0;
                 0,0,0,1]*[cos(t3),-sin(t3),0,  0;
                           sin(t3),cos(t3), 0,  0;
                          0,        0,      1,  0.6;
                          0,        0,      0,  1];
  
T34=[cos(t4),-sin(t4),0,  1.17;
       sin(t4),cos(t4), 0, 0;
       0,        0,      1, -0.6;
      0,        0,      0,  1];

T45=[1,0,0,0;
       0,0,1,0;
       0,-1,0,0;
       0,0,0,1]*[cos(t5),-sin(t5),0, 0;
                 sin(t5),cos(t5), 0, -0.3;
                0,        0,      1, 0;
                0,        0,      0,  1];
 
T56=[cos(t6), -sin(t6), 0, 0;
     sin(t6),  cos(t6), 0  0;
        0   ,     0   , 1, 1.25;
        0   ,     0   , 0, 1];

T67=[0,0,-1,0;
       0,1,0,0;
       1,0,0,0;
       0,0,0,1]*[cos(t7), -sin(t7), 0, 0;
                 sin(t7),  cos(t7), 0  0;
                    0   ,     0   , 1, 0.145;
                    0   ,     0   , 0, 1];
 T78=[1,0,0,0;
     0,1,0,0;
     0,0,1,0.1;
     0,0,0,1];
           
T08=T01*T12*T23*T34*T45*T56*T67*T78;
Pos=T08(1:3,4);
F=Pos-Sol;


