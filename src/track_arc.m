% this function plots arc between two points in 3d space
function V = track_arc(x,y,z,acc)
v1 = [x(1:end-1);y(1:end-1);z(1:end-1)]; % Vector from center to 1st point
v2 = [x(2:end);y(2:end);z(2:end)]; % Vector from center to 2nd point
  r = sqrt(sum([x(1); y(1); z(1)].^2,1));
%    r1 = sqrt(sum([x(1); y(1); z(1)].^2,1));
%    r2 = sqrt(sum([x(2); y(2); z(2)].^2,1));
%    r=r2;
%   r=(r1+r2)/2;
% th1r=0.14/30;
% thlz=0.14/(2.5*30);
% k12 = vecnorm_res(cross(v1, v2));
  v3a = cross(cross(v1,v2),v1); % v3 lies in plane of v1 & v2 and is orthog. to v1
% v3a =  vecnorm_res(cross(cross(v1,v2),v1)); % v3 lies in plane of v1 & v2 and is orthog. to v1
% v3a =  vecnorm_res(cross(k12,v1)); % v3 lies in plane of v1 & v2 and is orthog. to v1

v3 = (r)*v3a./repmat(sqrt(sum(v3a.^2,1)),3,1); % Make v3 of length r
% Let t range through the inner angle between v1 and v2
%  tmax = atan2(sqrt(sum(cross(v1,v2).^2,1)),dot(v1,v2));
 tmax = atan2(sqrt(sum(cross(v1,v3).^2,1)),dot(v1,v3)); % note here we take the angle of the vector 1 and 3 instead of 2
% tmax=A;
V = zeros(3,sum(round(tmax*acc))); % preallocate
k = 0; % index in v
for i = 1:length(tmax)
    steps = round(tmax(i)*acc)+1; %Edited +1
    k = (1:steps) + k(end);
    t = linspace(0,tmax(i),steps);
%     V(:,k) = v1(:,i)*cos(t)+v2(:,i)*sin(t); % this marks arc till center
%     vector between two if the angle is taken between v1 and v2
%     V(:,k) = v1(:,i)*cos(t)+v3(:,i)*sin(t) ; %
    V(:,k) = v1(:,i)*cos(t)+v2(:,i)*sin(t) ; %  % this marks arc till center
%     vector between two if the angle is taken between v1 and v3
end
end