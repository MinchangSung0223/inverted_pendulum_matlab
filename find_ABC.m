syms("x%d",[1 4],"real")
syms u
syms m M J L g k
assume([u m M J L g],"real")


D = (J+m*L^2)*(m+M)-m^2*L^2*cos(x1);

f = [x2;...
    1/D*((m+M)*m*g*L*sin(x1)-m*L*cos(x1)*(m*L*x2^2*sin(x1)-k*x4));...
    x4;...
    1/D*(-m^2*L^2*g*sin(x1)*cos(x1)+(J+m*L^2)*(m*L*x2^2*sin(x1)-k*x4))]


fu = [0;...
      -1/D*m*L*cos(x1)*u;...
      0;...
      1/D*(J+m*L^2)*u]

x = [x1 ;x2; x3; x4]

A = jacobian(f,x);
B = jacobian(fu,u);


x10 = 0
x20 = 0
x30 = 0
x40 = 0
u0 = 0;
Equilibrium_point = [x10,x20,x30,x40,u0];

A = subs(A,{x1 x2 x3 x4,u},Equilibrium_point);
B = subs(B,{x1 x2 x3 x4,u},Equilibrium_point);

C = [1 0 0 0; 0 0 1 0];
