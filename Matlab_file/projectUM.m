% ELEC404 Introduction to Robotics 
% Simulation Project
% By: Jiang Dongyang;
% Part 4
% Draw the UM

%%

clc, clear all

% declares Sol as global to be seen inside functions
% in particular inside RobotProjectKinFunc
global Sol;

% clear figures and set the size of the 3D graphical space
clf;
axis([-3,3,-3,3,0,3]);
xlabel('x-axis(m)')
ylabel('y-axis(m)')
zlabel('z-axis(m)')
title('MOTOMAN-CR130/165 UM')

%opens an .avi file named umrobot
vidObj = VideoWriter('um.avi');
open(vidObj);
set(gca,'nextplot','replacechildren');
set(gcf,'Renderer','zbuffer');

%Builds the Robot
%Part 1
r1=0.54;h1=0.53;
vert_link1=...
[  r1*cos(  0/180*pi), r1*sin(  0/180*pi),   0;
   r1*cos( 30/180*pi), r1*sin( 30/180*pi),   0;
   r1*cos( 60/180*pi), r1*sin( 60/180*pi),   0;
   r1*cos( 90/180*pi), r1*sin( 90/180*pi),   0;
   r1*cos(120/180*pi), r1*sin(120/180*pi),   0;
   r1*cos(150/180*pi), r1*sin(150/180*pi),   0;
   r1*cos(180/180*pi), r1*sin(180/180*pi),   0;
   r1*cos(210/180*pi), r1*sin(210/180*pi),   0;
   r1*cos(240/180*pi), r1*sin(240/180*pi),   0;
   r1*cos(270/180*pi), r1*sin(270/180*pi),   0;
   r1*cos(300/180*pi), r1*sin(300/180*pi),   0;
   r1*cos(330/180*pi), r1*sin(330/180*pi),   0;
   r1*cos(  0/180*pi), r1*sin(  0/180*pi),  h1;
   r1*cos( 30/180*pi), r1*sin( 30/180*pi),  h1;
   r1*cos( 60/180*pi), r1*sin( 60/180*pi),  h1;
   r1*cos( 90/180*pi), r1*sin( 90/180*pi),  h1;
   r1*cos(120/180*pi), r1*sin(120/180*pi),  h1;
   r1*cos(150/180*pi), r1*sin(150/180*pi),  h1;
   r1*cos(180/180*pi), r1*sin(180/180*pi),  h1;
   r1*cos(210/180*pi), r1*sin(210/180*pi),  h1;
   r1*cos(240/180*pi), r1*sin(240/180*pi),  h1;
   r1*cos(270/180*pi), r1*sin(270/180*pi),  h1;
   r1*cos(300/180*pi), r1*sin(300/180*pi),  h1;
   r1*cos(330/180*pi), r1*sin(330/180*pi),  h1];

face_links1=...
[1, 2, 3, 4, 5, 6, 7, 8, 9,10,11,12;    
13,14,15,16,17,18,19,20,21,22,23,24;    
 1, 2,14,13,13,13,13,13,13,13,13,13;    
 2, 3,15,14,14,14,14,14,14,14,14,14;    
 3, 4,16,15,15,15,15,15,15,15,15,15;    
 4, 5,17,16,16,16,16,16,16,16,16,16;    
 5, 6,18,17,17,17,17,17,17,17,17,17;    
 6, 7,19,18,18,18,18,18,18,18,18,18;    
 7, 8,20,19,19,19,19,19,19,19,19,19;    
 8, 9,21,20,20,20,20,20,20,20,20,20;    
 9,10,22,21,21,21,21,21,21,21,21,21;    
10,11,23,22,22,22,22,22,22,22,22,22;    
11,12,24,23,23,23,23,23,23,23,23,23;    
12, 1,13,24,24,24,24,24,24,24,24,24];

vert_link_1=vert_link1;

%Part 2
r2=0.17;h2=1.2;l2=0.53+0.17;
vert_link2=...
[  r2*cos(  0/180*pi), -h2/2,r2*sin(  0/180*pi);
   r2*cos( 30/180*pi), -h2/2,r2*sin( 30/180*pi);
   r2*cos( 60/180*pi), -h2/2,r2*sin( 60/180*pi);
   r2*cos( 90/180*pi), -h2/2,r2*sin( 90/180*pi);
   r2*cos(120/180*pi), -h2/2,r2*sin(120/180*pi);
   r2*cos(150/180*pi), -h2/2,r2*sin(150/180*pi);
   r2*cos(180/180*pi), -h2/2,r2*sin(180/180*pi);
   r2*cos(210/180*pi), -h2/2,r2*sin(210/180*pi);
   r2*cos(240/180*pi), -h2/2,r2*sin(240/180*pi);
   r2*cos(270/180*pi), -h2/2,r2*sin(270/180*pi);
   r2*cos(300/180*pi), -h2/2,r2*sin(300/180*pi);
   r2*cos(330/180*pi), -h2/2,r2*sin(330/180*pi);
   r2*cos(  0/180*pi), h2/2,r2*sin(  0/180*pi);
   r2*cos( 30/180*pi), h2/2,r2*sin( 30/180*pi);
   r2*cos( 60/180*pi), h2/2,r2*sin( 60/180*pi);
   r2*cos( 90/180*pi), h2/2,r2*sin( 90/180*pi);
   r2*cos(120/180*pi), h2/2,r2*sin(120/180*pi);
   r2*cos(150/180*pi), h2/2,r2*sin(150/180*pi);
   r2*cos(180/180*pi), h2/2,r2*sin(180/180*pi);
   r2*cos(210/180*pi), h2/2,r2*sin(210/180*pi);
   r2*cos(240/180*pi), h2/2,r2*sin(240/180*pi);
   r2*cos(270/180*pi), h2/2,r2*sin(270/180*pi);
   r2*cos(300/180*pi), h2/2,r2*sin(300/180*pi);
   r2*cos(330/180*pi), h2/2,r2*sin(330/180*pi)];

face_links2=...
[1, 2, 3, 4, 5, 6, 7, 8, 9,10,11,12;    
13,14,15,16,17,18,19,20,21,22,23,24;    
 1, 2,14,13,13,13,13,13,13,13,13,13;    
 2, 3,15,14,14,14,14,14,14,14,14,14;    
 3, 4,16,15,15,15,15,15,15,15,15,15;    
 4, 5,17,16,16,16,16,16,16,16,16,16;    
 5, 6,18,17,17,17,17,17,17,17,17,17;    
 6, 7,19,18,18,18,18,18,18,18,18,18;    
 7, 8,20,19,19,19,19,19,19,19,19,19;    
 8, 9,21,20,20,20,20,20,20,20,20,20;    
 9,10,22,21,21,21,21,21,21,21,21,21;    
10,11,23,22,22,22,22,22,22,22,22,22;    
11,12,24,23,23,23,23,23,23,23,23,23;    
12, 1,13,24,24,24,24,24,24,24,24,24];

%Part 3
r3=0.15;h3=0.1;l3=2.07-0.39-0.51;
vert_link3=...
[  l3+r3*cos(  0/180*pi), r3*sin(  0/180*pi),   0;
   l3+r3*cos( 30/180*pi), r3*sin( 30/180*pi),   0;
   l3+r3*cos( 60/180*pi), r3*sin( 60/180*pi),   0;
   l3+r3*cos( 90/180*pi), r3*sin( 90/180*pi),   0;
   r3*cos( 90/180*pi),    r3*sin( 90/180*pi),   0;
   r3*cos(120/180*pi),    r3*sin(120/180*pi),   0;
   r3*cos(150/180*pi),    r3*sin(150/180*pi),   0;
   r3*cos(180/180*pi),    r3*sin(180/180*pi),   0;
   r3*cos(210/180*pi),    r3*sin(210/180*pi),   0;
   r3*cos(240/180*pi),    r3*sin(240/180*pi),   0;
   r3*cos(270/180*pi),    r3*sin(270/180*pi),   0;
   l3+r3*cos(270/180*pi), r3*sin(270/180*pi),   0;
   l3+r3*cos(300/180*pi), r3*sin(300/180*pi),   0;
   l3+r3*cos(330/180*pi), r3*sin(330/180*pi),   0;
   l3+r3*cos(  0/180*pi), r3*sin(  0/180*pi),  h3;
   l3+r3*cos( 30/180*pi), r3*sin( 30/180*pi),  h3;
   l3+r3*cos( 60/180*pi), r3*sin( 60/180*pi),  h3;
   l3+r3*cos( 90/180*pi), r3*sin( 90/180*pi),  h3;
   r3*cos( 90/180*pi),    r3*sin( 90/180*pi),  h3;
   r3*cos(120/180*pi),    r3*sin(120/180*pi),  h3;
   r3*cos(150/180*pi),    r3*sin(150/180*pi),  h3;
   r3*cos(180/180*pi),    r3*sin(180/180*pi),  h3;
   r3*cos(210/180*pi),    r3*sin(210/180*pi),  h3;
   r3*cos(240/180*pi),    r3*sin(240/180*pi),  h3;
   r3*cos(270/180*pi),    r3*sin(270/180*pi),  h3;
   l3+r3*cos(270/180*pi), r3*sin(270/180*pi),  h3;
   l3+r3*cos(300/180*pi), r3*sin(300/180*pi),  h3;
   l3+r3*cos(330/180*pi), r3*sin(330/180*pi),  h3];

