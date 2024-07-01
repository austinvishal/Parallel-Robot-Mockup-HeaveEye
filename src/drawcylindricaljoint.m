function drawcylindricaljoint(axis,point,offset, radius,sections,NP)
% t=-3*pi:4*pi;
% x=3*sin(t);
% y=t;
% z=3*cos(t);
% tubeplot(x,y,z,1.2+sin(t),t,80)
t=offset-sections:offset+sections;
x=point(1)+axis(1)*t;
y=point(2)+axis(2)*t;
z=point(3)+axis(3)*t;
tubeplot(x,y,z,radius,t,NP)
end