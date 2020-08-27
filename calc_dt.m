function dt=calc_dt(con,param)
global gas_gamma
if param.test==2
    dt=param.dx^(5/3);
else
    [rho,u,p]=con2prim(con);
    c=sqrt(gas_gamma*p./rho);
    maxeig=max(abs(u)+c);
    dt=param.cfl*param.dx/maxeig;
end
end