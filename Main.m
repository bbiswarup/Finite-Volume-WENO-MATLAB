% Define some parameters
param.test=1; % Sod tube = 1
param.nx=200; % Number of grids
param.rk_method='SSP3'; % ODE solver
param.bc='Neumann'; % Boundary condition
param.gc=3; % Number of ghost cell on each side

tic
[U,param]=Euler1D(param); % Main solver
toc

[rho,u,p]=con2prim(U); % getting primitive variables
%%
fprintf('Result is ready. Ploting...\n')
plot(param.x,rho,'-s');legend('WENO-JS');xlabel('x');ylabel('\rho');
save solution