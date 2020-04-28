function unew = euler_forwardstep(u,h,param)
uold=get_boundary(u,param);
flux=zeros(param.nvar, param.nx+1);
for k=param.gc+1:param.nx+param.gc+1
    ul=zeros(param.nvar,1);
    ur=zeros(param.nvar,1);
    for d=1:param.nvar
        ul(d) = weno5(uold(d,k-3),uold(d,k-2),uold(d,k-1),uold(d,k),uold(d,k+1));
        ur(d) = weno5(uold(d,k+2),uold(d,k+1),uold(d,k),uold(d,k-1),uold(d,k-2));
    end
    flux(:,k-param.gc)=numflux(ul,ur,1);   
end
unew=u-(h/param.dx)*diff(flux,[],2);
end