close all
clear
format long g
dt=0.0001; %設定每張圖的時間間隔，單位為秒
phi=linspace(0,-3.2/180*pi,60);theta=linspace(0,3.4/180*pi,60);
phi1=linspace(phi(end),3.2/180*pi,60);theta1=linspace(theta(end),-5.2/180*pi,60);
phi2=linspace(phi1(end),0/180*pi,60);theta2=linspace(theta1(end),0/180*pi,60);
phi=[phi phi1 phi2];
theta=[theta theta1 theta2];
b1=floor([20*cos(90*pi/180) 20*sin(90*pi/180) 0])';
b2=[20*cos(210*pi/180) 20*sin(210*pi/180) 0]';
b3=[20*cos(330*pi/180) 20*sin(330*pi/180) 0]';
a=14;s=12;
for i = 1:length(phi),
    prb=[cos(theta(i)) sin(phi(i))*sin(theta(i)) sin(theta(i))*cos(phi(i));0 cos(phi(i)) -sin(phi(i));-sin(theta(i)) cos(theta(i))*sin(phi(i)) cos(theta(i))*cos(phi(i))];
    q1=[0 0 20]'+prb*b1;
    q2=[0 0 20]'+prb*b2;
    q3=[0 0 20]'+prb*b3;
    
    l1=q1-b1;
    l2=q2-b2;
    l3=q3-b3;
    xq=[q1(1) q2(1) q3(1)]';
    zq=[q1(3) q2(3) q3(3)]';
    xb=[b1(1) b2(1) b3(1)]';
    zb=[b1(3) b2(3) b3(3)]';
    l=[norm(l1) norm(l2) norm(l3)]';
    L=l.^2-(s^2-a^2);
    M=2*a*(zq-zb);
    N=2*a*(xq-xb);
    alpha=asin(L./((M.^2+N.^2).^0.5))-atan(N./M);
    lb=[b1(1:2)/20 b2(1:2)/20 b3(1:2)/20]';
    la=[lb(:,1).*(20+a*cos(alpha)) lb(:,2).*(20+a*cos(alpha)) a*sin(alpha)]';
    %alpha=alpha*180/pi;
    xq=[q1(1) q2(1) q3(1) q1(1)]';
    yq=[q1(2) q2(2) q3(2) q1(2)]';
    zq=[q1(3) q2(3) q3(3) q1(3)]';
    xb=[b1(1) b2(1) b3(1) b1(1)]';
    yb=[b1(2) b2(2) b3(2) b1(2)]';
    zb=[b1(3) b2(3) b3(3) b1(3)]';
    plot3(xb,yb,zb,'b');
    hold on
    plot3(xq,yq,zq,'r');
    hold on
    lex=[xq(1) xb(1) xq(2) xb(2) xq(3) xb(3)];
    ley=[yq(1) yb(1) yq(2) yb(2) yq(3) yb(3)];
    lez=[zq(1) zb(1) zq(2) zb(2) zq(3) zb(3)];
    lax=[la(1,1) xb(1) la(1,2) xb(2) la(1,3) xb(3)];
    lay=[la(2,1) yb(1) la(2,2) yb(2) la(2,3) yb(3)];
    laz=[la(3,1) zb(1) la(3,2) zb(2) la(3,3) zb(3)];
    lqx=[la(1,1) xq(1) la(1,2) xq(2) la(1,3) xq(3)];
    lqy=[la(2,1) yq(1) la(2,2) yq(2) la(2,3) yq(3)];
    lqz=[la(3,1) zq(1) la(3,2) zq(2) la(3,3) zq(3)];
    plot3(lqx(1:2),lqy(1:2),lqz(1:2),'g',lqx(3:4),lqy(3:4),lqz(3:4),'g',lqx(5:6),lqy(5:6),lqz(5:6),'g');
    hold on
    plot3(lax(1:2),lay(1:2),laz(1:2),'m',lax(3:4),lay(3:4),laz(3:4),'m',lax(5:6),lay(5:6),laz(5:6),'m');
    hold on
    plot3(lex(1:2),ley(1:2),lez(1:2),':k',lex(3:4),ley(3:4),lez(3:4),':k',lex(5:6),ley(5:6),lez(5:6),':k') ;
    hold on
    text(lax(1)-(lax(1)-lax(2))/2, lay(1)-(lay(1)-lay(2))/2, laz(1)-(laz(1)-laz(2))/2, num2str(norm([lax(2)-lax(1) lay(2)-lay(1) laz(2)-laz(1)])));
    text(lax(3)-(lax(3)-lax(4))/2, lay(3)-(lay(3)-lay(4))/2, laz(3)-(laz(3)-laz(4))/2, num2str(norm([lax(3)-lax(4) lay(3)-lay(4) laz(3)-laz(4)])));
    text(lax(5)-(lax(5)-lax(6))/2, lay(5)-(lay(5)-lay(6))/2, laz(5)-(laz(5)-laz(6))/2, num2str(norm([lax(5)-lax(6) lay(5)-lay(6) laz(5)-laz(6)])));
    
    text(xq(1)-(xq(1)-xq(2))/2, yq(1)-(yq(1)-yq(2))/2, zq(1)-(zq(1)-zq(2))/2, num2str(norm([xq(2)-xq(1) yq(2)-yq(1) zq(2)-zq(1)])));
    text(xq(2)-(xq(2)-xq(3))/2, yq(2)-(yq(2)-yq(3))/2, zq(2)-(zq(2)-zq(3))/2, num2str(norm([xq(2)-xq(3) yq(2)-yq(3) zq(2)-zq(3)])));
    text(xq(3)-(xq(3)-xq(1))/2, yq(3)-(yq(3)-yq(1))/2, zq(3)-(zq(3)-zq(1))/2, num2str(norm([xq(3)-xq(1) yq(3)-yq(1) zq(3)-zq(1)])));

    text(lqx(1)-(lqx(1)-lqx(2))/2, lqy(1)-(lqy(1)-lqy(2))/2, lqz(1)-(lqz(1)-lqz(2))/2, num2str(norm([lqx(2)-lqx(1) lqy(2)-lqy(1) lqz(2)-lqz(1)])));
    text(lqx(3)-(lqx(3)-lqx(4))/2, lqy(3)-(lqy(3)-lqy(4))/2, lqz(3)-(lqz(3)-lqz(4))/2, num2str(norm([lqx(3)-lqx(4) lqy(3)-lqy(4) lqz(3)-lqz(4)])));
    text(lqx(5)-(lqx(5)-lqx(6))/2, lqy(5)-(lqy(5)-lqy(6))/2, lqz(5)-(lqz(5)-lqz(6))/2, num2str(norm([lqx(5)-lqx(6) lqy(5)-lqy(6) lqz(5)-lqz(6)])));
    
    axis([-30 30 -30 30 -10 30]);
    view(15,-15);
    drawnow
    [image,map]=frame2im(getframe(gcf));
    [im,map2]=rgb2ind(image,256);
    if i==1
        imwrite(im,map2,'move_pic.gif','gif','writeMode','overwrite','DelayTime',dt,'Loopcount',inf);
    else
        imwrite(im,map2,'move_pic.gif','gif','writeMode','append','DelayTime',dt);
    end
    hold off;
end
%close all