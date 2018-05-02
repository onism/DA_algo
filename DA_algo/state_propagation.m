function [ Xk1 ] = state_propagation( Xk, theta, dt)
 
Xk1 = zeros(size(Xk));
Xk1(1) = Xk(1) + theta(1) * (Xk(2) - Xk(1))*dt;
Xk1(2) = Xk(2) + (Xk(1) * (theta(2) - Xk(3)) - Xk(2))*dt;
Xk1(3) = Xk(3) + (Xk(1)*Xk(2) - theta(3)*Xk(3))*dt;
end

