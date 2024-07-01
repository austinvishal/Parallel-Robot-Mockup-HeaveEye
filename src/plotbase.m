function plotbase(P11,P12,P13,P14,BB)
% BB is a boolean for color selection, change it later.
% plot the pyramid base
% vert = [ -1 -1 0; 1 -1 0; 1 1 0; -1 1 0; 0 0 2; NaN NaN NaN];
vert = [ P11(1) P11(2) P11(3); P12(1) P12(2) P12(3); P13(1) P13(2) P13(3); P14(1) P14(2) P14(3); 0 0 0; NaN NaN NaN];
faces = [1 2 5 NaN; 2 3 5 NaN; 3 4 5 NaN; 4 1 5 NaN; 1 2 3 4];
if BB==0
    rgb = [ 1 0 0; 1 1 0; 0 1 0; 0 0 1; 1 0 1];
else BB==1
   rgb = [ 1 0 0; 1 1 0; 0 1 0; 0 0 1; 1 0 1]; 
end
patch('Vertices',vert,'Faces',faces,'FaceVertexCData',rgb,'FaceColor','flat');
% axis equal
% grid
% view(60,15);
end