face_links3=...
[1, 2, 3, 4, 5, 6, 7, 8, 9,10,11,12,13,14;    
15,16,17,18,19,20,21,22,23,24,25,26,27,28;
 1, 2,16,15,15,15,15,15,15,15,15,15,15,15;    
 2, 3,17,16,16,16,16,16,16,16,16,16,16,16;    
 3, 4,18,17,17,17,17,17,17,17,17,17,17,17;    
 4, 5,19,18,18,18,18,18,18,18,18,18,18,18;    
 5, 6,20,19,19,19,19,19,19,19,19,19,19,19;    
 6, 7,21,20,20,20,20,20,20,20,20,20,20,20;    
 7, 8,22,21,21,21,21,21,21,21,21,21,21,21;    
 8, 9,23,22,22,22,22,22,22,22,22,22,22,22;    
 9,10,24,23,23,23,23,23,23,23,23,23,23,23;    
10,11,25,24,24,24,24,24,24,24,24,24,24,24;    
11,12,26,25,25,25,25,25,25,25,25,25,25,25;    
12,13,27,26,26,26,26,26,26,26,26,26,26,26;    
13,14,28,27,27,27,27,27,27,27,27,27,27,27;    
14, 1,15,28,28,28,28,28,28,28,28,28,28,28];

%Part 4
r4=0.189;h4=0.6;l4=0.6;
vert_link4=...
[  r4*cos(  0/180*pi), r4*sin(  0/180*pi),0;
   r4*cos( 30/180*pi), r4*sin( 30/180*pi),0;
   r4*cos( 60/180*pi), r4*sin( 60/180*pi),0;
   r4*cos( 90/180*pi), r4*sin( 90/180*pi),0;
   r4*cos(120/180*pi), r4*sin(120/180*pi),0;
   r4*cos(150/180*pi), r4*sin(150/180*pi),0;
   r4*cos(180/180*pi), r4*sin(180/180*pi),0;
   r4*cos(210/180*pi), r4*sin(210/180*pi),0;
   r4*cos(240/180*pi), r4*sin(240/180*pi),0;
   r4*cos(270/180*pi), r4*sin(270/180*pi),0;
   r4*cos(300/180*pi), r4*sin(300/180*pi),0;
   r4*cos(330/180*pi), r4*sin(330/180*pi),0;
   r4*cos(  0/180*pi), r4*sin(  0/180*pi),h4;
   r4*cos( 30/180*pi), r4*sin( 30/180*pi),h4;
   r4*cos( 60/180*pi), r4*sin( 60/180*pi),h4;
   r4*cos( 90/180*pi), r4*sin( 90/180*pi),h4;
   r4*cos(120/180*pi), r4*sin(120/180*pi),h4;
   r4*cos(150/180*pi), r4*sin(150/180*pi),h4;
   r4*cos(180/180*pi), r4*sin(180/180*pi),h4;
   r4*cos(210/180*pi), r4*sin(210/180*pi),h4;
   r4*cos(240/180*pi), r4*sin(240/180*pi),h4;
   r4*cos(270/180*pi), r4*sin(270/180*pi),h4;
   r4*cos(300/180*pi), r4*sin(300/180*pi),h4;
   r4*cos(330/180*pi), r4*sin(330/180*pi),h4;];

face_links4=...
[1, 2, 3, 4, 5, 6, 7, 8, 9,10,11,12;    
13,14,15,16,17,18,19,20,21,22,23,24;    
 1, 2,14,13,13,13,13,13,13,13,13,13;    
 2, 3,15,14,14,14,14,14,14,14,14,14;    
 3, 4,16,15,15,15,15,15,15,15,15,15;    
 4, 5,17,16,16,16,16,16,16,16,16,16;    
 5, 6,18,17,17,17,17,17,17,17,17,17;    
 6, 7,19,18,18,18,18,18,18,18,18,18;    
 7, 8,20,19,19,19,19,19,19,19,19,19;    
 8, 9,21,20,20,20,20,20,20,20,20,20;    
 9,10,22,21,21,21,21,21,21,21,21,21;    
10,11,23,22,22,22,22,22,22,22,22,22;    
11,12,24,23,23,23,23,23,23,23,23,23;    
12, 1,13,24,24,24,24,24,24,24,24,24];

%Part 5
r5=0.085; h5=1.25;
vert_link5=...
[  r5*cos(  0/180*pi),r5*sin(  0/180*pi),0;
   r5*cos( 30/180*pi),r5*sin( 30/180*pi),0;
   r5*cos( 60/180*pi),r5*sin( 60/180*pi),0;
   r5*cos( 90/180*pi),r5*sin( 90/180*pi),0;
   r5*cos(120/180*pi),r5*sin(120/180*pi),0;
   r5*cos(150/180*pi),r5*sin(150/180*pi),0;
   r5*cos(180/180*pi),r5*sin(180/180*pi),0;
   r5*cos(210/180*pi),r5*sin(210/180*pi),0;
   r5*cos(240/180*pi),r5*sin(240/180*pi),0;
   r5*cos(270/180*pi),r5*sin(270/180*pi),0;
   r5*cos(300/180*pi),r5*sin(300/180*pi),0;
   r5*cos(330/180*pi),r5*sin(330/180*pi),0;
   r5*cos(  0/180*pi),r5*sin(  0/180*pi),h5;
   r5*cos( 30/180*pi),r5*sin( 30/180*pi),h5;
   r5*cos( 60/180*pi),r5*sin( 60/180*pi),h5;
   r5*cos( 90/180*pi),r5*sin( 90/180*pi),h5;
   r5*cos(120/180*pi),r5*sin(120/180*pi),h5;
   r5*cos(150/180*pi),r5*sin(150/180*pi),h5;
   r5*cos(180/180*pi),r5*sin(180/180*pi),h5;
   r5*cos(210/180*pi),r5*sin(210/180*pi),h5;
   r5*cos(240/180*pi),r5*sin(240/180*pi),h5;
   r5*cos(270/180*pi),r5*sin(270/180*pi),h5;
   r5*cos(300/180*pi),r5*sin(300/180*pi),h5;
   r5*cos(330/180*pi),r5*sin(330/180*pi),h5;];

face_links5=...
[1, 2, 3, 4, 5, 6, 7, 8, 9,10,11,12;    
13,14,15,16,17,18,19,20,21,22,23,24;    
 1, 2,14,13,13,13,13,13,13,13,13,13;    
 2, 3,15,14,14,14,14,14,14,14,14,14;    
 3, 4,16,15,15,15,15,15,15,15,15,15;    
 4, 5,17,16,16,16,16,16,16,16,16,16;    
 5, 6,18,17,17,17,17,17,17,17,17,17;    
 6, 7,19,18,18,18,18,18,18,18,18,18;    
 7, 8,20,19,19,19,19,19,19,19,19,19;    
 8, 9,21,20,20,20,20,20,20,20,20,20;    
 9,10,22,21,21,21,21,21,21,21,21,21;    
10,11,23,22,22,22,22,22,22,22,22,22;    
11,12,24,23,23,23,23,23,23,23,23,23;    
12, 1,13,24,24,24,24,24,24,24,24,24];

