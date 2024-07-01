% provid careful graphic mockup of mechanism
function Kschem(R,hh,H1,H2,H3,H4,K1,K2,K3,K4,theta5,alpha43,h,r5,coe1,inf45,sup45,r4,A,B,infAB,supAB,l45,k1_b,PP,BB)
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
end
plotoneleg(i,R,hh,H,K,theta5,alpha43,h,r5,coe1,inf45,sup45,r4,A,B,infAB,supAB,l45,k1_b);
% end

% oneleg=plotoneleg(i,R,hh,H,K);
% P1(i)= r4*oneleg()
% plotbase(P11,P12,P13,P14,BB)
end