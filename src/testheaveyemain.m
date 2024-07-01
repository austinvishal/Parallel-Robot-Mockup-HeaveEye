
% l1=drawarclink([1 2 3],[11 12 14],[0,0,0],20,0.1/30,0.1/30*2.5,0.14,pi/6.6);

% rotyP_4= compute_rotPfour(1,0,1, [0.0,0.0,0.0,0.0],[0.09,0.09,0.09,0.09],[0.14,0.14,0.14,0.14],...
%                 [0.08,0.08,0.08,0.08])
            
%             Rz(0.1)

% [c1,c2,c3]=testsum(1,2)
clc
clear all
% Reference frames on point O; e3pp direction orthogonal to the moving platform
% 'ei' be the unit lenght vector i of a platform reference frame, written in that platform reference frame
e1=[1,0,0];
e2=[0,1,0];
e3=[0,0,1];

% t=pi/40;
 t=pi;
% t=vpa(pi);
for i=1:4
    r4(i)= 0.14;
    r1(i)= r4(i);
    r2(i)= r4(i);
    r3(i)= r4(i);
    r5(i)= 0.09;
    h(i)=0;
    l45(i)= 0.08;
    theta5(i)=(i-1)*t/2;
    alpha43(i)=t/35;
    alpha1(i)=0.4;
    beta1(i)=(i-1)*t/2;
    A(i)=cos(t/4);
    B(i)=cos(t/4);
    infAB(i)=A(i)*B(i)-sqrt((1-A(i)^2)*(1-B(i)^2));
    supAB(i)=A(i)*B(i)+sqrt((1-A(i)^2)*(1-B(i)^2));
    inf45(i)=(r4(i)-l45(i))^2;
    sup45(i)=(r4(i)+l45(i))^2;
    coe1(i)=r5(i)^2+r4(i)^2-l45(i)^2;
     k1_b(:,i)=[cos(beta1(i))*cos(alpha1(i)), sin(beta1(i))*cos(alpha1(i)), -sin(alpha1(i))];

end
h
conf=RrTT(0,0,0); % merge this two different datatypes together to pass as single argument later.
%  config=[0.14,1,1,1,1,-1,1,1,1,theta5,alpha43,h,r5,coe1,inf45,sup45,r4,A,B,infAB,supAB,l45];
 config=[0.14,1,1,1,1,1,1,1,1,theta5,alpha43,h,r5,coe1,inf45,sup45,r4,A,B,infAB,supAB,l45];
% 10 arguments conf+config passed into the function
% conf=[RrTT(0,0,0),0.14,1,1,1,1,-1,1,1,1];
% %% plot simplified mockup
% figure(1)
% simplifiedmockup(conf,config(1),config(2),config(3),config(4),config(5),config(6),...
%      config(7),config(8),config(9),theta5,alpha43,h,r5,coe1,inf45,sup45,r4,A,B,infAB,supAB,l45,k1_b)
 figure(1)
% simplifiedmockupcareful(conf,config(1),config(2),config(3),config(4),config(5),config(6),...
%      config(7),config(8),config(9),theta5,alpha43,h,r5,coe1,inf45,sup45,r4,A,B,infAB,supAB,l45,k1_b)
figure(1)
 simplifiedmockupcarefulthreed(conf,config(1),config(2),config(3),config(4),config(5),config(6),...
     config(7),config(8),config(9),theta5,alpha43,h,r5,coe1,inf45,sup45,r4,A,B,infAB,supAB,l45,k1_b)

%  
% %% plot simplified mockup
conf=RrTT(0.2,0.2,-.1658203125); % merge this two different datatypes together to pass as single argument later.
config=[0.1599,1,1,1,1,1,1,1,1,theta5,alpha43,h,r5,coe1,inf45,sup45,r4,A,B,infAB,supAB,l45];

% figure(2)
% simplifiedmockup(conf,config(1),config(2),config(3),config(4),config(5),config(6),...
%      config(7),config(8),config(9),theta5,alpha43,h,r5,coe1,inf45,sup45,r4,A,B,infAB,supAB,l45,k1_b)
%
 figure(2)
simplifiedmockupcareful(conf,config(1),config(2),config(3),config(4),config(5),config(6),...
     config(7),config(8),config(9),theta5,alpha43,h,r5,coe1,inf45,sup45,r4,A,B,infAB,supAB,l45,k1_b)

%  
%  %% plot simplified mockup
conf=RrTT(0.2,0.2,0.4); % merge this two different datatypes together to pass as single argument later.
config=[0.16,1,1,1,1,1,1,1,1,theta5,alpha43,h,r5,coe1,inf45,sup45,r4,A,B,infAB,supAB,l45];

% figure(3)
% simplifiedmockup(conf,config(1),config(2),config(3),config(4),config(5),config(6),...
%      config(7),config(8),config(9),theta5,alpha43,h,r5,coe1,inf45,sup45,r4,A,B,infAB,supAB,l45,k1_b)

 figure(4)
simplifiedmockupcareful(conf,config(1),config(2),config(3),config(4),config(5),config(6),...
     config(7),config(8),config(9),theta5,alpha43,h,r5,coe1,inf45,sup45,r4,A,B,infAB,supAB,l45,k1_b)

%% plot main mockup
% figure(5)
% Kschem(conf,config(1),config(2),config(3),config(4),config(5),config(6),...
%     config(7),config(8),config(9),theta5,alpha43,h,...
%     r5,coe1,inf45,sup45,r4,A,B,infAB,supAB,l45,k1_b,0,2)


