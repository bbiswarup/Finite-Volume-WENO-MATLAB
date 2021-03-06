function [U,P,param]=initial_conditions(param)
global gas_gamma
switch param.test
    case 1
        % Sod tube
        param.xmin=0;
        param.xmax=1;
        gas_gamma=1.4;
        param.dx=(param.xmax-param.xmin)/param.nx;
        param.x=param.xmin+0.5*param.dx:param.dx:param.xmax-0.5*param.dx;
        param.tf=0.2;
        param.tstep=param.tf/20;
        param.cfl=0.45;
        
        rhoL=1;
        uL=0;
        pL=1;
        
        rhoR=0.125;
        uR=0;
        pR=0.1;
        P =(param.x<=0.5).*[rhoL;uL;pL] + (param.x> 0.5).*[rhoR;uR;pR];
    case 2
        % smooth
        param.xmin=0;
        param.xmax=2;
        gas_gamma=1.4;
        param.dx=(param.xmax-param.xmin)/param.nx;
        param.x=param.xmin+0.5*param.dx:param.dx:param.xmax-0.5*param.dx;
        param.tf=2.0;
        param.tstep=param.tf/20;
        param.cfl=0.45;
        
        param.exact_sol=@(x,t) [1+0.2*sin(pi*(x-t));1+0.*x;1+0.*x];
        P=param.exact_sol(param.x,0);
        
end
U=prim2conVec(P);
end