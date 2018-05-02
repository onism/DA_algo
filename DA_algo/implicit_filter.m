function [ output_args ] = implicit_filter(Q,R,H, meas,d,init_x)
%  input:
%  Q: process noise matrix
%  R: measurement noise matrix
%  H: measurement matrix
%  meas: measurements
%  init_x: initial particles
%  d: state dime
% output:
%  author: junjie wang

Sigma = inv(Q) + H' * inv(R) * H;
invK = inv(H*Q*H'+R);










    function out = F_k_argmin(xp,y)
        out =  Sigma * inv(Q) * state_propagation(xp, theta, dt) + H' * inv(R)*y;
    end

end

