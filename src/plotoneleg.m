function plotoneleg(i,R,hh,H,K,theta5,alpha43,h,r5,coe1,inf45,sup45,r4,A,B,infAB,supAB,l45,k1_b)
% provides all elements, joint, link, axes of the graphical mockup of the
% i-th leg chain

r41=0.14;
r42=0.14;
r43=0.14;
r44=0.14;
r_dist=[r41,r42,r43,r44];
dimref=max(r_dist);
offset=dimref/12; 
radius=0.01;
% radius=5/12*offset; 
tttt=4;
sections=6; NP=20; divis_arcs=30;
%tracts/sections for hatching axes; NP controls the design of links 1 and 2
thl_r=dimref/divis_arcs;
thl_z=thl_r/2.5;
% [k1_p,k2_p,k3_p,k4_p,k5_p,k4r_p,P5_O_p,r45,rint,n45,s_chi,SCRV1]= compute_ik_heave(i,R,hh,H,K,theta5,alpha43,h,r5,coe1,...
%     inf45,sup45,r4,A,B,infAB,supAB,l45,k1_b)
% [k1_p,k2_p,k3_p,k4_p,k5_p,k4r_p,P5_O_p,r45,rint,n45,s_chi,SCRV1]=compute_ik_heave(i,R,hh,H,K,theta5,alpha43,h,...
%     r5,coe1,inf45,sup45,r4,k1_b);  % compute the geometric parameters by solving IK
% GEO=[k1_p,k2_p,k3_p,k4_p,k5_p,k4r_p,P5_O_p,r45,rint,n45,s_chi,SCRV1];
% [k1_p,k2_p,k3_p,k4_p,k5_p,k4r_p,P5_O_p,r45,rint,n45,s_chi,SCRV1]= compute_ik_heave(i,R,hh,H,K,theta5,alpha43,h,r5,coe1,...
%     inf45,sup45,r4,A,B,infAB,supAB,l45,k1_b)
% GEO=[k1_p,k2_p,k3_p,k4_p,k5_p,k4r_p,P5_O_p]
facecolor='none';
    edgecolor='k';
  jointfc='k';
   jointec='k';
linkfc='r';
 linkfc2='r';
linkec='k';
 for i=1:4
    [k1_p,k2_p,k3_p,k4_p,k5_p,k4r_p,P5_O_p,r45,rint,n45,s_chi,SCRV1]= compute_ik_heave(i,R,hh,H,K,theta5,alpha43,h,r5,coe1,...
    inf45,sup45,r4,A,B,infAB,supAB,l45,k1_b);
    GEO=[k1_p,k2_p,k3_p,k4_p,k5_p,k4r_p,P5_O_p];
    GEO(1);
    GEO(:,1);
    GEO(:,2);
    GEO(:,3);
% P1= r4(i)*GEO(:,1);
% P2= r4(i)*GEO(:,2);
% P3= r4(i)*GEO(:,3);
% P4= r4(i)*GEO(:,6);
% P5= GEO(:,7);
% P4;
P1(:,i)= r4(i)*GEO(:,1)  %r1(i)  here all r1 are equal
P2(:,i)= r4(i)*GEO(:,2)  %r2(i)
P3(:,i)= r4(i)*GEO(:,3)  %r3(i)
P4(:,i)= r4(i)*GEO(:,6)
P5(:,i)= GEO(:,7)
 end
    GEO(:,1)
%% plot joints
%drawcylindricaljoint(axis,point,offset, radius,sections,NP)
% drawcylindricaljoint(GEO(:,1),[0,0,0],r4(i), radius,sections,50)
% hold on
% drawcylindricaljoint(GEO(:,2),[0,0,0],r4(i), radius,sections,50)
% hold on
% drawcylindricaljoint(GEO(:,3),[0,0,0],r4(i), radius,sections,50)
% hold on
% drawcylindricaljoint(GEO(:,4),P4(:,1),0, radius,sections,50)
% hold on
% drawcylindricaljoint(GEO(:,4),P5(:,1),0, radius,sections,50)
%rev_joint_axis(r,axis,N,scale,rot_matrix,trans_vec,facecolo,edgecolo,facecolor)
% rev_joint_axis(radius,GEO(:,1),20,0.16,eye(3),[0,0,0],jointfc,jointec,facecolor);
% hold on
% rev_joint_axis(radius,GEO(:,2),20,0.16,eye(3),[0,0,0],jointfc,jointec,facecolor);
% hold on
% rev_joint_axis(radius,GEO(:,3),20,0.16,eye(3),[0,0,0],jointfc,jointec,facecolor);
% hold on
% rev_joint_axis(radius,GEO(:,4),20,0.16,eye(3),P4',jointfc,jointec,facecolor);
% hold on
% rev_joint_axis(radius,GEO(:,4),20,0.16,eye(3),P5',jointfc,jointec,facecolor);
% hold on
% GEO(:,1)';
% GEO(:,2)';
% GEO(:,3)';
% rev_joint_axis(radius,GEO(:,1),20,0.16,eye(3),r4(i),jointfc,jointec,facecolor);
% g2=rev_joint_axis(radius,GEO(:,2),20,0.16,eye(3),r4(i),jointfc,jointec,facecolor);
% g3=rev_joint_axis(radius,GEO(:,3),20,0.16,eye(3),r4(i),jointfc,jointec,facecolor);
% g4=rev_joint_axis(radius,GEO(:,4),20,0.16,eye(3),P4,jointfc,jointec,facecolor);
% g5=rev_joint_axis(radius,GEO(:,4),20,0.16,eye(3),P5(i),jointfc,jointec,facecolor);
%drawarclink(vec1, vec2, point, NP, thl_r, thl_z, r4, A)
% l1=drawarclink(GEO(:,1), GEO(:,2), [0,0,0], NP, thl_r, thl_z, r4(i), acos( A(i)));
% l2=drawarclink(GEO(:,2), GEO(:,3), [0,0,0], NP, thl_r, thl_z, r4(i), acos( A(i)));
%    drawarclink(GEO(:,1)', GEO(:,2)', [0,0,0], NP, thl_r, thl_z, r4(i), acos( A(i)));
% drawarclink(GEO(:,1)', GEO(:,2)', [0,0,0], 20, 0.14/30, thl_z, 0.14, pi/4);
    hold on
%   drawarclink(GEO(:,2)', GEO(:,3)', [0,0,0], NP, thl_r, thl_z, r4(i), acos( B(i)));
%   hold on
% %drawstraightlink(P4,P5,vec,vecnorm, th1_r1, th1_z1, th1_r2, th1_z2)
% l3=drawstraightlink(P3,P4,GEO(:,6),-GEO(:,4), 1.2*th1_r, 1.2*th1_z, 1.2*th1_z, 1.2*th1_r);
% l4=drawstraightlink(P4,P5(i),cross((P4-P5(i)),GEO(:,4)),-GEO(:,4), th1_z, th1_r, th1_z, th1_r);
%  drawstraightlink(P3',P4',GEO(:,6)',-GEO(:,4)', 1.2*thl_r, 1.2*thl_z, 1.2*thl_z, 1.2*thl_r);
% drawstraightlink(P4',P5',cross((P4'-P5'),GEO(:,4)'),-GEO(:,4)', thl_z, thl_r, thl_z, thl_r);
%   end
 
%  end
end