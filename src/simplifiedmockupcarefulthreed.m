function simplifiedmockupcarefulthreed(R,hh,H1,H2,H3,H4,K1,K2,K3,K4,theta5,alpha43,h,r5,coe1,inf45,sup45,r4,A,B,infAB,supAB,l45,k1_b)
axcern =0.02;
visibleaxes=0;
e1=[1,0,0];
e2=[0,1,0];
e3=[0,0,1];
th_r=0.14/30;th_z=2*0.14/75;
for i=1:4
if i==1
    H=H1; K=K1;
elseif i==2
    H=H2; K=K2;
elseif i==3
    H=H3; K=K3;
else
    H=H4; K=K4;
end
 [k1_p,k2_p,k3_p,k4_p,k5_p,k4r_p,P5_O_p,r45,rint,n45,s_chi,SCRV1]= compute_ik_heave(i,R,hh,H,K,theta5,alpha43,h,r5,coe1,...
    inf45,sup45,r4,A,B,infAB,supAB,l45,k1_b)
    GEO=[k1_p,k2_p,k3_p,k4_p,k5_p,k4r_p,P5_O_p]; % this stores only the last ie fourth iteration as it was not iterated inside the loop
   GEO1(:,:,i)=[k1_p,k2_p,k3_p,k4_p,k5_p,k4r_p,P5_O_p] % this is the correct geometric configuration 
   % multidimensional array as k1-k5 is iterated through the loop, needs to
   % be stored for all four legs
   
P1(:,i)= r4(i)*GEO(:,1)  %r1(i)  here all r1 are equal
P2(:,i)= r4(i)*GEO(:,2)  %r2(i)
P3(:,i)= r4(i)*GEO(:,3)  %r3(i)
P4(:,i)= r4(i)*GEO(:,6)
P5(:,i)= GEO(:,7)
size(P5)
end
grid on
P2
% GEO1(1,1,4)
 
%plot the points and polygons
plot3(P1(1,1),P1(2,1),P1(3,1),'-*',0,0,0);
hold on
plot3(P1(1,2),P1(2,2),P1(3,2),'-*',0,0,0);
hold on
plot3(P1(1,3),P1(2,3),P1(3,3),'-*',0,0,0);
hold on
plot3(P1(1,4),P1(2,4),P1(3,4),'-*',0,0,0);
hold on

plot3(P2(1,1),P2(2,1),P2(3,1),'-o',P1(1,1),P1(2,1),P1(3,1));
hold on
plot3(P2(1,2),P2(2,2),P2(3,2),'-o',P1(1,2),P1(2,2),P1(3,2));
hold on
plot3(P2(1,3),P2(2,3),P2(3,3),'-o',P1(1,3),P1(2,3),P1(3,3));
hold on
plot3(P2(1,4),P2(2,4),P2(3,4),'-o',P1(1,4),P1(2,4),P1(3,4));
hold on

plot3(P3(1,1),P3(2,1),P3(3,1),'-*',P2(1,1),P2(2,1),P2(3,1));
hold on
plot3(P3(1,2),P3(2,2),P3(3,2),'-*',P2(1,2),P2(2,2),P2(3,2));
hold on
plot3(P3(1,3),P3(2,3),P3(3,3),'-*',P2(1,3),P2(2,3),P2(3,3));
hold on
plot3(P3(1,4),P3(2,4),P3(3,4),'-*',P2(1,4),P2(2,4),P2(3,4));
hold on

plot3(P4(1,1),P4(2,1),P4(3,1),'-*',P3(1,1),P3(2,1),P3(3,1));
hold on
plot3(P4(1,2),P4(2,2),P4(3,2),'-*',P3(1,2),P3(2,2),P3(3,2));
hold on
plot3(P4(1,3),P4(2,3),P4(3,3),'-*',P3(1,3),P3(2,3),P3(3,3));
hold on
plot3(P4(1,4),P4(2,4),P4(3,4),'-*',P3(1,4),P3(2,4),P3(3,4));
hold on

plot3(P5(1,1),P5(2,1),P5(3,1),'-o',P4(1,1),P4(2,1),P4(3,1));
hold on
plot3(P5(1,2),P5(2,2),P5(3,2),'-o',P4(1,2),P4(2,2),P4(3,2));
hold on
plot3(P5(1,3),P5(2,3),P5(3,3),'-o',P4(1,3),P4(2,3),P4(3,3));
hold on
plot3(P5(1,4),P5(2,4),P5(3,4),'-o',P4(1,4),P4(2,4),P4(3,4));
hold on
% plot3(P5(1),P5(2),P5(3),'-x',P4(1),P4(2),P4(3));

