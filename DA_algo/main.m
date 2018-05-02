% author: junjie wang
% lorenz 63 model
clear
clc
close all
dbstop if error
d = 3;
theta = [10 28 8/3];
X_1 = [1.508870 -1.531271 25.460910];
dt = 0.02;
Tend = 3;
times = 0:dt:Tend;

x_true = zeros(d,length(times));
x_true(:,1) = X_1;
Q = 0.1 * eye(d);
H = [1,0,0; 0,0,1];
R = 1*eye(2);
for t = 2 : length(times)
   x_true(:,t) = state_propagation(x_true(:,t-1), theta, dt) + sqrtm(Q)*randn(d,1); 
end
meas = zeros(2, length(times));
for t = 1 : length(times)
    meas(:,t) = H * x_true(:,t) + sqrtm(R)*randn(2,1);
end
figure
plot3(x_true(1,:), x_true(2,:), x_true(3,:),'r-');


% begin filter
init_m = zeros(3,1);
init_P = 5 * eye(d);
N = 150;
init_x = X_1 + mvnrnd(init_m, init_P, N);

