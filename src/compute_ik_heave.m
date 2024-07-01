% solve the inverse kinematics of leg i
% function [k1_p,k2_p,k3_p,k4_p,k5_p,k4r_p,P5_O_p,r45,rint,n45,s_chi,SCRV1]= compute_ik_heave(i,R,hh,H,K,theta5,alpha43,h)
function [k1_p,k2_p,k3_p,k4_p,k5_p,k4r_p,P5_O_p,r45,rint,n45,s_chi,SCRV1]= compute_ik_heave(i,R,hh,H,K,theta5,alpha43,h,r5,coe1,...
    inf45,sup45,r4,A,B,infAB,supAB,l45,k1_b)
e1=[1;0;0];
e2=[0;1;0];
e3=[0;0;1];
%m45= inf45 , lower limit; M45= sup45 upperlimit
% infAB(i)=A(i)*B(i)-sqrt((1-A(i)^2)*(1-B(i)^2));
% supAB(i)=A(i)*B(i)+sqrt((1-A(i)^2)*(1-B(i)^2));
% inf45(i)=(r4(i)-l45(i))^2;
% sup45(i)=(r4(i)+l45(i))^2;
% coe1(i)=r5(i)^2+r4(i)^2-l45(i)^2;
% k1_b(i)=[cos(beta1(i))*cos(alpha1(i)), sin(beta1(i))*cos(alpha1(i)), -sin(alpha1(i))];
%   for i=1:4
      h;
    L=hh+h(i);
    M= r5(i);
    N=(L^2+coe1(i));
    den= (L^2+r5(i)^2);
    if (den>= inf45(i) && den<= sup45(i) )
        RAD=sqrt(-(den-inf45(i))*(den-sup45(i)))% this is CL equation 
%     end
        c1=(N*L-H*M*RAD)/(2*den*r4(i)); % this will be cos psi 4 obtainedfrom the loop closure equation
        s1=(N*L+H*M*RAD)/(2*den*r4(i));
        % to obtain k4 in Pijk, we rotate j about k at thetaL ie theta5 for leg
        % i.
        RyP4e3= [s1;0;c1];
        Rzte5=Rz(theta5(i)) ;
        % find k3 and k1
        k3_p= Rzte5*Ry(alpha43(i))*RyP4e3  % this is needed for spherical section IK
        k1_p= R*k1_b(:,i)
%         A=A(i); B=B(i); % these are angles, define them properly
        ab=dot(k1_p,k3_p)
        infAB;
        supAB;
        %infAB inferiorAB is mAB and MAB is superiorAB which is the max limit.
        %a leg configuration is feasible if the dot product of k1,k3 is within
        %this range.
        if (ab>= infAB(i) && ab<= supAB(i))
            axb=cross(k1_p,k3_p);
        end
        rad= sqrt(-(ab-infAB(i))*(ab-supAB(i)));  %this is C delta from eq 1.14
%         T1=((A-B*ab)/(1-ab^2));
%         T2=((B-A*ab)/(1-ab^2));
        T1=((A(i)-B(i)*ab)/(1-ab^2));
        T2=((B(i)-A(i)*ab)/(1-ab^2));
        T3=K*rad/(1-ab^2);
        k2_p=(T1*k1_p+T2*k3_p+T3*axb); % this is eqn 1.13 ie the linear combination of k1 and k3. which
        % is basically the mutual slant between two cone intersection.
        
        P5_O_p=(r5(i)*Rzte5*e1+L*e3);
        % find k5,k4,k4perp
        k5_p=Rzte5*e2;
        k4_p=k5_p;
        k4r_p=Rzte5*RyP4e3; % this is equation 1.4 in the thesis
        k4r_p_ort= cross(k4_p,k4r_p); % or you can do  cross (k4_p,k4rp)
%         k4r_p_ort=Rzte5*[-RyP4e3(3), 0, RyP4e3(1)]; % or you can do  cross (k4_p,k4rp)
%         k3r_p_ort=Rzte5*Ry(alpha43(i))*[-RyP4e3(3), 0, RyP4e3(1)];
        k3r_p_ort=Rzte5*Ry(alpha43(i))*[-RyP4e3(3); 0; RyP4e3(1)];
        % the distance rint as per eq 1.9
        rint = r4(i)*H*RAD/(sin(alpha43(i))*(den-r4(i)^2-l45(i)^2)+H*cos(alpha43(i))*RAD);
        r45=den*H*RAD/((den-r4(i)^2+l45(i)^2)*L+H*r5(i)*RAD);
        
        s_om4=(l45(i)^2+r4(i)^2-r5(i)^2-L^2)/(2*l45(i)*r4(i)); % for building eqn 1.6 we need omega4
        c_om4=H*RAD/(2*l45(i)*r4(i)); % this is eqn 1.7
        n45=vecnorm_res(c_om4*k4r_p+s_om4*k4r_p_ort);
%         n23=((-T3*k1_p+T3*ab*k3_p+T1*axb)/sqrt(1-B^2)); %eqn 1.15
        n23=((-T3*k1_p+T3*ab*k3_p+T1*axb)/sqrt(1-B(i)^2)); %eqn 1.15
        %
        
        s_chi=H*sign(r45)*abs(L)/sqrt(L^2+(r45-r5(i))^2);
        ctg_chi=(H*RAD*L-r5(i)*(L^2+r5(i)^2-r4(i)^2+l45(i)^2))/((L^2+r5(i)^2-r4(i)^2+l45(i)^2)*L+H*r5(i)*RAD);
        c143=c1*cos(alpha43(i))-s1*sin(alpha43(i));
        s143=s1*cos(alpha43(i))+c1*sin(alpha43(i));
        Mat_M=[0 0 -1
            0 1 0
            -1 0 0];
        SCRV1=(r45/dot(n23,k4_p)*(n23.*Mat_M)) %screw vector1  %added a dot for elementwise multiplication with matrix
%     end
  end
end



