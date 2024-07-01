% function l_i= drawarclink(vec1, vec2, point, NP, thl_r, thl_z, r4, A)
% function arclink = drawarclink(vec1, vec2, point, style, styleface,styleface_opp, NP, thl_r, thl_z, r4, A)
%  t=0.14/0.012; 
function  drawarclink(vec1, vec2, point, NP, thl_r, thl_z, r4, A)
% vec1=[1 2 3];vec2=[11 12 14];point=[0,0,0];NP=20;thl_r=0.1/30;thl_z=0.1/30*2.5;r4=0.14;
% A=pi/6.6;
%    t= pi/6.6; 
%  t=0:A/(size( lll_i,1)-1): A;
%  sym t real
% t = 0:pi/500:pi;
k12 = vecnorm_res(cross(vec1, vec2));
  k1xk12 = cross(k12, vec1);
%   vecnorm_res(vec1)
%   vecnorm_res(k1xk12)
  rot_mat = transpose([vecnorm_res(vec1); vecnorm_res(k1xk12); k12]);
%   t_ini=0;
%   t_fin=pi/6.6;
%   for t1=t_ini:0.1:t_fin
       syms t real
  lll_i = ((r4 + thl_r) * rot_mat.* [cos(t), sin(t), 0] + k12 * thl_z + point);
%   lll_i = ((r4 + thl_r) * rot_mat* [cos(t); sin(t); 0] + k12 * thl_z + point)
   lll_ii = ((r4 - thl_r) * rot_mat.* [cos(t), sin(t), 0] + k12 * thl_z + point);
   lll_iii = ((r4 + thl_r) * rot_mat.* [cos(t), sin(t), 0] - k12 * thl_z + point);
   lll_iiii = ((r4 - thl_r) * rot_mat.* [cos(t), sin(t), 0] - k12 * thl_z + point);
%    l_i(1,1)
   lll_ii(1,1)
%   size( lll_i)
%   size( lll_ii)
%   size( lll_iii)
%   size( lll_iiii)
% fplot3(xt,yt,zt,[t_ini,t_fin])
% l_i = fplot3(lll_i(:,1),lll_i(:,2),lll_i(:,3), [0 A], 'Color' ,'k', 'MeshDensity',NP, 'LineWidth', 3);
% hold on   
% l_ii = fplot3(lll_ii(:,1),lll_ii(:,2),lll_ii(:,3), [0 A], 'Color' ,'k', 'MeshDensity',NP, 'LineWidth', 3);
% hold on    
% l_iii =fplot3(lll_iii(:,1),lll_iii(:,2),lll_iii(:,3), [0 A], 'Color' , 'k', 'MeshDensity',NP, 'LineWidth', 3);
% hold on    
% l_iiii = fplot3(lll_iiii(:,1),lll_iiii(:,2),lll_iiii(:,3), [0 A], 'Color' , 'k', 'MeshDensity',NP, 'LineWidth', 3);
%   end
%   l_i = plot3(lll_i(:,1),lll_i(:,2),lll_i(:,3),'Color' ,'k', 'LineWidth', 3);
%    l_ii = plot3((lll_ii) ,t, [0 A], 'Color' ,'k', 'MeshDensity',NP, 'LineWidth', 3);
%    l_iii =plot3((lll_iii) ,t, [0 A], 'Color' , 'k', 'MeshDensity',NP, 'LineWidth', 3);
%    l_iiii = plot3((lll_iiii) ,t, [0 A], 'Color' , 'k', 'MeshDensity',NP, 'LineWidth', 3);
%   li = l_i(1,1);
%   lii = l_ii(1,1);
%   liii = l_iii(1,1);
%   liiii = l_iiii(1,1);
li=lll_i(1,1);
lii=lll_ii(1,1);
liii=lll_iii(1,1);
liiii=lll_iiii(1,1);
 t=linspace(0,A);
 curve1x=vpa(subs(li));
  curve1y=vpa(subs(lii));
 curve2x=vpa(subs(lii));
 curve2y=vpa(subs(liiii));
 curve1z=linspace(0,A);
 curve2z=linspace(0,A);
 di = plot3(subs(li), subs(lii),t,'Color' , 'k', 'LineWidth', 3);
   hold on 
 dii = plot3(subs(lii), subs(liiii),t,'Color' , 'k', 'LineWidth', 3);
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
curve3x=vpa(subs(liii));
  curve3y=vpa(subs(liiii));
 curve4x=vpa(subs(liii));
 curve4y=vpa(subs(li));
 curve3z=linspace(0,A);
 curve4z=linspace(0,A);
   diii = plot3(subs(liii), subs(liiii),t, 'Color' , 'k', 'LineWidth', 3);
  hold on 
  diiii = plot3(subs(liii), subs(li),t, 'Color' , 'k', 'LineWidth', 3);
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
% hold on
%  X2a=[curve1x(1,:),fliplr(curve4x(1,:))];
% Y2a=[curve1y(1,:),fliplr(curve4y(1,:))];
% Z2a=[curve1z(1,:),fliplr(curve4z(1,:))];
% % colorSpec=[1, 1, 1];
% %  colorSpec=[1, 0, 0];
% % colorSpec=[	210/255,43/255,43/255];
% h2=fill3(X2a,Y2a,Z2a,colorSpec);

% di = fplot3(li, lii,t, [0 A],'Color' , 'k', 'MeshDensity',NP, 'LineWidth', 3);
%    hold on 
%  dii = fplot3(lii, liiii,t, [0 A],'Color' , 'k', 'MeshDensity',NP, 'LineWidth', 3);
%   hold on 
% h2=fill3(li,lii,t,[0 0 1])

% fsurf(subs(li), subs(lii), [0 A])
%    di = fmesh(li, lii,t, [0 A]);
%    hold on
%        dii = fmesh(lii, liiii,t, [0 A]); 
%    diii = fsurf(lii, liiii,t, [0 A]); 
%    diiii = fsurf(liii, li,t, [0 A]);
%   di = fplot3(li, lii,t, [0 A],'Color' , 'k', 'MeshDensity',NP, 'LineWidth', 2);
%   hold on 
%   dii = fplot3(lii, liiii,t, [0 A],'Color' , 'k', 'MeshDensity',NP, 'LineWidth', 2);
%   hold on 
%   diii = fplot3(liii, liiii,t, [0 A],'Color' , 'k', 'MeshDensity',NP, 'LineWidth', 2);
%   hold on 
%   diiii = fplot3(liii, li,t, [0 A],'Color' , 'k', 'MeshDensity',NP, 'LineWidth', 2);
  
%   [xi, yi] = meshgrid(x,y);
% F = scatteredInterpolant(x,y,z);
% zi = F(xi,yi);
% surf(xi,yi,zi, 'EdgeAlpha', 0)
% hold on
% plot3(x, y, z)

  
%   dii = fsurf(lii, liiii);
%   diii = fsurf(liii, liiii);
%   diiii = fsurf(liii, li);
% %   di = PLOT3D(mesh([li, lii]), styleface_opp);
% %   dii = PLOT3D(mesh([lii, liiii]), op(style));
% %   diii = PLOT3D(mesh([liii, liiii]), op(styleface));
% %   diiii = PLOT3D(mesh([liii, li]), op(style));
%   shading interp 
%   colorbar 
%   ARC = [l_i l_ii l_iii l_iiii di dii diii diiii];
% arclink = ARC;
% end
end
