function ubc=get_boundary(u,param)
[nvar,nx]=size(u);
ubc=zeros(nvar,nx+2*param.gc);
switch param.bc
    case 'Neumann'
        for d=1:nvar
            ubc(d,1:param.gc)=u(d,1);
            ubc(d,param.gc+1:nx+param.gc)=u(d,:);
            ubc(d,nx+param.gc+1:nx+2*param.gc)=u(d,end);
        end
    case 'Periodic'
        for d=1:nvar
            ubc(d,1:param.gc)=u(d,nx-param.gc:nx-1);
            ubc(d,param.gc+1:nx+param.gc)=u(d,:);
            ubc(d,nx+param.gc+1:nx+2*param.gc)=u(d,2:param.gc+1);
        end
end
end