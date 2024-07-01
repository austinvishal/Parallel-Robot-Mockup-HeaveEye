function []= DrawSpLink(Pt1, Pt2, color)
pt1=Pt1/norm(Pt1);
pt2=Pt2/norm(Pt2);
pts=[];
iter=50;
for i=0:iter
    pt=pt1+i*(pt2-pt1)/iter;
    pts(end+1,:)=pt/norm(pt);
end
plot3(pts(:,1),pts(:,2),pts(:,3),color,'linewidth',3);
end