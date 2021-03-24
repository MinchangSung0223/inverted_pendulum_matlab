clear;
close all;
global J
global L
global m
global M
global k
global g
m = 0.1
M=1
k=0.1
J=0.008
g = 9.81
L = 0.5
EndTime = 10


Sampling_Frequency = 100
N = EndTime*Sampling_Frequency
s_time = 1/Sampling_Frequency

ts = linspace(0,EndTime,N)
dt = 1/Sampling_Frequency
theta_list = linspace(0,pi/2,N)
n = 1;
x_state = [0.01,0,0,0];
desired_x =0;
desired_th = 0;
u = 0;
R = 1
D = (J+m*L^2)*(m+M)-m^2*L^2;
A = [0 1 0 0 ;...
     m*g*L*(M+m)/D 0 0 m*L*k/D;...
     0 0 0 1;...
     -(m^2*L^2*g)/D 0 0 -k*(m*L^2+J)/D];
 B = [0; -L*m/D ;0 ;(m*L^2+J)/D];
 C = [1 0 0 0; 0 0 1 0];
 G = -B*B';
 Q = C'*C;
 [P,K1,L1] = icare(A,[],Q,[],[],[],G); % P is Riccati Equation Solution
 data = []
figure
prev_y = [0,0];
for t_proc =ts
    
    [t,x_plant] = ode45(@(t,x_plant) InvertedPendulumDynamics(t,x_state,u),[0, s_time] , [x_state(1); x_state(2);x_state(3); x_state(4)] );  
    x_state = x_plant(end,:);
    y = [1 0 0 0; 0 0 1 0 ]*x_state' ;
    x = y(2);
    th = y(1);
    u = -inv(R)*B'*P*x_state'; % LQR
%     u = cos(x_state(1))*x_state(3);
    draw_robot(x,th);
 
    data(1,n) = t_proc;
    data(2,n) = x_state(1);
    data(3,n) = x_state(3);
    data(4,n) = u;

    n=n+1;
end
subplot(3,1,1)
plot(data(1,:),data(2,:))
subplot(3,1,2)
plot(data(1,:),data(3,:))
subplot(3,1,3)
plot(data(1,:),data(4,:))
