function U=time_step(U0,h,param)
switch param.rk_method % options o1, SSP2,SSP3, SSP45
    case 'SSP3'
        % stage 1
        U = euler_forwardstep(U0,h,param);
        % stage 2
        Ui = euler_forwardstep(U,h,param);
        U = (1/4)*(3*U0+Ui);
        % stage 3
        Ui = euler_forwardstep(U,h,param);
        U = (1/3)*(U0+2*Ui);
end