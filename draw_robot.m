function draw_robot(x,theta)
global L;
plot(0,-1,'k.')
hold on;
grid on;
line([x,x+L*cos(theta+pi/2)],[0,L*sin(theta+pi/2)])
drawCircle(x+L*cos(theta+pi/2),L*sin(theta+pi/2),0.1)
rectangle('Position',[x-0.5 -0.5 1 0.5])
axis([-5,5,-1,5])
daspect([1,1,1])
drawnow;
hold off;
end