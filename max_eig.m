function maxeig=max_eig(u,d)
global gas_gamma
rho=u(1);
v = u(2)./u(1);
p = (u(3)-0.5*rho.*v.^2)*(gas_gamma-1);
c=sqrt(gas_gamma*p./rho);
maxeig=max(abs(v)+c);
end