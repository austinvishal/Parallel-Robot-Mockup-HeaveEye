% function l_i= drawarclink(vec1, vec2, point, NP, thl_r, thl_z, r4, A)
% function arclink = drawarclink(vec1, vec2, point, style, styleface,styleface_opp, NP, thl_r, thl_z, r4, A)
%  t=0.14/0.012; 
vec1=[1 2 3];vec2=[11 12 14];point=[0,0,0];NP=20;thl_r=0.1/30;thl_z=0.1/30*2.5;r4=0.14;
A=pi/6.6;
 t=linspace(0,A);

k12 = vecnorm_res(cross(vec1, vec2));
  k1xk12 = cross(k12, vec1);
  rot_mat = transpose([vecnorm_res(vec1); vecnorm_res(k1xk12); k12]);
for t=0:A
  lll_i = ((r4 + thl_r) * rot_mat.* [cos(t), sin(t), 0] + k12 * thl_z + point);
   lll_ii = ((r4 - thl_r) * rot_mat.* [cos(t), sin(t), 0] + k12 * thl_z + point);
   lll_iii = ((r4 + thl_r) * rot_mat.* [cos(t), sin(t), 0] - k12 * thl_z + point);
   lll_iiii = ((r4 - thl_r) * rot_mat.* [cos(t), sin(t), 0] - k12 * thl_z + point);
end
   lll_ii(1,1);

li=lll_i(1,1);
lii=lll_ii(1,1);
liii=lll_iii(1,1);
liiii=lll_iiii(1,1);
%  t=linspace(0,A);
 curve1x=li;
  curve1y=lii;
 curve2x=lii;
 curve2y=liiii;
%  curve1x=vpa(subs(li));
%   curve1y=vpa(subs(lii));
%  curve2x=vpa(subs(lii));
%  curve2y=vpa(subs(liiii));
 curve1z=linspace(0,A);
 curve2z=linspace(0,A);
 di = plot3(li, lii,t,'Color' , 'k', 'LineWidth', 3);
   hold on 
 dii = plot3(lii, liiii,t,'Color' , 'k', 'LineWidth', 3);
 hold on

 X=[curve1x(:,1),fliplr(curve2x(:,1))];
Y=[curve1y(:,1),fliplr(curve2y(:,1))];
Z=[curve1z(:,1),fliplr(curve2z(:,1))];
colorSpec=[0.5,0.5,0.5];
h0=fill3(X,Y,Z,colorSpec);
set(h0,'LineWidth',3)
hold on 
 X1=[curve1x(:,end),fliplr(curve2x(:,end))];
Y1=[curve1y(:,end),fliplr(curve2y(:,end))];
Z1=[curve1z(:,end),fliplr(curve2z(:,end))];
colorSpec=[0.5,0.5,0.5];
h1=fill3(X1,Y1,Z1,colorSpec);
set(h1,'LineWidth',3)
hold on
curve3x=liii;
  curve3y=liiii;
 curve4x=liii;
 curve4y=li;
 curve3z=linspace(0,A);
 curve4z=linspace(0,A);
   diii = plot3(liii, liiii,t, 'Color' , 'k', 'LineWidth', 3);
  hold on 
  diiii = plot3(liii, li,t, 'Color' , 'k', 'LineWidth', 3);
  hold on
   X2=[curve3x(:,1),fliplr(curve4x(:,1))];
Y2=[curve3y(:,1),fliplr(curve4y(:,1))];
Z2=[curve3z(:,1),fliplr(curve4z(:,1))];
colorSpec=[0.5,0.5,0.5];
h2=fill3(X2,Y2,Z2,colorSpec);
set(h2,'LineWidth',3)
hold on 
 X3=[curve3x(:,end),fliplr(curve4x(:,end))];
Y3=[curve3y(:,end),fliplr(curve4y(:,end))];
Z3=[curve3z(:,end),fliplr(curve4z(:,end))];
colorSpec=[0.5,0.5,0.5];
h3=fill3(X3,Y3,Z3,colorSpec);
set(h3,'LineWidth',3)
hold on
% add markers to identify end of line segment
% plot3(curve2x(:,1),curve2y(:,1),curve2z(:,1),'o',curve3x(:,1),curve3y(:,1),curve3z(:,1),'o','Color','r') %connect curve 2 and 3
% plot3(curve1x(:,1),curve1y(:,1),curve1z(:,1),'o',curve4x(:,1),curve4y(:,1),curve4z(:,1),'o','Color','r') %connect curve 1 and 4
% plot3(curve2x(:,end),curve2y(:,end),curve2z(:,end),'o',curve3x(:,end),curve3y(:,end),curve3z(:,end),'o','Color','r') %connect curve 1 and 3
% plot3(curve1x(:,end),curve1y(:,end),curve1z(:,end),'o',curve4x(:,end),curve4y(:,end),curve4z(:,end),'o','Color','r') %connect curve 1 and 3
%concatenate the x,y,z coordinates vertically for the plot3 or line
%function
pts1 = [curve2x(:,1),curve2y(:,1),curve2z(:,1); curve3x(:,1),curve3y(:,1),curve3z(:,1)];
pts2 = [curve1x(:,1),curve1y(:,1),curve1z(:,1);curve4x(:,1),curve4y(:,1),curve4z(:,1)];
pts3 = [curve2x(:,end),curve2y(:,end),curve2z(:,end); curve3x(:,end),curve3y(:,end),curve3z(:,end)];
pts4 = [curve1x(:,end),curve1y(:,end),curve1z(:,end);curve4x(:,end),curve4y(:,end),curve4z(:,end)];
plot3(pts1(:,1), pts1(:,2), pts1(:,3),'Color' , 'k', 'LineWidth', 3)
plot3(pts2(:,1), pts2(:,2), pts2(:,3),'Color' , 'k', 'LineWidth', 3)
plot3(pts3(:,1), pts3(:,2), pts3(:,3),'Color' , 'k', 'LineWidth', 3)
plot3(pts4(:,1), pts4(:,2), pts4(:,3),'Color' , 'k', 'LineWidth', 3)