%Part 6
r6=0.145; h6=0.6;
vert_link6=...
[  r6*cos(  0/180*pi), -h6/2,r6*sin(  0/180*pi);
   r6*cos( 30/180*pi), -h6/2,r6*sin( 30/180*pi);
   r6*cos( 60/180*pi), -h6/2,r6*sin( 60/180*pi);
   r6*cos( 90/180*pi), -h6/2,r6*sin( 90/180*pi);
   r6*cos(120/180*pi), -h6/2,r6*sin(120/180*pi);
   r6*cos(150/180*pi), -h6/2,r6*sin(150/180*pi);
   r6*cos(180/180*pi), -h6/2,r6*sin(180/180*pi);
   r6*cos(210/180*pi), -h6/2,r6*sin(210/180*pi);
   r6*cos(240/180*pi), -h6/2,r6*sin(240/180*pi);
   r6*cos(270/180*pi), -h6/2,r6*sin(270/180*pi);
   r6*cos(300/180*pi), -h6/2,r6*sin(300/180*pi);
   r6*cos(330/180*pi), -h6/2,r6*sin(330/180*pi);
   r6*cos(  0/180*pi), h6/2,r6*sin(  0/180*pi);
   r6*cos( 30/180*pi), h6/2,r6*sin( 30/180*pi);
   r6*cos( 60/180*pi), h6/2,r6*sin( 60/180*pi);
   r6*cos( 90/180*pi), h6/2,r6*sin( 90/180*pi);
   r6*cos(120/180*pi), h6/2,r6*sin(120/180*pi);
   r6*cos(150/180*pi), h6/2,r6*sin(150/180*pi);
   r6*cos(180/180*pi), h6/2,r6*sin(180/180*pi);
   r6*cos(210/180*pi), h6/2,r6*sin(210/180*pi);
   r6*cos(240/180*pi), h6/2,r6*sin(240/180*pi);
   r6*cos(270/180*pi), h6/2,r6*sin(270/180*pi);
   r6*cos(300/180*pi), h6/2,r6*sin(300/180*pi);
   r6*cos(330/180*pi), h6/2,r6*sin(330/180*pi);];


face_links6=...
[1, 2, 3, 4, 5, 6, 7, 8, 9,10,11,12;    
13,14,15,16,17,18,19,20,21,22,23,24;    
 1, 2,14,13,13,13,13,13,13,13,13,13;    
 2, 3,15,14,14,14,14,14,14,14,14,14;    
 3, 4,16,15,15,15,15,15,15,15,15,15;    
 4, 5,17,16,16,16,16,16,16,16,16,16;    
 5, 6,18,17,17,17,17,17,17,17,17,17;    
 6, 7,19,18,18,18,18,18,18,18,18,18;    
 7, 8,20,19,19,19,19,19,19,19,19,19;    
 8, 9,21,20,20,20,20,20,20,20,20,20;    
 9,10,22,21,21,21,21,21,21,21,21,21;    
10,11,23,22,22,22,22,22,22,22,22,22;    
11,12,24,23,23,23,23,23,23,23,23,23;    
12, 1,13,24,24,24,24,24,24,24,24,24];

r7=0.092;h7=0.23;
vert_link7=...
[  r7*cos(  0/180*pi), r7*sin(  0/180*pi),   0;
   r7*cos( 30/180*pi), r7*sin( 30/180*pi),   0;
   r7*cos( 60/180*pi), r7*sin( 60/180*pi),   0;
   r7*cos( 90/180*pi), r7*sin( 90/180*pi),   0;
   r7*cos(120/180*pi), r7*sin(120/180*pi),   0;
   r7*cos(150/180*pi), r7*sin(150/180*pi),   0;
   r7*cos(180/180*pi), r7*sin(180/180*pi),   0;
   r7*cos(210/180*pi), r7*sin(210/180*pi),   0;
   r7*cos(240/180*pi), r7*sin(240/180*pi),   0;
   r7*cos(270/180*pi), r7*sin(270/180*pi),   0;
   r7*cos(300/180*pi), r7*sin(300/180*pi),   0;
   r7*cos(330/180*pi), r7*sin(330/180*pi),   0;
   r7*cos(  0/180*pi), r7*sin(  0/180*pi),  h7;
   r7*cos( 30/180*pi), r7*sin( 30/180*pi),  h7;
   r7*cos( 60/180*pi), r7*sin( 60/180*pi),  h7;
   r7*cos( 90/180*pi), r7*sin( 90/180*pi),  h7;
   r7*cos(120/180*pi), r7*sin(120/180*pi),  h7;
   r7*cos(150/180*pi), r7*sin(150/180*pi),  h7;
   r7*cos(180/180*pi), r7*sin(180/180*pi),  h7;
   r7*cos(210/180*pi), r7*sin(210/180*pi),  h7;
   r7*cos(240/180*pi), r7*sin(240/180*pi),  h7;
   r7*cos(270/180*pi), r7*sin(270/180*pi),  h7;
   r7*cos(300/180*pi), r7*sin(300/180*pi),  h7;
   r7*cos(330/180*pi), r7*sin(330/180*pi),  h7];

face_links7=...
[1, 2, 3, 4, 5, 6, 7, 8, 9,10,11,12;    
13,14,15,16,17,18,19,20,21,22,23,24;    
 1, 2,14,13,13,13,13,13,13,13,13,13;    
 2, 3,15,14,14,14,14,14,14,14,14,14;    
 3, 4,16,15,15,15,15,15,15,15,15,15;    
 4, 5,17,16,16,16,16,16,16,16,16,16;    
 5, 6,18,17,17,17,17,17,17,17,17,17;    
 6, 7,19,18,18,18,18,18,18,18,18,18;    
 7, 8,20,19,19,19,19,19,19,19,19,19;    
 8, 9,21,20,20,20,20,20,20,20,20,20;    
 9,10,22,21,21,21,21,21,21,21,21,21;    
10,11,23,22,22,22,22,22,22,22,22,22;    
11,12,24,23,23,23,23,23,23,23,23,23;    
12, 1,13,24,24,24,24,24,24,24,24,24];

%The mark point left by the tip of Part 7
r8=0.01;h8=0.01;
vert_link8=...
[  r8*cos(  0/180*pi), r8*sin(  0/180*pi),   0;
   r8*cos( 30/180*pi), r8*sin( 30/180*pi),   0;
   r8*cos( 60/180*pi), r8*sin( 60/180*pi),   0;
   r8*cos( 90/180*pi), r8*sin( 90/180*pi),   0;
   r8*cos(120/180*pi), r8*sin(120/180*pi),   0;
   r8*cos(150/180*pi), r8*sin(150/180*pi),   0;
   r8*cos(180/180*pi), r8*sin(180/180*pi),   0;
   r8*cos(210/180*pi), r8*sin(210/180*pi),   0;
   r8*cos(240/180*pi), r8*sin(240/180*pi),   0;
   r8*cos(270/180*pi), r8*sin(270/180*pi),   0;
   r8*cos(300/180*pi), r8*sin(300/180*pi),   0;
   r8*cos(330/180*pi), r8*sin(330/180*pi),   0];

face_links8=...
[1, 2, 3, 4, 5, 6, 7, 8, 9,10,11,12];

O1=patch('Vertices',vert_link1,'Faces',face_links1,'faceColor',[122/255 120/255 100/255]);
O2=patch('Vertices',vert_link2,'Faces',face_links2,'faceColor',[122/255  12/255 100/255]);
O3=patch('Vertices',vert_link3,'Faces',face_links3,'faceColor',[ 12/255 120/255 100/255]);
O4=patch('Vertices',vert_link4,'Faces',face_links4,'faceColor',[122/255 120/255 100/255]);
O5=patch('Vertices',vert_link5,'Faces',face_links5,'faceColor',[99/255 99/255 99/255]);
O6=patch('Vertices',vert_link6,'Faces',face_links6,'faceColor',[      0       0 100/255]);
O7=patch('Vertices',vert_link7,'Faces',face_links7,'faceColor',[127/255 127/255 127/255]);
O8=patch('Vertices',vert_link8,'Faces',face_links8,'faceColor',[122/255 120/255 100/255]);

delete (O8);


% initializes
t1=0;
t2=-1.2941;
t3=1.4526;
t4=-1.0105;
t5=0.2458;
t6=0.2458;
t7=0;
X=-1;
Z=0.6;
Y=2;


%%
%first line of U

for Y=2:-0.02:1.6,...        
% set the desired point in (X,Y,Z) and the initial condition for the
% inverse kinematics algorithm X0
Sol=[X,Y,Z]';
X0=[0;t2;t3;t4;t5;t6;t7];

% Computes the inverse kinematics
s = fsolve(@inkinematic,X0,optimset('Display','off'));

% sets the new values for theta1 theta3, d3, theta6 and theta7
t1=s(1);
t2=s(2);
t3=s(3);
t4=s(4);
t5=s(5);
t6=s(6);
t7=s(7);

% moves the links to the new positions
aux_vert2=[vert_link2, ones(max(size(vert_link2)),1)];
T2=[cos(t2), -sin(t2), 0, 0;
     sin(t2),  cos(t2), 0  0;
        0   ,     0   , 1, l2;
        0   ,     0   , 0, 1];
