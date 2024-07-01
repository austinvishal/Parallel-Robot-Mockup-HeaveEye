% function l_i= drawarclink(vec1, vec2, point, NP, thl_r, thl_z, r4, A)
% function arclink = drawarclink(vec1, vec2, point, style, styleface,styleface_opp, NP, thl_r, thl_z, r4, A)
%  t=0.14/0.012; 
function  drawsimplearclink(vec1, vec2, point, NP, thl_r, thl_z, r4, A)
% vec1=[1 2 3];vec2=[11 12 14];point=[0,0,0];NP=20;thl_r=0.1/30;thl_z=0.1/30*2.5;r4=0.14;
% A=pi/6.6;
k12 = vecnorm_res(cross(vec1, vec2));
  k1xk12 = cross(k12, vec1);

  rot_mat = transpose([vecnorm_res(vec1); vecnorm_res(k1xk12); k12]);

       syms t real
   lll_i = ((r4 + thl_r) * rot_mat.* [cos(t), sin(t), 0] + k12 * thl_z + point);
    lll_ii = ((r4 - thl_r) * rot_mat.* [cos(t), sin(t), 0] + k12 * thl_z + point);
% lll_i = (rot_mat.* [cos(t), sin(t), 0] )
%    lll_ii = (rot_mat.* [cos(t), sin(t), 0] )
   lll_iii = ((r4 + thl_r) * rot_mat.* [cos(t), sin(t), 0] - k12 * thl_z + point);
   lll_iiii = ((r4 - thl_r) * rot_mat.* [cos(t), sin(t), 0] - k12 * thl_z + point);

li=lll_i(1,1)
lii=lll_i(1,2)
% lii=lll_ii(1,1);
% liii=lll_iii(1,1);
% liiii=lll_iiii(1,1);
 t=linspace(0,A);
 
%  curve1x=vpa(subs(li));
%   curve1y=vpa(subs(lii));
%  curve2x=vpa(subs(lii));
%  curve2y=vpa(subs(liiii));
%  curve1z=linspace(0,A);
%  curve2z=linspace(0,A);
 di = plot3(subs(li), subs(lii),t,'Color' , 'k', 'LineWidth', 3);
  
 % start, end ,X are vectors
 n=cross(start, end); % normal n of plane p in which the arc lies
%  % dot(n,X)=0; p contains all points X satisfying the equation
 % now we need two orthogonal unit vectors X,Y lying in p
 X= start/norm(start);
 Y=cross(n,start)/ norm(cross(n,start)); % norm is sqrt of elements, euclidean norm
 t=linspace(0,A);
 plot3(subs(cos(t)*X),subs(sin(t)*Y),t,'Color' , 'k', 'LineWidth', 3)
end
