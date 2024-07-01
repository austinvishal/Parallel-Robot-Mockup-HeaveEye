P5a=[0.0900 0 0.1600];
P5b=[0.0000 0.0900 0.1600];
P5c=[-0.0900 0 0.1600];
P5d=[-0.0000 -0.0900 0.1600];

k5a= [0 1 0];
k5b= [-1.0000 0 0];
k5c= [-0.0000 -1.0000 0];
k5d= [1 -0.0000 0];

% colors
%plot 3d joints
str = '#F5F5F5';
color = sscanf(str(2:end),'%2x%2x%2x',[1 3])/255;
% facecolor='none';
facecolor=color;
edgecolor='none';
%     edgecolor='k';
%   jointfc='none';
   jointfc=color;
   jointfc1=[0.8,0.8,0.8];
   jointec='k';
linkfc='r';
 linkfc2='r';
linkec='k';
%% plotting
plot3(P5a(1),P5a(2),P5a(3),'-o');
hold on
plot3(P5b(1),P5b(2),P5b(3),'-o');
hold on
plot3(P5c(1),P5c(2),P5c(3),'-o');
hold on
plot3(P5d(1),P5d(2),P5d(3),'-o');
hold on
rev_joint_axis(0.3,k5a,20,0.02,eye(3),P5a,jointfc,jointec,facecolor);
hold on
rev_joint_axis(0.3,k5b,20,0.02,eye(3),P5b,jointfc,jointec,facecolor);
hold on
rev_joint_axis(0.3,k5c,20,0.02,eye(3),P5c,jointfc,jointec,facecolor);
hold on
rev_joint_axis(0.3,k5d,20,0.02,eye(3),P5d,jointfc,jointec,facecolor);
hold on
text(P5a(1)-0.01,P5a(2)-0.01,P5a(3),'A','fontsize',14,'Interpreter', 'latex');
hold on
text(P5b(1)-0.01,P5b(2)-0.01,P5b(3),'B','fontsize',14,'Interpreter', 'latex');
hold on
text(P5c(1)-0.01,P5c(2)-0.01,P5c(3),'C','fontsize',14,'Interpreter', 'latex');
hold on
text(P5d(1)-0.01,P5d(2)-0.01,P5d(3),'D','fontsize',14,'Interpreter', 'latex');
hold on

%% plot the platform
% plot a line passing through axis and the point from joint intersecting
% the other line coming from other joint axis passing through the point

P1=P5a+0.5*k5a;
 plot3([P5a(1), P1(1)], [P5a(2), P1(2)], [P5a(3), P1(3)])
 hold on
   P1b=P5a-0.5*k5a;
%  P1b=P5a+0.5*k5a;
 plot3([P5a(1), P1b(1)], [P5a(2), P1b(2)], [P5a(3), P1b(3)])
 hold on
 P2=P5b+0.5*k5b;
 plot3([P5b(1), P2(1)], [P5b(2), P2(2)], [P5b(3), P2(3)])
  hold on
 P3=P5c+0.5*k5c;
 plot3([P5c(1), P3(1)], [P5c(2), P3(2)], [P5c(3), P3(3)])
  hold on
 P4=P5d+0.5*k5d;
 plot3([P5d(1), P4(1)], [P5d(2), P4(2)], [P5d(3), P4(3)])