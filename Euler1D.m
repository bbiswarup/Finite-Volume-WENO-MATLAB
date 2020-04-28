function [U,param]=Euler1D(param)
param.nvar=3;
[U,P,param]=initial_conditions(param);
fprintf('Solver is starting with the following parameters:\n')
disp(param)
t=0;
while t<param.tf
    dt=calc_dt(U,param);
    if (t+dt > param.tf)
        dt = param.tf - t;
    end
    U=time_step(U,dt,param);
    t=t+dt;
end
end