function RrTT= RrTT(anglex,angley,anglez)
RrTT=Rz(anglex)*Ry(angley)*Rz(anglez);
end
% RrTT was changed because as it was it implied a 
%rotation around e3 that remained in the terminal 
%after the rotation with respect to the new e2. 
%So it should be like rotating the terminal with respect to 
%any new e2 axis in the initial e1-e2 plane, and then rotating around the new e3.