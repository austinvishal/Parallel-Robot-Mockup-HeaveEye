% this function is obtained from performing the loop closure of heave
% section and obtain psi_4 angle. The vectors are in end effector frame.
% h is the extrusion, platform orientation matrix is R

%% The function output is rotation matrix Ry as function of psi4P
function rotyP_4= compute_rotPfour(i,hh,H,h,r5,r4,l45)
%i is number of legs , the arguments are passed as vectors and indexed
%entity is evaluated for corresponding leg
L=hh+h(i);
M= r5(i);
N=((hh+h(i)).^2+r5(i).^2+r4(i).^2-l45(i).^2);
den= 2*((hh+h(i)).^2+r5(i).^2)*r4(i);
RAD = sqrt(-(-(r4(i)-l45(i)).^2+r5(i).^2+(hh+h(i)).^2)*(-(r4(i)+l45(i)).^2+r5.^2+(hh+h(i)).^2));
%-(r4-l45)^2 <r5^2+(hh+h)^2< -(r4+l45)^2, for the square root to exit, ie the argument is
% positive or null
c4=(N*L-H*M*RAD)/den;
s4=(N*L+H*M*RAD)/den;
rotyP_4=[c4(i) 0 s4(i)
          0 1 0
        -s4(i) 0 c4(i)];
end