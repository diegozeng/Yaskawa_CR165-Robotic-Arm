% ELEC404 Introduction to Robotics 
% Simulation Project
% By: Zeng TAO
% Part 5
% This file calculates the Jacobian Matrix and its inverse matrix
%%

clc, clear all
t2=sym('t2','real');
t3=sym('t3','real');
t5=sym('t5','real');
t4=sym('t4','real');
t6=sym('t6','real');
t7=sym('t7','real');

%fixed the last three joints
t5=0;
t6=0;
t7=0;

%V=x(4:6);
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

% Calculates the Jacobian Matrix
J=[diff(Pos,t2),diff(Pos,t3),diff(Pos,t4)]

% Calculates the Inverse of the Jacobian Matrix
InvJ=inv(J)
