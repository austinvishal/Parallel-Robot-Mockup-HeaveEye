% function drawarc3d(start,endi,A,r4,th1_r,thl_z,point)
function drawarc3d(start,endi,A,r4)
% vec1, vec2, point, NP, thl_r, thl_z, r4, A
% start, end ,X are vectors
 n=cross(start, endi); % normal n of plane p in which the arc lies
 n1=vecnorm_res(n);
 % dot(n,X)=0; p contains all points X satisfying the equation
 % now we need two orthogonal unit vectors X,Y lying in p
 X= start/norm(start)
 Y=cross(n,start)/ norm(cross(n,start)) % norm is sqrt of elements, euclidean norm
 rot_mat = transpose([X; Y; n1])
 syms t real
%  l1=0.01*(r4 - th1_r )*rot_mat*[cos(t); sin(t); 0]+ n1 * thl_z + point
 t=linspace(0,A,3)
%  subs(cos(t)).*X
% l1(1)
% l1(2)
%  plot3(subs(l1(1)),subs(l1(2)),t,'Color' , 'k', 'LineWidth', 3)
  plot3(r4*subs(cos(t)).*X,r4*subs(sin(t)).*Y,t,'Color' , 'k', 'LineWidth', 3)
end