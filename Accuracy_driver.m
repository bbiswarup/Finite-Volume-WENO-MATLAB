% Define some parameters
param.test=2; % Sod tube = 1
param.rk_method='SSP3'; % ODE solver
param.bc='Periodic'; % Boundary condition
param.gc=3; % Number of ghost cell on each side
ntable=4;
[L1_error,Linf_error,L1_order,Linf_order]=deal(zeros(1,ntable)); % pre-allocate memory
disp('% accuracy table')
for k=1:ntable
    param.nx= 20*2^(k-1); % Number of grids
    [U,param]=Euler1D(param); % Main solver
    [rho,u,p]=con2prim(U); % getting primitive variables
    
    P_exact=param.exact_sol(param.x,param.tf);
    rho_exact=P_exact(1,:);
    L1_error(k)=(1/param.nx)*vecnorm(rho_exact-rho,1);
    Linf_error(k)=vecnorm(rho_exact-rho,Inf);
    if k==1
        L1_order(k)=0.0;
        Linf_order(k)=0.0;
%         disp('%% Exporting latex table format of accuracy test')
%         disp('\begin{table}[htb!]')
%         disp('\centering')
%         disp('\begin{tabular}{ccccc}')
%         disp('\hline ')
%         fprintf(' N  & $L^\\infty$ error  &  Order &    $L^1$ error    & Order \\\\ \n')
%         disp('\hline ')
        fprintf('%% N & Linf err & Order &  L1 err  & Order \\\\ \n')
        fprintf(' %d & %1.2E &  ...  & %1.2E & ...   \\\\ \n', param.nx, Linf_error(k), L1_error(k))
    else
        L1_order(k)=log2(L1_error(k-1)/L1_error(k));
        Linf_order(k)=log2(Linf_error(k-1)/Linf_error(k));
        fprintf(' %d & %1.2E &  %.2f & %1.2E & %.2f  \\\\ \n',param.nx,Linf_error(k), Linf_order(k), L1_error(k), L1_order(k))
    end
end
% disp('\hline ')
% disp('\end{tabular} ')
% disp('\caption{}')
% disp('\label{tab:}')
% fprintf('%% The solution of test %d at T=%.2f for CFL=%.2f. \n',param.test,param.tf,param.cfl)
% disp(['% It was exucuted through ',cd,' on ',date])
% disp('\end{table}')