aux_vert2 =(T2*aux_vert2')';
vert_link_2=aux_vert2(:,1:3);

aux_vert3=[vert_link3, ones(max(size(vert_link3)),1)];
T3=T2*[1,0,0,0;
       0,0,-1,0;
       0,1,0,0;
       0,0,0,1]*[0,-1,0,0;
                 1,0,0,0;
                 0,0,1,0;
                 0,0,0,1]*[cos(t3),-sin(t3),0,  0;
                           sin(t3),cos(t3), 0,  0;
                          0,        0,      1,  h2/2;
                          0,        0,      0,  1];
aux_vert3=(T3*aux_vert3')';
vert_link_3=aux_vert3(:,1:3);

aux_vert4=[vert_link4, ones(max(size(vert_link4)),1)];
T4=T3*[cos(t4),-sin(t4),0,  l3;
       sin(t4),cos(t4), 0, 0;
       0,        0,      1, -h4;
      0,        0,      0,  1];
aux_vert4=(T4*aux_vert4')';
vert_link_4=aux_vert4(:,1:3);

aux_vert5=[vert_link5, ones(max(size(vert_link5)),1)];
T5=T4*[1,0,0,0;
       0,0,1,0;
       0,-1,0,0;
       0,0,0,1]*[cos(t5),-sin(t5),0, 0;
                 sin(t5),cos(t5), 0, -h4/2;
                0,        0,      1, 0;
                0,        0,      0,  1];
aux_vert5=(T5*aux_vert5')';
vert_link_5=aux_vert5(:,1:3);

aux_vert6=[vert_link6, ones(max(size(vert_link6)),1)];
T6=T5*[cos(t6), -sin(t6), 0, 0;
     sin(t6),  cos(t6), 0  0;
        0   ,     0   , 1, h5;
        0   ,     0   , 0, 1];
aux_vert6 =(T6*aux_vert6')';
vert_link_6=aux_vert6(:,1:3);

aux_vert7=[vert_link7, ones(max(size(vert_link7)),1)];
T7=T6*[0,0,-1,0;
       0,1,0,0;
       1,0,0,0;
       0,0,0,1]*[cos(t7), -sin(t7), 0, 0;
                 sin(t7),  cos(t7), 0  0;
                    0   ,     0   , 1, r6;
                    0   ,     0   , 0, 1];
aux_vert7 =(T7*aux_vert7')';
vert_link_7=aux_vert7(:,1:3);

aux_vert8=[vert_link8, ones(max(size(vert_link8)),1)];
T8=T7*[1,0,0,0;
     0,1,0,0;
     0,0,1,h7;
     0,0,0,1];
aux_vert8=(T8*aux_vert8')';
vert_link_8=aux_vert8(:,1:3);

% deletes the previous position of the Robot in the picture
% except for the tool
delete(O1);delete(O2);delete(O3);delete(O4);delete(O5);delete(O6);delete(O7);

O1=patch('Vertices',vert_link_1,'Faces',face_links1,'faceColor',[122/255 120/255 100/255]);
O2=patch('Vertices',vert_link_2,'Faces',face_links2,'faceColor',[122/255  12/255 100/255]);
O3=patch('Vertices',vert_link_3,'Faces',face_links3,'faceColor',[ 12/255 120/255 100/255]);
O4=patch('Vertices',vert_link_4,'Faces',face_links4,'faceColor',[122/255 120/255 100/255]);
O5=patch('Vertices',vert_link_5,'Faces',face_links5,'faceColor',[99/255 99/255 99/255]);
O6=patch('Vertices',vert_link_6,'Faces',face_links6,'faceColor',[      0       0 100/255]);
O7=patch('Vertices',vert_link_7,'Faces',face_links7,'faceColor',[127/255 127/255 127/255]);
O8=patch('Vertices',vert_link_8,'Faces',face_links8,'faceColor',[122/255 120/255 100/255]);

% pauses the computations for 0.02 second
pause (0.02)
 currFrame = getframe;
 writeVideo(vidObj,currFrame);

end

%%
%For the curve part of U
for B=1:-0.02:0,...  
    X=-0.9+0.1*cos(B*pi);
    Y=1.6-0.1*sin(B*pi);      
% set the desired point in (X,Y,Z) and the initial condition for the
% inverse kinematics algorithm X0
Sol=[X,Y,Z]';
X0=[0;t2;t3;t4;t5;t6;t7];

% Computes the inverse kinematics
s = fsolve(@inkinematic,X0,optimset('Display','off'));

% sets the new values for theta1 theta3, d3, theta6 and theta7
t1=s(1);
t2=s(2);
t3=s(3);
t4=s(4);
t5=s(5);
t6=s(6);
t7=s(7);

% moves the links to the new positions
aux_vert2=[vert_link2, ones(max(size(vert_link2)),1)];
T2=[cos(t2), -sin(t2), 0, 0;
     sin(t2),  cos(t2), 0  0;
        0   ,     0   , 1, l2;
        0   ,     0   , 0, 1];
aux_vert2 =(T2*aux_vert2')';
vert_link_2=aux_vert2(:,1:3);

aux_vert3=[vert_link3, ones(max(size(vert_link3)),1)];
T3=T2*[1,0,0,0;
       0,0,-1,0;
       0,1,0,0;
       0,0,0,1]*[0,-1,0,0;
                 1,0,0,0;
                 0,0,1,0;
                 0,0,0,1]*[cos(t3),-sin(t3),0,  0;
                           sin(t3),cos(t3), 0,  0;
                          0,        0,      1,  h2/2;
                          0,        0,      0,  1];
aux_vert3=(T3*aux_vert3')';
vert_link_3=aux_vert3(:,1:3);

aux_vert4=[vert_link4, ones(max(size(vert_link4)),1)];
T4=T3*[cos(t4),-sin(t4),0,  l3;
       sin(t4),cos(t4), 0, 0;
       0,        0,      1, -h4;
      0,        0,      0,  1];
aux_vert4=(T4*aux_vert4')';
vert_link_4=aux_vert4(:,1:3);

aux_vert5=[vert_link5, ones(max(size(vert_link5)),1)];
T5=T4*[1,0,0,0;
       0,0,1,0;
       0,-1,0,0;
       0,0,0,1]*[cos(t5),-sin(t5),0, 0;
                 sin(t5),cos(t5), 0, -h4/2;
                0,        0,      1, 0;
                0,        0,      0,  1];
aux_vert5=(T5*aux_vert5')';
vert_link_5=aux_vert5(:,1:3);

aux_vert6=[vert_link6, ones(max(size(vert_link6)),1)];
T6=T5*[cos(t6), -sin(t6), 0, 0;
     sin(t6),  cos(t6), 0  0;
        0   ,     0   , 1, h5;
        0   ,     0   , 0, 1];
aux_vert6 =(T6*aux_vert6')';
vert_link_6=aux_vert6(:,1:3);

aux_vert7=[vert_link7, ones(max(size(vert_link7)),1)];
T7=T6*[0,0,-1,0;
       0,1,0,0;
       1,0,0,0;
       0,0,0,1]*[cos(t7), -sin(t7), 0, 0;
                 sin(t7),  cos(t7), 0  0;
                    0   ,     0   , 1, r6;
                    0   ,     0   , 0, 1];
aux_vert7 =(T7*aux_vert7')';
vert_link_7=aux_vert7(:,1:3);

aux_vert8=[vert_link8, ones(max(size(vert_link8)),1)];
T8=T7*[1,0,0,0;
     0,1,0,0;
     0,0,1,h7;
     0,0,0,1];
aux_vert8=(T8*aux_vert8')';
vert_link_8=aux_vert8(:,1:3);

% deletes the previous position of the Robot in the picture
% except for the tool
delete(O1);delete(O2);delete(O3);delete(O4);delete(O5);delete(O6);delete(O7);

O1=patch('Vertices',vert_link_1,'Faces',face_links1,'faceColor',[122/255 120/255 100/255]);
O2=patch('Vertices',vert_link_2,'Faces',face_links2,'faceColor',[122/255  12/255 100/255]);
O3=patch('Vertices',vert_link_3,'Faces',face_links3,'faceColor',[ 12/255 120/255 100/255]);
O4=patch('Vertices',vert_link_4,'Faces',face_links4,'faceColor',[122/255 120/255 100/255]);
O5=patch('Vertices',vert_link_5,'Faces',face_links5,'faceColor',[99/255 99/255 99/255]);
O6=patch('Vertices',vert_link_6,'Faces',face_links6,'faceColor',[      0       0 100/255]);
O7=patch('Vertices',vert_link_7,'Faces',face_links7,'faceColor',[127/255 127/255 127/255]);
O8=patch('Vertices',vert_link_8,'Faces',face_links8,'faceColor',[122/255 120/255 100/255]);

% pauses the computations for 0.02 second
pause (0.02)
 currFrame = getframe;
       writeVideo(vidObj,currFrame);

end
%%
%second line of U
for Y=1.6:0.02:2,...        
% set the desired point in (X,Y,Z) and the initial condition for the
% inverse kinematics algorithm X0
Sol=[X,Y,Z]';
X0=[0;t2;t3;t4;t5;t6;t7];

% Computes the inverse kinematics
s = fsolve(@inkinematic,X0,optimset('Display','off'));

% sets the new values for theta1 theta3, d3, theta6 and theta7
t1=s(1);
t2=s(2);
t3=s(3);
t4=s(4);
t5=s(5);
t6=s(6);
t7=s(7);

% moves the links to the new positions
aux_vert2=[vert_link2, ones(max(size(vert_link2)),1)];
T2=[cos(t2), -sin(t2), 0, 0;
     sin(t2),  cos(t2), 0  0;
        0   ,     0   , 1, l2;
        0   ,     0   , 0, 1];
aux_vert2 =(T2*aux_vert2')';
vert_link_2=aux_vert2(:,1:3);

aux_vert3=[vert_link3, ones(max(size(vert_link3)),1)];
T3=T2*[1,0,0,0;
       0,0,-1,0;
       0,1,0,0;
       0,0,0,1]*[0,-1,0,0;
                 1,0,0,0;
                 0,0,1,0;
                 0,0,0,1]*[cos(t3),-sin(t3),0,  0;
                           sin(t3),cos(t3), 0,  0;
                          0,        0,      1,  h2/2;
                          0,        0,      0,  1];
aux_vert3=(T3*aux_vert3')';
vert_link_3=aux_vert3(:,1:3);

aux_vert4=[vert_link4, ones(max(size(vert_link4)),1)];
T4=T3*[cos(t4),-sin(t4),0,  l3;
       sin(t4),cos(t4), 0, 0;
       0,        0,      1, -h4;
      0,        0,      0,  1];
aux_vert4=(T4*aux_vert4')';
vert_link_4=aux_vert4(:,1:3);

aux_vert5=[vert_link5, ones(max(size(vert_link5)),1)];
T5=T4*[1,0,0,0;
       0,0,1,0;
       0,-1,0,0;
       0,0,0,1]*[cos(t5),-sin(t5),0, 0;
                 sin(t5),cos(t5), 0, -h4/2;
                0,        0,      1, 0;
                0,        0,      0,  1];
aux_vert5=(T5*aux_vert5')';
vert_link_5=aux_vert5(:,1:3);

aux_vert6=[vert_link6, ones(max(size(vert_link6)),1)];
T6=T5*[cos(t6), -sin(t6), 0, 0;
     sin(t6),  cos(t6), 0  0;
        0   ,     0   , 1, h5;
        0   ,     0   , 0, 1];
aux_vert6 =(T6*aux_vert6')';
vert_link_6=aux_vert6(:,1:3);

aux_vert7=[vert_link7, ones(max(size(vert_link7)),1)];
T7=T6*[0,0,-1,0;
       0,1,0,0;
       1,0,0,0;
       0,0,0,1]*[cos(t7), -sin(t7), 0, 0;
                 sin(t7),  cos(t7), 0  0;
                    0   ,     0   , 1, r6;
                    0   ,     0   , 0, 1];
aux_vert7 =(T7*aux_vert7')';
vert_link_7=aux_vert7(:,1:3);

aux_vert8=[vert_link8, ones(max(size(vert_link8)),1)];
T8=T7*[1,0,0,0;
     0,1,0,0;
     0,0,1,h7;
     0,0,0,1];
aux_vert8=(T8*aux_vert8')';
vert_link_8=aux_vert8(:,1:3);

% deletes the previous position of the Robot in the picture
% except for the tool
delete(O1);delete(O2);delete(O3);delete(O4);delete(O5);delete(O6);delete(O7);

O1=patch('Vertices',vert_link_1,'Faces',face_links1,'faceColor',[122/255 120/255 100/255]);
O2=patch('Vertices',vert_link_2,'Faces',face_links2,'faceColor',[122/255  12/255 100/255]);
O3=patch('Vertices',vert_link_3,'Faces',face_links3,'faceColor',[ 12/255 120/255 100/255]);
O4=patch('Vertices',vert_link_4,'Faces',face_links4,'faceColor',[122/255 120/255 100/255]);
O5=patch('Vertices',vert_link_5,'Faces',face_links5,'faceColor',[99/255 99/255 99/255]);
O6=patch('Vertices',vert_link_6,'Faces',face_links6,'faceColor',[      0       0 100/255]);
O7=patch('Vertices',vert_link_7,'Faces',face_links7,'faceColor',[127/255 127/255 127/255]);
O8=patch('Vertices',vert_link_8,'Faces',face_links8,'faceColor',[122/255 120/255 100/255]);

% pauses the computations for 0.02 second
pause (0.02)
 currFrame = getframe;
       writeVideo(vidObj,currFrame);


end

%%
%move to M without display

for X=-0.8:0.02:-0.6,...        
% set the desired point in (X,Y,Z) and the initial condition for the
% inverse kinematics algorithm X0
Sol=[X,Y,Z]';
X0=[0;t2;t3;t4;t5;t6;t7];

% Computes the inverse kinematics
s = fsolve(@inkinematic,X0,optimset('Display','off'));

% sets the new values for theta1 theta3, d3, theta6 and theta7
t1=s(1);
t2=s(2);
t3=s(3);
t4=s(4);
t5=s(5);
t6=s(6);
t7=s(7);

% moves the links to the new positions
aux_vert2=[vert_link2, ones(max(size(vert_link2)),1)];
T2=[cos(t2), -sin(t2), 0, 0;
     sin(t2),  cos(t2), 0  0;
        0   ,     0   , 1, l2;
        0   ,     0   , 0, 1];
aux_vert2 =(T2*aux_vert2')';
vert_link_2=aux_vert2(:,1:3);

aux_vert3=[vert_link3, ones(max(size(vert_link3)),1)];
T3=T2*[1,0,0,0;
       0,0,-1,0;
       0,1,0,0;
       0,0,0,1]*[0,-1,0,0;
                 1,0,0,0;
                 0,0,1,0;
                 0,0,0,1]*[cos(t3),-sin(t3),0,  0;
                           sin(t3),cos(t3), 0,  0;
                          0,        0,      1,  h2/2;
                          0,        0,      0,  1];
aux_vert3=(T3*aux_vert3')';
vert_link_3=aux_vert3(:,1:3);

aux_vert4=[vert_link4, ones(max(size(vert_link4)),1)];
T4=T3*[cos(t4),-sin(t4),0,  l3;
       sin(t4),cos(t4), 0, 0;
       0,        0,      1, -h4;
      0,        0,      0,  1];
aux_vert4=(T4*aux_vert4')';
vert_link_4=aux_vert4(:,1:3);

aux_vert5=[vert_link5, ones(max(size(vert_link5)),1)];
T5=T4*[1,0,0,0;
       0,0,1,0;
       0,-1,0,0;
       0,0,0,1]*[cos(t5),-sin(t5),0, 0;
                 sin(t5),cos(t5), 0, -h4/2;
                0,        0,      1, 0;
                0,        0,      0,  1];
aux_vert5=(T5*aux_vert5')';
vert_link_5=aux_vert5(:,1:3);

aux_vert6=[vert_link6, ones(max(size(vert_link6)),1)];
T6=T5*[cos(t6), -sin(t6), 0, 0;
     sin(t6),  cos(t6), 0  0;
        0   ,     0   , 1, h5;
        0   ,     0   , 0, 1];
aux_vert6 =(T6*aux_vert6')';
vert_link_6=aux_vert6(:,1:3);

aux_vert7=[vert_link7, ones(max(size(vert_link7)),1)];
T7=T6*[0,0,-1,0;
       0,1,0,0;
       1,0,0,0;
       0,0,0,1]*[cos(t7), -sin(t7), 0, 0;
                 sin(t7),  cos(t7), 0  0;
                    0   ,     0   , 1, r6;
                    0   ,     0   , 0, 1];
aux_vert7 =(T7*aux_vert7')';
vert_link_7=aux_vert7(:,1:3);

aux_vert8=[vert_link8, ones(max(size(vert_link8)),1)];
T8=T7*[1,0,0,0;
     0,1,0,0;
     0,0,1,h7;
     0,0,0,1];
aux_vert8=(T8*aux_vert8')';
vert_link_8=aux_vert8(:,1:3);

% deletes the previous position of the Robot in the picture
delete(O1);delete(O2);delete(O3);delete(O4);delete(O5);delete(O6);delete(O7);delete(O8);

O1=patch('Vertices',vert_link_1,'Faces',face_links1,'faceColor',[122/255 120/255 100/255]);
O2=patch('Vertices',vert_link_2,'Faces',face_links2,'faceColor',[122/255  12/255 100/255]);
O3=patch('Vertices',vert_link_3,'Faces',face_links3,'faceColor',[ 12/255 120/255 100/255]);
O4=patch('Vertices',vert_link_4,'Faces',face_links4,'faceColor',[122/255 120/255 100/255]);
O5=patch('Vertices',vert_link_5,'Faces',face_links5,'faceColor',[99/255 99/255 99/255]);
O6=patch('Vertices',vert_link_6,'Faces',face_links6,'faceColor',[      0       0 100/255]);
O7=patch('Vertices',vert_link_7,'Faces',face_links7,'faceColor',[127/255 127/255 127/255]);
O8=patch('Vertices',vert_link_8,'Faces',face_links8,'faceColor',[122/255 120/255 100/255]);

% pauses the computations for 0.02 second
pause (0.02)
 currFrame = getframe;
       writeVideo(vidObj,currFrame);


end
for Y=2:-0.02:1.5,...        
% set the desired point in (X,Y,Z) and the initial condition for the
% inverse kinematics algorithm X0
Sol=[X,Y,Z]';
X0=[0;t2;t3;t4;t5;t6;t7];

% Computes the inverse kinematics
s = fsolve(@inkinematic,X0,optimset('Display','off'));

% sets the new values for theta1 theta3, d3, theta6 and theta7
t1=s(1);
t2=s(2);
t3=s(3);
t4=s(4);
t5=s(5);
t6=s(6);
t7=s(7);

% moves the links to the new positions
aux_vert2=[vert_link2, ones(max(size(vert_link2)),1)];
T2=[cos(t2), -sin(t2), 0, 0;
     sin(t2),  cos(t2), 0  0;
        0   ,     0   , 1, l2;
        0   ,     0   , 0, 1];
aux_vert2 =(T2*aux_vert2')';
vert_link_2=aux_vert2(:,1:3);

aux_vert3=[vert_link3, ones(max(size(vert_link3)),1)];
T3=T2*[1,0,0,0;
       0,0,-1,0;
       0,1,0,0;
       0,0,0,1]*[0,-1,0,0;
                 1,0,0,0;
                 0,0,1,0;
                 0,0,0,1]*[cos(t3),-sin(t3),0,  0;
                           sin(t3),cos(t3), 0,  0;
                          0,        0,      1,  h2/2;
                          0,        0,      0,  1];
aux_vert3=(T3*aux_vert3')';
vert_link_3=aux_vert3(:,1:3);

aux_vert4=[vert_link4, ones(max(size(vert_link4)),1)];
T4=T3*[cos(t4),-sin(t4),0,  l3;
       sin(t4),cos(t4), 0, 0;
       0,        0,      1, -h4;
      0,        0,      0,  1];
aux_vert4=(T4*aux_vert4')';
vert_link_4=aux_vert4(:,1:3);

aux_vert5=[vert_link5, ones(max(size(vert_link5)),1)];
T5=T4*[1,0,0,0;
       0,0,1,0;
       0,-1,0,0;
       0,0,0,1]*[cos(t5),-sin(t5),0, 0;
                 sin(t5),cos(t5), 0, -h4/2;
                0,        0,      1, 0;
                0,        0,      0,  1];
aux_vert5=(T5*aux_vert5')';
vert_link_5=aux_vert5(:,1:3);

aux_vert6=[vert_link6, ones(max(size(vert_link6)),1)];
T6=T5*[cos(t6), -sin(t6), 0, 0;
     sin(t6),  cos(t6), 0  0;
        0   ,     0   , 1, h5;
        0   ,     0   , 0, 1];
aux_vert6 =(T6*aux_vert6')';
vert_link_6=aux_vert6(:,1:3);

aux_vert7=[vert_link7, ones(max(size(vert_link7)),1)];
T7=T6*[0,0,-1,0;
       0,1,0,0;
       1,0,0,0;
       0,0,0,1]*[cos(t7), -sin(t7), 0, 0;
                 sin(t7),  cos(t7), 0  0;
                    0   ,     0   , 1, r6;
                    0   ,     0   , 0, 1];
aux_vert7 =(T7*aux_vert7')';
vert_link_7=aux_vert7(:,1:3);

aux_vert8=[vert_link8, ones(max(size(vert_link8)),1)];
T8=T7*[1,0,0,0;
     0,1,0,0;
     0,0,1,h7;
     0,0,0,1];
aux_vert8=(T8*aux_vert8')';
vert_link_8=aux_vert8(:,1:3);

% deletes the previous position of the Robot in the picture
delete(O1);delete(O2);delete(O3);delete(O4);delete(O5);delete(O6);delete(O7);delete(O8);

O1=patch('Vertices',vert_link_1,'Faces',face_links1,'faceColor',[122/255 120/255 100/255]);
O2=patch('Vertices',vert_link_2,'Faces',face_links2,'faceColor',[122/255  12/255 100/255]);
O3=patch('Vertices',vert_link_3,'Faces',face_links3,'faceColor',[ 12/255 120/255 100/255]);
O4=patch('Vertices',vert_link_4,'Faces',face_links4,'faceColor',[122/255 120/255 100/255]);
O5=patch('Vertices',vert_link_5,'Faces',face_links5,'faceColor',[99/255 99/255 99/255]);
O6=patch('Vertices',vert_link_6,'Faces',face_links6,'faceColor',[      0       0 100/255]);
O7=patch('Vertices',vert_link_7,'Faces',face_links7,'faceColor',[127/255 127/255 127/255]);
O8=patch('Vertices',vert_link_8,'Faces',face_links8,'faceColor',[122/255 120/255 100/255]);

% pauses the computations for 0.02 second
pause (0.02)
 currFrame = getframe;
       writeVideo(vidObj,currFrame);


end

%%
%the first line of M
for Y=1.5:0.02:2,...        
% set the desired point in (X,Y,Z) and the initial condition for the
% inverse kinematics algorithm X0
Sol=[X,Y,Z]';
X0=[0;t2;t3;t4;t5;t6;t7];

% Computes the inverse kinematics
s = fsolve(@inkinematic,X0,optimset('Display','off'));

% sets the new values for theta1 theta3, d3, theta6 and theta7
t1=s(1);
t2=s(2);
t3=s(3);
t4=s(4);
t5=s(5);
t6=s(6);
t7=s(7);

% moves the links to the new positions
aux_vert2=[vert_link2, ones(max(size(vert_link2)),1)];
T2=[cos(t2), -sin(t2), 0, 0;
     sin(t2),  cos(t2), 0  0;
        0   ,     0   , 1, l2;
        0   ,     0   , 0, 1];
aux_vert2 =(T2*aux_vert2')';
vert_link_2=aux_vert2(:,1:3);

aux_vert3=[vert_link3, ones(max(size(vert_link3)),1)];
T3=T2*[1,0,0,0;
       0,0,-1,0;
       0,1,0,0;
       0,0,0,1]*[0,-1,0,0;
                 1,0,0,0;
                 0,0,1,0;
                 0,0,0,1]*[cos(t3),-sin(t3),0,  0;
                           sin(t3),cos(t3), 0,  0;
                          0,        0,      1,  h2/2;
                          0,        0,      0,  1];
aux_vert3=(T3*aux_vert3')';
vert_link_3=aux_vert3(:,1:3);

aux_vert4=[vert_link4, ones(max(size(vert_link4)),1)];
T4=T3*[cos(t4),-sin(t4),0,  l3;
       sin(t4),cos(t4), 0, 0;
       0,        0,      1, -h4;
      0,        0,      0,  1];
aux_vert4=(T4*aux_vert4')';
vert_link_4=aux_vert4(:,1:3);

aux_vert5=[vert_link5, ones(max(size(vert_link5)),1)];
T5=T4*[1,0,0,0;
       0,0,1,0;
       0,-1,0,0;
       0,0,0,1]*[cos(t5),-sin(t5),0, 0;
                 sin(t5),cos(t5), 0, -h4/2;
                0,        0,      1, 0;
                0,        0,      0,  1];
aux_vert5=(T5*aux_vert5')';
vert_link_5=aux_vert5(:,1:3);

aux_vert6=[vert_link6, ones(max(size(vert_link6)),1)];
T6=T5*[cos(t6), -sin(t6), 0, 0;
     sin(t6),  cos(t6), 0  0;
        0   ,     0   , 1, h5;
        0   ,     0   , 0, 1];
aux_vert6 =(T6*aux_vert6')';
vert_link_6=aux_vert6(:,1:3);

aux_vert7=[vert_link7, ones(max(size(vert_link7)),1)];
T7=T6*[0,0,-1,0;
       0,1,0,0;
       1,0,0,0;
       0,0,0,1]*[cos(t7), -sin(t7), 0, 0;
                 sin(t7),  cos(t7), 0  0;
                    0   ,     0   , 1, r6;
                    0   ,     0   , 0, 1];
aux_vert7 =(T7*aux_vert7')';
vert_link_7=aux_vert7(:,1:3);

aux_vert8=[vert_link8, ones(max(size(vert_link8)),1)];
T8=T7*[1,0,0,0;
     0,1,0,0;
     0,0,1,h7;
     0,0,0,1];
aux_vert8=(T8*aux_vert8')';
vert_link_8=aux_vert8(:,1:3);

% deletes the previous position of the Robot in the picture
% except for the tool
delete(O1);delete(O2);delete(O3);delete(O4);delete(O5);delete(O6);delete(O7);

O1=patch('Vertices',vert_link_1,'Faces',face_links1,'faceColor',[122/255 120/255 100/255]);
O2=patch('Vertices',vert_link_2,'Faces',face_links2,'faceColor',[122/255  12/255 100/255]);
O3=patch('Vertices',vert_link_3,'Faces',face_links3,'faceColor',[ 12/255 120/255 100/255]);
O4=patch('Vertices',vert_link_4,'Faces',face_links4,'faceColor',[122/255 120/255 100/255]);
O5=patch('Vertices',vert_link_5,'Faces',face_links5,'faceColor',[99/255 99/255 99/255]);
O6=patch('Vertices',vert_link_6,'Faces',face_links6,'faceColor',[      0       0 100/255]);
O7=patch('Vertices',vert_link_7,'Faces',face_links7,'faceColor',[127/255 127/255 127/255]);
O8=patch('Vertices',vert_link_8,'Faces',face_links8,'faceColor',[122/255 120/255 100/255]);

% pauses the computations for 0.02 second
pause (0.02)
 currFrame = getframe;
       writeVideo(vidObj,currFrame);


end

%%
%the second and third line of M
% The values of X and Y

XP=X;
YP=Y;

for A=0:0.01:0.2,...  
        X=XP+A;
        Y=YP-A;
% set the desired point in (X,Y,Z) and the initial condition for the
% inverse kinematics algorithm X0
Sol=[X,Y,Z]';
X0=[0;t2;t3;t4;t5;t6;t7];

% Computes the inverse kinematics
s = fsolve(@inkinematic,X0,optimset('Display','off'));

% sets the new values for theta1 theta3, d3, theta6 and theta7
t1=s(1);
t2=s(2);
t3=s(3);
t4=s(4);
t5=s(5);
t6=s(6);
t7=s(7);

% moves the links to the new positions
aux_vert2=[vert_link2, ones(max(size(vert_link2)),1)];
T2=[cos(t2), -sin(t2), 0, 0;
     sin(t2),  cos(t2), 0  0;
        0   ,     0   , 1, l2;
        0   ,     0   , 0, 1];
aux_vert2 =(T2*aux_vert2')';
vert_link_2=aux_vert2(:,1:3);

aux_vert3=[vert_link3, ones(max(size(vert_link3)),1)];
T3=T2*[1,0,0,0;
       0,0,-1,0;
       0,1,0,0;
       0,0,0,1]*[0,-1,0,0;
                 1,0,0,0;
                 0,0,1,0;
                 0,0,0,1]*[cos(t3),-sin(t3),0,  0;
                           sin(t3),cos(t3), 0,  0;
                          0,        0,      1,  h2/2;
                          0,        0,      0,  1];
aux_vert3=(T3*aux_vert3')';
vert_link_3=aux_vert3(:,1:3);

aux_vert4=[vert_link4, ones(max(size(vert_link4)),1)];
T4=T3*[cos(t4),-sin(t4),0,  l3;
       sin(t4),cos(t4), 0, 0;
       0,        0,      1, -h4;
      0,        0,      0,  1];
aux_vert4=(T4*aux_vert4')';
vert_link_4=aux_vert4(:,1:3);

aux_vert5=[vert_link5, ones(max(size(vert_link5)),1)];
T5=T4*[1,0,0,0;
       0,0,1,0;
       0,-1,0,0;
       0,0,0,1]*[cos(t5),-sin(t5),0, 0;
                 sin(t5),cos(t5), 0, -h4/2;
                0,        0,      1, 0;
                0,        0,      0,  1];
aux_vert5=(T5*aux_vert5')';
vert_link_5=aux_vert5(:,1:3);

aux_vert6=[vert_link6, ones(max(size(vert_link6)),1)];
T6=T5*[cos(t6), -sin(t6), 0, 0;
     sin(t6),  cos(t6), 0  0;
        0   ,     0   , 1, h5;
        0   ,     0   , 0, 1];
aux_vert6 =(T6*aux_vert6')';
vert_link_6=aux_vert6(:,1:3);

aux_vert7=[vert_link7, ones(max(size(vert_link7)),1)];
T7=T6*[0,0,-1,0;
       0,1,0,0;
       1,0,0,0;
       0,0,0,1]*[cos(t7), -sin(t7), 0, 0;
                 sin(t7),  cos(t7), 0  0;
                    0   ,     0   , 1, r6;
                    0   ,     0   , 0, 1];
aux_vert7 =(T7*aux_vert7')';
vert_link_7=aux_vert7(:,1:3);

aux_vert8=[vert_link8, ones(max(size(vert_link8)),1)];
T8=T7*[1,0,0,0;
     0,1,0,0;
     0,0,1,h7;
     0,0,0,1];
aux_vert8=(T8*aux_vert8')';
vert_link_8=aux_vert8(:,1:3);

% deletes the previous position of the Robot in the picture
% except for the tool
delete(O1);delete(O2);delete(O3);delete(O4);delete(O5);delete(O6);delete(O7);

O1=patch('Vertices',vert_link_1,'Faces',face_links1,'faceColor',[122/255 120/255 100/255]);
O2=patch('Vertices',vert_link_2,'Faces',face_links2,'faceColor',[122/255  12/255 100/255]);
O3=patch('Vertices',vert_link_3,'Faces',face_links3,'faceColor',[ 12/255 120/255 100/255]);
O4=patch('Vertices',vert_link_4,'Faces',face_links4,'faceColor',[122/255 120/255 100/255]);
O5=patch('Vertices',vert_link_5,'Faces',face_links5,'faceColor',[99/255 99/255 99/255]);
O6=patch('Vertices',vert_link_6,'Faces',face_links6,'faceColor',[      0       0 100/255]);
O7=patch('Vertices',vert_link_7,'Faces',face_links7,'faceColor',[127/255 127/255 127/255]);
O8=patch('Vertices',vert_link_8,'Faces',face_links8,'faceColor',[122/255 120/255 100/255]);

% pauses the computations for 0.02 second
pause (0.02)
 currFrame = getframe;
       writeVideo(vidObj,currFrame);

end

XP=X;
YP=Y;

for C=0:0.01:0.2,...  
        X=XP+C;
        Y=YP+C;
% set the desired point in (X,Y,Z) and the initial condition for the
% inverse kinematics algorithm X0
Sol=[X,Y,Z]';
X0=[0;t2;t3;t4;t5;t6;t7];

% Computes the inverse kinematics
s = fsolve(@inkinematic,X0,optimset('Display','off'));

% sets the new values for theta1 theta3, d3, theta6 and theta7
t1=s(1);
t2=s(2);
t3=s(3);
t4=s(4);
t5=s(5);
t6=s(6);
t7=s(7);

% moves the links to the new positions
aux_vert2=[vert_link2, ones(max(size(vert_link2)),1)];
T2=[cos(t2), -sin(t2), 0, 0;
     sin(t2),  cos(t2), 0  0;
        0   ,     0   , 1, l2;
        0   ,     0   , 0, 1];
aux_vert2 =(T2*aux_vert2')';
vert_link_2=aux_vert2(:,1:3);

aux_vert3=[vert_link3, ones(max(size(vert_link3)),1)];
T3=T2*[1,0,0,0;
       0,0,-1,0;
       0,1,0,0;
       0,0,0,1]*[0,-1,0,0;
                 1,0,0,0;
                 0,0,1,0;
                 0,0,0,1]*[cos(t3),-sin(t3),0,  0;
                           sin(t3),cos(t3), 0,  0;
                          0,        0,      1,  h2/2;
                          0,        0,      0,  1];
aux_vert3=(T3*aux_vert3')';
vert_link_3=aux_vert3(:,1:3);

aux_vert4=[vert_link4, ones(max(size(vert_link4)),1)];
T4=T3*[cos(t4),-sin(t4),0,  l3;
       sin(t4),cos(t4), 0, 0;
       0,        0,      1, -h4;
      0,        0,      0,  1];
aux_vert4=(T4*aux_vert4')';
vert_link_4=aux_vert4(:,1:3);

aux_vert5=[vert_link5, ones(max(size(vert_link5)),1)];
T5=T4*[1,0,0,0;
       0,0,1,0;
       0,-1,0,0;
       0,0,0,1]*[cos(t5),-sin(t5),0, 0;
                 sin(t5),cos(t5), 0, -h4/2;
                0,        0,      1, 0;
                0,        0,      0,  1];
aux_vert5=(T5*aux_vert5')';
vert_link_5=aux_vert5(:,1:3);

aux_vert6=[vert_link6, ones(max(size(vert_link6)),1)];
T6=T5*[cos(t6), -sin(t6), 0, 0;
     sin(t6),  cos(t6), 0  0;
        0   ,     0   , 1, h5;
        0   ,     0   , 0, 1];
aux_vert6 =(T6*aux_vert6')';
vert_link_6=aux_vert6(:,1:3);

aux_vert7=[vert_link7, ones(max(size(vert_link7)),1)];
T7=T6*[0,0,-1,0;
       0,1,0,0;
       1,0,0,0;
       0,0,0,1]*[cos(t7), -sin(t7), 0, 0;
                 sin(t7),  cos(t7), 0  0;
                    0   ,     0   , 1, r6;
                    0   ,     0   , 0, 1];
aux_vert7 =(T7*aux_vert7')';
vert_link_7=aux_vert7(:,1:3);

aux_vert8=[vert_link8, ones(max(size(vert_link8)),1)];
T8=T7*[1,0,0,0;
     0,1,0,0;
     0,0,1,h7;
     0,0,0,1];
aux_vert8=(T8*aux_vert8')';
vert_link_8=aux_vert8(:,1:3);

% deletes the previous position of the Robot in the picture
% except for the tool
delete(O1);delete(O2);delete(O3);delete(O4);delete(O5);delete(O6);delete(O7);

O1=patch('Vertices',vert_link_1,'Faces',face_links1,'faceColor',[122/255 120/255 100/255]);
O2=patch('Vertices',vert_link_2,'Faces',face_links2,'faceColor',[122/255  12/255 100/255]);
O3=patch('Vertices',vert_link_3,'Faces',face_links3,'faceColor',[ 12/255 120/255 100/255]);
O4=patch('Vertices',vert_link_4,'Faces',face_links4,'faceColor',[122/255 120/255 100/255]);
O5=patch('Vertices',vert_link_5,'Faces',face_links5,'faceColor',[99/255 99/255 99/255]);
O6=patch('Vertices',vert_link_6,'Faces',face_links6,'faceColor',[      0       0 100/255]);
O7=patch('Vertices',vert_link_7,'Faces',face_links7,'faceColor',[127/255 127/255 127/255]);
O8=patch('Vertices',vert_link_8,'Faces',face_links8,'faceColor',[122/255 120/255 100/255]);

% pauses the computations for 0.02 second
pause (0.02)
 currFrame = getframe;
       writeVideo(vidObj,currFrame);

end

%%
for Y=2:-0.02:1.5,...  
   
% set the desired point in (X,Y,Z) and the initial condition for the
% inverse kinematics algorithm X0
Sol=[X,Y,Z]';
X0=[0;t2;t3;t4;t5;t6;t7];

% Computes the inverse kinematics
s = fsolve(@inkinematic,X0,optimset('Display','off'));

% sets the new values for theta1 theta3, d3, theta6 and theta7
t1=s(1);
t2=s(2);
t3=s(3);
t4=s(4);
t5=s(5);
t6=s(6);
t7=s(7);

% moves the links to the new positions
aux_vert2=[vert_link2, ones(max(size(vert_link2)),1)];
T2=[cos(t2), -sin(t2), 0, 0;
     sin(t2),  cos(t2), 0  0;
        0   ,     0   , 1, l2;
        0   ,     0   , 0, 1];
aux_vert2 =(T2*aux_vert2')';
vert_link_2=aux_vert2(:,1:3);

aux_vert3=[vert_link3, ones(max(size(vert_link3)),1)];
T3=T2*[1,0,0,0;
       0,0,-1,0;
       0,1,0,0;
       0,0,0,1]*[0,-1,0,0;
                 1,0,0,0;
                 0,0,1,0;
                 0,0,0,1]*[cos(t3),-sin(t3),0,  0;
                           sin(t3),cos(t3), 0,  0;
                          0,        0,      1,  h2/2;
                          0,        0,      0,  1];
aux_vert3=(T3*aux_vert3')';
vert_link_3=aux_vert3(:,1:3);

aux_vert4=[vert_link4, ones(max(size(vert_link4)),1)];
T4=T3*[cos(t4),-sin(t4),0,  l3;
       sin(t4),cos(t4), 0, 0;
       0,        0,      1, -h4;
      0,        0,      0,  1];
aux_vert4=(T4*aux_vert4')';
vert_link_4=aux_vert4(:,1:3);

aux_vert5=[vert_link5, ones(max(size(vert_link5)),1)];
T5=T4*[1,0,0,0;
       0,0,1,0;
       0,-1,0,0;
       0,0,0,1]*[cos(t5),-sin(t5),0, 0;
                 sin(t5),cos(t5), 0, -h4/2;
                0,        0,      1, 0;
                0,        0,      0,  1];
aux_vert5=(T5*aux_vert5')';
vert_link_5=aux_vert5(:,1:3);

aux_vert6=[vert_link6, ones(max(size(vert_link6)),1)];
T6=T5*[cos(t6), -sin(t6), 0, 0;
     sin(t6),  cos(t6), 0  0;
        0   ,     0   , 1, h5;
        0   ,     0   , 0, 1];
aux_vert6 =(T6*aux_vert6')';
vert_link_6=aux_vert6(:,1:3);

aux_vert7=[vert_link7, ones(max(size(vert_link7)),1)];
T7=T6*[0,0,-1,0;
       0,1,0,0;
       1,0,0,0;
       0,0,0,1]*[cos(t7), -sin(t7), 0, 0;
                 sin(t7),  cos(t7), 0  0;
                    0   ,     0   , 1, r6;
                    0   ,     0   , 0, 1];
aux_vert7 =(T7*aux_vert7')';
vert_link_7=aux_vert7(:,1:3);

aux_vert8=[vert_link8, ones(max(size(vert_link8)),1)];
T8=T7*[1,0,0,0;
     0,1,0,0;
     0,0,1,h7;
     0,0,0,1];
aux_vert8=(T8*aux_vert8')';
vert_link_8=aux_vert8(:,1:3);

% deletes the previous position of the Robot in the picture
% except for the tool
delete(O1);delete(O2);delete(O3);delete(O4);delete(O5);delete(O6);delete(O7);

O1=patch('Vertices',vert_link_1,'Faces',face_links1,'faceColor',[122/255 120/255 100/255]);
O2=patch('Vertices',vert_link_2,'Faces',face_links2,'faceColor',[122/255  12/255 100/255]);
O3=patch('Vertices',vert_link_3,'Faces',face_links3,'faceColor',[ 12/255 120/255 100/255]);
O4=patch('Vertices',vert_link_4,'Faces',face_links4,'faceColor',[122/255 120/255 100/255]);
O5=patch('Vertices',vert_link_5,'Faces',face_links5,'faceColor',[99/255 99/255 99/255]);
O6=patch('Vertices',vert_link_6,'Faces',face_links6,'faceColor',[      0       0 100/255]);
O7=patch('Vertices',vert_link_7,'Faces',face_links7,'faceColor',[127/255 127/255 127/255]);
O8=patch('Vertices',vert_link_8,'Faces',face_links8,'faceColor',[122/255 120/255 100/255]);

% pauses the computations for 0.02 second

pause (0.02)
 currFrame = getframe;
       writeVideo(vidObj,currFrame);

end
delete(O1);delete(O2);delete(O3);delete(O4);delete(O5);delete(O6);delete(O7);

for b=0:0.01:0.3
    
pause(0.02)
 currFrame = getframe;
 writeVideo(vidObj,currFrame);

end
 close(vidObj);