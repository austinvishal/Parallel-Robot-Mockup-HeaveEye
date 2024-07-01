%draw a straight link
function drawstraightlink(P4,P5,vec,vecnorm, th1_r1, th1_z1, th1_r2, th1_z2)
vec=vecnorm_res(vec);
vetnorm=vecnorm_res(vecnorm);

P3i1= ([P4(1),P4(2),P4(3)] +vec*th1_r1+vetnorm*th1_z1);
P3ii1= ([P4(1),P4(2),P4(3)] -vec*th1_r1+vetnorm*th1_z1);
P3iii1= ([P4(1),P4(2),P4(3)] +vec*th1_r1-vetnorm*th1_z1);
P3iiii1= ([P4(1),P4(2),P4(3)] -vec*th1_r1-vetnorm*th1_z1);

P3i2= ([P5(1),P5(2),P5(3)] +vec*th1_r2+vetnorm*th1_z2);
P3ii2= ([P5(1),P5(2),P5(3)] -vec*th1_r2+vetnorm*th1_z2);
P3iii2= ([P5(1),P5(2),P5(3)] +vec*th1_r2-vetnorm*th1_z2);
P3iiii2= ([P5(1),P5(2),P5(3)] -vec*th1_r2-vetnorm*th1_z2);

l4=plot3([P3i2(1),P3i2(2),P3i2(3)],[P3ii2(1),P3ii2(2),P3ii2(3)],...
    [P3iiii2(1),P3iiii2(2),P3iiii2(3)],[P3iii2(1),P3iii2(2),P3iii2(3)],...
    [P3i2(1),P3i2(2),P3i2(3)],[P3i1(1),P3i1(2),P3i1(3)],...
    [P3ii1(1),P3ii1(2),P3ii1(3)],[P3iiii1(1),P3iiii1(2),P3iiii1(3)],...
    [P3iii1(1),P3iii1(2),P3iii1(3)],[P3i1(1),P3i1(2),P3i1(3)],'Color' , 'k', 'LineWidth', 3);

l4_1=plot3([P3iiii2(1),P3iiii2(2),P3iiii2(3)],[P3iii2(1),P3iii2(2),P3iii2(3)],...
    [P3iiii1(1),P3iiii1(2),P3iiii1(3)],[P3iii1(1),P3iii1(2),P3iii1(3)],'Color' , 'k', 'LineWidth', 3);
l4_2=plot3([P3i2(1),P3i2(2),P3i2(3)],[P3ii2(1),P3ii2(2),P3ii2(3)],...
    [P3i1(1),P3i1(2),P3i1(3)],[P3ii1(1),P3ii1(2),P3ii1(3)],'Color' , 'k', 'LineWidth', 3);
l4_3=plot3([P3i2(1),P3i2(2),P3i2(3)],[P3iii2(1),P3iii2(2),P3iii2(3)],...
    [P3i1(1),P3i1(2),P3i1(3)],[P3iii1(1),P3iii1(2),P3iii1(3)],'Color' , 'k', 'LineWidth', 3);
l4_4=plot3([P3iiii2(1),P3iiii2(2),P3iiii2(3)],[P3ii2(1),P3ii2(2),P3ii2(3)],...
    [P3iiii1(1),P3iiii1(2),P3iiii1(3)],[P3ii1(1),P3ii1(2),P3ii1(3)],'Color' , 'k', 'LineWidth', 3);
end