function dxdt = InvertedPendulumDynamics(t,x,u)
    global J
    global L
    global m
    global M
    global k
    global g
    
    D = (J+m*L^2)*(m+M)-m^2*L^2*cos(x(1));
    dxdt = [x(2);1/D*((m+M)*m*g*L*sin(x(1))-m*L*cos(x(1))*(u+m*L*x(2)^2*sin(x(1))-k*x(4)));x(4);1/D*(-m^2*L^2*g*sin(x(1))*cos(x(1))+(J+m*L^2)*(u+m*L*x(2)^2*sin(x(1))-k*x(4)))]
end