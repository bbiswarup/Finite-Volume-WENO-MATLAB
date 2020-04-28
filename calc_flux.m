function F= calc_flux(u,d)
global gas_gamma
F=zeros(3,1);
rho=u(1);
v = u(2)./u(1);
p = (u(3)-0.5*rho.*v.^2)*(gas_gamma-1);

if d == 1
    F(1) = rho.* v;
    F(2) = F(1).*v+p;
    F(3) = v.*(u(3)+p);
else
    
end
end