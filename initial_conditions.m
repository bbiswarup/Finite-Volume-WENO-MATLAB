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
end

P =(param.x<=0.5).*[rhoL;uL;pL] + (param.x> 0.5).*[rhoR;uR;pR];
U=prim2conVec(P);
end