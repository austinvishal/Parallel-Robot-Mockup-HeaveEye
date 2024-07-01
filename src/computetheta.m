%computes four angles suitably interpreted by changing sign and summing up
%to Pi. theta1,...theta4
function [theta1,theta2,theta3,theta4]= computetheta(i,R,hh,H1,H2,H3,H4,K1,K2,K3,K4)
syms tet real
if i==1
    H=H1; K=K1;
elseif i==2
    H=H2; K=K2;
elseif i==3
    H=H3; K=K3;
else
    H=H4; K=K4;
end
[k1_p,k2_p,k3_p,k4_p,k5_p,k4r_p,P5_O_p,r45,rint,n45,s_chi,SCRV1]=compute_ik_heave(i,R,hh,H,K,theta5,alpha43);  % compute the geometric parameters by solving IK
GEO=[k1_p,k2_p,k3_p,k4_p,k5_p,k4r_p,P5_O_p,r45,rint,n45,s_chi,SCRV1];
% R_pltTObase = transpose(config(1))';
R_pltTObase = transpose(conf)';
for i=1:4
k1orig(i)= R_pltTObase*GEO(1);
k2orig(i)= R_pltTObase*GEO(2);
k3orig(i)= R_pltTObase*GEO(3);
alpha(i)= sin(alpha23(i))*cross(k1orig(i),k2orig(i))/sin(alpha12(i));
beta(i)= sin(alpha23(i))*(A(i)*k2orig(i)-k1orig(i))/sin(alpha12(i));
gamma(i)= cos(alpha23(i))*k2orig(i);
k3(i)=alpha(i)*cos(tet(i))+beta(i)*sin(tet(i))+gamma(i);
DEk3=(k3(i)(1)-k3orig(i)(1))^2+(k3(i)(2)-k3orig(i)(2))^2+(k3(i)(3)-k3orig(i)(3))^2;
x = fsolve(DEk3,tet(i));
end

end