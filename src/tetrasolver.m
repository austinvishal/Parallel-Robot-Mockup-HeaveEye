function T=tetrasolver(v1,v2,infAB,supAB,A,B,K)
%solve a system of two tetrahedron equation
ab=dot(v1,v2);
axb=cross(v1,v2);
rad=sqrt(-(ab-infAB)*(ab-supAB));
T1=((A-B*ab)/(1-ab^2));
T2=((B-A*ab)/(1-ab^2));
T3=((K*rad)/(1-ab^2));
T=(T1*v1+T2*v2+T3*axb);
end