%plot the axes
%concatenate the x,y,z coordinates vertically for the plot3 or line
%function
%  pts1 = [curve2x(:,1),curve2y(:,1),curve2z(:,1); curve3x(:,1),curve3y(:,1),curve3z(:,1)];
%  plot3(pts1(:,1), pts1(:,2), pts1(:,3),'Color' , 'k', 'LineWidth', 3)
plot3([P1(1,1) 0]',[P1(2,1) 0]',[P1(3,1) 0]','Color' , 'k', 'LineWidth', 1 ); %ax1
hold on
plot3([P1(1,2) 0]',[P1(2,2) 0]',[P1(3,2) 0]','Color' , 'k', 'LineWidth', 1);
hold on
plot3([P1(1,3) 0]',[P1(2,3) 0]',[P1(3,3) 0]','Color' , 'k', 'LineWidth', 1);
hold on
plot3([P1(1,4) 0]',[P1(2,4) 0]',[P1(3,4) 0]','Color' , 'k', 'LineWidth', 1);
hold on

lh1 =plot3([P2(1,1) 0]',[P2(2,1) 0]',[P2(3,1) 0]','Color' , 'b', 'LineWidth', 1, 'LineStyle',':'); %ax2
lh1.Color = [lh1.Color 0.5];
hold on
lh2 =plot3([P2(1,2) 0]',[P2(2,2) 0]',[P2(3,2) 0]','Color' , 'b', 'LineWidth', 1, 'LineStyle',':');
lh2.Color = [lh2.Color 0.5];
hold on
lh3 =plot3([P2(1,3) 0]',[P2(2,3) 0]',[P2(3,3) 0]','Color' , 'b', 'LineWidth', 1, 'LineStyle',':');
lh3.Color = [lh3.Color 0.5];
hold on
lh4 =plot3([P2(1,4) 0]',[P2(2,4) 0]',[P2(3,4) 0]','Color' , 'b', 'LineWidth', 1, 'LineStyle',':');
lh4.Color = [lh4.Color 0.5];
hold on

lh5 =plot3([P3(1,1) 0]',[P3(2,1) 0]',[P3(3,1) 0]','Color' , 'r', 'LineWidth', 1, 'LineStyle',':'); %ax3
lh5.Color = [lh5.Color 0.5];
hold on
lh6 =plot3([P3(1,2) 0]',[P3(2,2) 0]',[P3(3,2) 0]','Color' , 'r', 'LineWidth', 1, 'LineStyle',':');
lh6.Color = [lh6.Color 0.5];
hold on
lh7 =plot3([P3(1,3) 0]',[P3(2,3) 0]',[P3(3,3) 0]','Color' , 'r', 'LineWidth', 1, 'LineStyle',':');
lh7.Color = [lh7.Color 0.5];
hold on
lh8 =plot3([P3(1,4) 0]',[P3(2,4) 0]',[P3(3,4) 0]','Color' , 'r', 'LineWidth', 1, 'LineStyle',':');
lh8.Color = [lh8.Color 0.5];
hold on

%let's hide the axis lines, also here, geo needs to be updated to geo1 for
%every leg from multidimensional array below, i have modified to geo1 and
%itw orks perfectly aligning with joint screw
if visibleaxes==1
plot3([P4(1,1)+axcern*GEO1(1,4,1) P4(1,1)-axcern*GEO1(1,4,1)]',[P4(2,1)+axcern*GEO1(2,4,1) P4(2,1)-axcern*GEO1(2,4,1)]',...
    [P4(3,1)+axcern*GEO1(3,4,1) P4(3,1)-axcern*GEO1(3,4,1)]','Color' , 'r', 'LineWidth', 3); %ax4
plot3([P4(1,2)+axcern*GEO1(1,4,2) P4(1,2)-axcern*GEO1(1,4,2)]',[P4(2,2)+axcern*GEO1(2,4,2) P4(2,2)-axcern*GEO1(2,4,2)]',...
    [P4(3,2)+axcern*GEO1(3,4,2) P4(3,2)-axcern*GEO1(3,4,2)]','Color' , 'r', 'LineWidth', 3); %ax4
plot3([P4(1,3)+axcern*GEO1(1,4,3) P4(1,3)-axcern*GEO1(1,4,3)]',[P4(2,3)+axcern*GEO1(2,4,3) P4(2,3)-axcern*GEO1(2,4,3)]',...
    [P4(3,3)+axcern*GEO1(3,4,3) P4(3,3)-axcern*GEO1(3,4,3)]','Color' , 'r', 'LineWidth', 3); %ax4
plot3([P4(1,4)+axcern*GEO1(1,4,4) P4(1,4)-axcern*GEO1(1,4,4)]',[P4(2,4)+axcern*GEO1(2,4,4) P4(2,4)-axcern*GEO1(2,4,4)]',...
    [P4(3,4)+axcern*GEO1(3,4,4) P4(3,4)-axcern*GEO1(3,4,4)]','Color' , 'r', 'LineWidth', 3); %ax4
  hold on % note k4 and k5 are parallel, so 4th col or 5th col is same direction, doesnt matter
plot3([P5(1,1)+axcern*GEO1(1,4,1) P5(1,1)-axcern*GEO1(1,4,1)]',[P5(2,1)+axcern*GEO1(2,4,1) P5(2,1)-axcern*GEO1(2,4,1)]',...
    [P5(3,1)+axcern*GEO1(3,4,1) P5(3,1)-axcern*GEO1(3,4,1)]','Color' , 'r', 'LineWidth', 3); %ax5
plot3([P5(1,2)+axcern*GEO1(1,4,2) P5(1,2)-axcern*GEO1(1,4,2)]',[P5(2,2)+axcern*GEO1(2,4,2) P5(2,2)-axcern*GEO1(2,4,2)]',...
    [P5(3,2)+axcern*GEO1(3,4,2) P5(3,2)-axcern*GEO1(3,4,2)]','Color' , 'r', 'LineWidth', 3); %ax5
plot3([P5(1,3)+axcern*GEO1(1,4,3) P5(1,3)-axcern*GEO1(1,4,3)]',[P5(2,3)+axcern*GEO1(2,4,3) P5(2,3)-axcern*GEO1(2,4,3)]',...
    [P5(3,3)+axcern*GEO1(3,4,3) P5(3,3)-axcern*GEO1(3,4,3)]','Color' , 'r', 'LineWidth', 3); %ax5
plot3([P5(1,4)+axcern*GEO1(1,4,4) P5(1,4)-axcern*GEO1(1,4,4)]',[P5(2,4)+axcern*GEO1(2,4,4) P5(2,4)-axcern*GEO1(2,4,4)]',...
    [P5(3,4)+axcern*GEO1(3,4,4) P5(3,4)-axcern*GEO1(3,4,4)]','Color' , 'r', 'LineWidth', 3); %ax5
hold on
else
end

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
GEO(:,1)
%% plot joints for all legs
rev_joint_axis(0.3,GEO1(:,1,1),20,0.02,eye(3),P1(:,1)',jointfc,jointec,facecolor);
hold on
rev_joint_axis(0.3,GEO1(:,1,2),20,0.02,eye(3),P1(:,2)',jointfc,jointec,facecolor);
hold on
rev_joint_axis(0.3,GEO1(:,1,3),20,0.02,eye(3),P1(:,3)',jointfc,jointec,facecolor);
hold on
% rev_joint_axis(0.3,GEO(:,1),20,0.02,eye(3),P1(:,1)',jointfc,jointec,facecolor);
% hold on
% rev_joint_axis(0.3,GEO(:,1),20,0.02,eye(3),P1(:,2)',jointfc,jointec,facecolor);
% hold on
% rev_joint_axis(0.3,GEO(:,1),20,0.02,eye(3),P1(:,3)',jointfc,jointec,facecolor);
% hold on
rev_joint_axis(0.3,GEO1(:,1,4),20,0.02,eye(3),P1(:,4)',jointfc,jointec,facecolor);
hold on

rev_joint_axis(0.3,GEO1(:,2,1),20,0.02,eye(3),P2(:,1)',jointfc,jointec,facecolor);
hold on
rev_joint_axis(0.3,GEO1(:,2,2),20,0.02,eye(3),P2(:,2)',jointfc,jointec,facecolor);
hold on
rev_joint_axis(0.3,GEO1(:,2,3),20,0.02,eye(3),P2(:,3)',jointfc,jointec,facecolor);
hold on
rev_joint_axis(0.3,GEO1(:,2,4),20,0.02,eye(3),P2(:,4)',jointfc,jointec,facecolor);
hold on

% rev_joint_axis(0.3,GEO(:,2),20,0.02,eye(3),P2(:,1)',jointfc,jointec,facecolor);
% hold on
% rev_joint_axis(0.3,GEO(:,2),20,0.02,eye(3),P2(:,2)',jointfc,jointec,facecolor);
% hold on
% rev_joint_axis(0.3,GEO(:,2),20,0.02,eye(3),P2(:,3)',jointfc,jointec,facecolor);
% hold on
% rev_joint_axis(0.3,GEO(:,2),20,0.02,eye(3),P2(:,4)',jointfc,jointec,facecolor);
% % this last joint alone will be plotted in correct axis the first three
% are not stored so its plotted in fourth iterator value axis
% hold on   

rev_joint_axis(0.3,GEO1(:,3,1),20,0.02,eye(3),P3(:,1)',jointfc,jointec,facecolor);
hold on
rev_joint_axis(0.3,GEO1(:,3,2),20,0.02,eye(3),P3(:,2)',jointfc,jointec,facecolor);
hold on
rev_joint_axis(0.3,GEO1(:,3,3),20,0.02,eye(3),P3(:,3)',jointfc,jointec,facecolor);
hold on
rev_joint_axis(0.3,GEO1(:,3,4),20,0.02,eye(3),P3(:,4)',jointfc,jointec,facecolor);
hold on

% rev_joint_axis(0.3,GEO(:,3),20,0.02,eye(3),P3(:,1)',jointfc,jointec,facecolor);
% hold on
% rev_joint_axis(0.3,GEO(:,3),20,0.02,eye(3),P3(:,2)',jointfc,jointec,facecolor);
% hold on
% rev_joint_axis(0.3,GEO(:,3),20,0.02,eye(3),P3(:,3)',jointfc,jointec,facecolor);
% hold on
% rev_joint_axis(0.3,GEO(:,3),20,0.02,eye(3),P3(:,4)',jointfc,jointec,facecolor);
% hold on

rev_joint_axis(0.3,GEO1(:,4,1),20,0.02,eye(3),P4(:,1)',jointfc,jointec,facecolor);
hold on
rev_joint_axis(0.3,GEO1(:,4,2),20,0.02,eye(3),P4(:,2)',jointfc,jointec,facecolor);
hold on
rev_joint_axis(0.3,GEO1(:,4,3),20,0.02,eye(3),P4(:,3)',jointfc,jointec,facecolor);
hold on
rev_joint_axis(0.3,GEO1(:,4,4),20,0.02,eye(3),P4(:,4)',jointfc,jointec,facecolor);
hold on

% rev_joint_axis(0.3,GEO(:,4),20,0.02,eye(3),P4(:,1)',jointfc,jointec,facecolor);
% hold on
% rev_joint_axis(0.3,GEO(:,4),20,0.02,eye(3),P4(:,2)',jointfc,jointec,facecolor);
% hold on
% rev_joint_axis(0.3,GEO(:,4),20,0.02,eye(3),P4(:,3)',jointfc,jointec,facecolor);
% hold on
% rev_joint_axis(0.3,GEO(:,4),20,0.02,eye(3),P4(:,4)',jointfc,jointec,facecolor);
% hold on
% note k4 and k5 are parallel so it doesnt matter to have k4 or k5
% rev_joint_axis(0.3,GEO(:,4),20,0.02,eye(3),P5(:,1)',jointfc,jointec,facecolor);
% hold on
% rev_joint_axis(0.3,GEO(:,4),20,0.02,eye(3),P5(:,2)',jointfc,jointec,facecolor);
% hold on
% rev_joint_axis(0.3,GEO(:,4),20,0.02,eye(3),P5(:,3)',jointfc,jointec,facecolor);
% hold on
% rev_joint_axis(0.3,GEO(:,4),20,0.02,eye(3),P5(:,4)',jointfc,jointec,facecolor);
% hold on

rev_joint_axis(0.3,GEO1(:,4,1),20,0.02,eye(3),P5(:,1)',jointfc,jointec,facecolor);
hold on
rev_joint_axis(0.3,GEO1(:,4,2),20,0.02,eye(3),P5(:,2)',jointfc,jointec,facecolor);
hold on
rev_joint_axis(0.3,GEO1(:,4,3),20,0.02,eye(3),P5(:,3)',jointfc,jointec,facecolor);
hold on
rev_joint_axis(0.3,GEO1(:,4,4),20,0.02,eye(3),P5(:,4)',jointfc,jointec,facecolor);
hold on

text(P5(1,1)-0.01,P5(2,1)-0.01,P5(3,1),'A','fontsize',14,'Interpreter', 'latex');
hold on
text(P5(1,2)-0.01,P5(2,2)-0.01,P5(3,2),'B','fontsize',14,'Interpreter', 'latex');
hold on
text(P5(1,3)-0.01,P5(2,3)-0.01,P5(3,3),'C','fontsize',14,'Interpreter', 'latex');
hold on
text(P5(1,4)-0.01,P5(2,4)-0.01,P5(3,4),'D','fontsize',14,'Interpreter', 'latex');
hold on
% r45=vecnorm_res(P5(:,i)-(hh+h(i))*e3)*GEO(8);
% hold on
% plot3([r45(1,1) 0]',[r45(1,2) 0]',[r45(1,3) 0]','Color' , 'r', 'LineWidth', 3);
% hold on
% plot3([r45(2,1) 0]',[r45(2,2) 0]',[r45(2,3) 0]','Color' , 'r', 'LineWidth', 3);
% hold on
% plot3([r45(3,1) 0]',[r45(3,2) 0]',[r45(3,3) 0]','Color' , 'r', 'LineWidth', 3);
% hold on
%% plot link lines  for easy understanding, even spherical link here is plotted as straight line
% drawarclink(GEO1(:,1,1)', GEO1(:,1,2)', [0,0,0], 20, 0.14/30, 0.14/75, 0.14, pi/4);
% hold on
 track_arc3d([P2(1,1) ;P1(1,1)],[P2(2,1) ;P1(2,1)],[P2(3,1) ;P1(3,1)],200,6,th_r,th_z,[0.5,0.5,0.5],[1,1,1],[0.8,0.8,0.8],[0.8,0.8,0.8])
 hold on 
 track_arc3d([P2(1,2) ;P1(1,2)],[P2(2,2) ;P1(2,2)],[P2(3,2) ;P1(3,2)],200,6,th_r,th_z,[0.5,0.5,0.5],[1,1,1],[0.8,0.8,0.8],[0.8,0.8,0.8])
 hold on
 track_arc3d([P2(1,3) ;P1(1,3)],[P2(2,3) ;P1(2,3)],[P2(3,3) ;P1(3,3)],200,6,th_r,th_z,[0.5,0.5,0.5],[1,1,1],[0.8,0.8,0.8],[0.8,0.8,0.8])
 hold on
 track_arc3d([P2(1,4) ;P1(1,4)],[P2(2,4) ;P1(2,4)],[P2(3,4) ;P1(3,4)],200,6,th_r,th_z,[0.5,0.5,0.5],[1,1,1],[0.8,0.8,0.8],[0.8,0.8,0.8])
 hold on

 track_arc3d([P3(1,1) ;P2(1,1)],[P3(2,1) ;P2(2,1)],[P3(3,1) ;P2(3,1)],200,6,th_r,th_z,[0.5,0.5,0.5],[1,1,1],[0.8,0.8,0.8],[0.8,0.8,0.8])
 hold on 
 track_arc3d([P3(1,2) ;P2(1,2)],[P3(2,2) ;P2(2,2)],[P3(3,2) ;P2(3,2)],200,6,th_r,th_z,[0.5,0.5,0.5],[1,1,1],[0.8,0.8,0.8],[0.8,0.8,0.8])
 hold on
 track_arc3d([P3(1,3) ;P2(1,3)],[P3(2,3) ;P2(2,3)],[P3(3,3) ;P2(3,3)],200,6,th_r,th_z,[0.5,0.5,0.5],[1,1,1],[0.8,0.8,0.8],[0.8,0.8,0.8])
 hold on
 track_arc3d([P3(1,4) ;P2(1,4)],[P3(2,4) ;P2(2,4)],[P3(3,4) ;P2(3,4)],200,6,th_r,th_z,[0.5,0.5,0.5],[1,1,1],[0.8,0.8,0.8],[0.8,0.8,0.8])
 hold on
jointfc2=[1,1,1];
 plotboxbetweenpoints(0.003,[P5(1,1) P5(2,1) P5(3,1)],[P4(1,1) P4(2,1) P4(3,1)],jointfc1,linkec,jointfc2)
 hold on
 plotboxbetweenpoints(0.003,[P5(1,2) P5(2,2) P5(3,2)],[P4(1,2) P4(2,2) P4(3,2)],jointfc1,linkec,jointfc2)
 hold on
 plotboxbetweenpoints(0.003,[P5(1,3) P5(2,3) P5(3,3)],[P4(1,3) P4(2,3) P4(3,3)],jointfc1,linkec,jointfc2)
 hold on
 plotboxbetweenpoints(0.003,[P5(1,4) P5(2,4) P5(3,4)],[P4(1,4) P4(2,4) P4(3,4)],jointfc1,linkec,jointfc2)
 hold on

plot3([P3(1,1) P4(1,1)]',[P3(2,1) P4(2,1)]',[P3(3,1) P4(3,1)]','Color' , 'k', 'LineWidth', 2); %ax1
hold on
plot3([P3(1,2) P4(1,2)]',[P3(2,2) P4(2,2)]',[P3(3,2) P4(3,2)]','Color' , 'k', 'LineWidth', 2);
hold on
plot3([P3(1,3) P4(1,3)]',[P3(2,3) P4(2,3)]',[P3(3,3) P4(3,3)]','Color' , 'k', 'LineWidth', 2);
hold on
plot3([P3(1,4) P4(1,4)]',[P3(2,4) P4(2,4)]',[P3(3,4) P4(3,4)]','Color' , 'k', 'LineWidth', 2);
hold on

% plot3([P5(1,1) P4(1,1)]',[P5(2,1) P4(2,1)]',[P5(3,1) P4(3,1)]','Color' , 'k', 'LineWidth', 2); %ax1
% hold on
% plot3([P5(1,2) P4(1,2)]',[P5(2,2) P4(2,2)]',[P5(3,2) P4(3,2)]','Color' , 'k', 'LineWidth', 2);
% hold on
% plot3([P5(1,3) P4(1,3)]',[P5(2,3) P4(2,3)]',[P5(3,3) P4(3,3)]','Color' , 'k', 'LineWidth', 2);
% hold on
% plot3([P5(1,4) P4(1,4)]',[P5(2,4) P4(2,4)]',[P5(3,4) P4(3,4)]','Color' , 'k', 'LineWidth', 2);
% hold on
%% plot platform
xa5= [P5(1,:)];
ya5= [P5(2,:)];
za5= [P5(3,:)];
 h2=fill3(xa5,ya5,za5,'r','LineStyle','none');
 set(h2,'facealpha',.5);
 %% plot base
 % Convert color code to 1-by-3 RGB array (0~1 each)
str = '#A9A9A9';
color = sscanf(str(2:end),'%2x%2x%2x',[1 3])/255;

xa1= [P1(1,:)];
ya1= [P1(2,:)];
za1= [P1(3,:)];
%  h1=fill3(xa1,ya1,za1,'g','LineStyle','none')
 h1=fill3(xa1,ya1,za1,color);
set(h1,'facealpha',.5);
hold on
% patch base triangle
xa11= [P1(1,1) P1(1,2) 0];
ya11= [P1(2,1) P1(2,2) 0];
za11= [P1(3,1) P1(3,2) 0];
 h2=fill3(xa11,ya11,za11,color,'LineStyle','none');
set(h2,'facealpha',.5);
% patch base triangle
xa12= [P1(1,1) P1(1,3) 0];
ya12= [P1(2,1) P1(2,3) 0];
za12= [P1(3,1) P1(3,3) 0];
 h3=fill3(xa12,ya12,za12,color,'LineStyle','none');
set(h3,'facealpha',.5);
% patch base triangle
xa13= [P1(1,3) P1(1,4) 0];
ya13= [P1(2,3) P1(2,4) 0];
za13= [P1(3,3) P1(3,4) 0];
 h4=fill3(xa13,ya13,za13,color,'LineStyle','none');
set(h4,'facealpha',.5);

grid on
xlabel('e1')
ylabel('e2')
zlabel('e3')
 lighting gouraud
% lighting flat
view(3)
  light('Position',[0 0 1],'Style','local')
%  light('Position',[0 1 1],'Style','local')
end
