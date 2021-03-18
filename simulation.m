
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

Sampling_Frequency = 100
N = EndTime*Sampling_Frequency
s_time = 1/Sampling_Frequency
EndTime = 2
ts = linspace(0,EndTime,N)
dt = 1/Sampling_Frequency
theta_list = linspace(0,pi/2,N)
n = 1;
x_state = [pi,0,0,0];
for t_proc =ts
    u = 1
    [t,x_plant] = ode45(@(t,x_plant) InvertedPendulumDynamics(t,x_state,u),[0, s_time] , [x_state(1); x_state(2);x_state(3); x_state(4)] );  
    x_state = x_plant(end,:);
    x = x_state(3);
    th = x_state(1);
    
    draw_robot(x,th);
    
    n=n+1;
end