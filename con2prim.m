function [rho,u,p]=con2prim(U)
global gas_gamma
rho=U(1,:);
u = U(2,:)./U(1,:);
p = (gas_gamma-1)*(U(3,:)-0.5*rho.*u.^2);
end