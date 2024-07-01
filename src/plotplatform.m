 function plotplatform(P1,P2,P3,P4,PP)
Rzte5=Rz(theta5(i));
e1=[1;0;0];
e2=[0;1;0];
e3=[0;0;1];
for i=1:4
    k5(i)=Rzte5*e2;
end
%find the highest and lowest
i=2; j=1;
P5(i)=P2;
P5(j)=P1;
d(i,j)=[P5(i)(1)-P5(j)(1),P5(i)(2)-P5(j)(2),0]; %distance
ka(i,j)=-(-k5(i)(1)*d(i,j)(2)+d(i,j)(1)*k5(i)(2))/(-k5(j)(1)*k5(i)(2)+k5(j)(2)*k5(i)(1));
X(i,j)=(ka(i,j)*k5(j)+[P5(j)(1),P5(j)(2),zz(minh(3))]) %point of intersection on the plane
%calculates the intersection points; sets them to the minimum height for the PP=3 option
end