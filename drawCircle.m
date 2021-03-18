function drawCircle(x,y,r)
    th = linspace(0,2*pi,10);
    plot(x+r*cos(th),y+r*sin(th),'r')
end