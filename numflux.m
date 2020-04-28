function flux=numflux(ul,ur,d)
maxeigl=max_eig(ul,d);
maxeigr=max_eig(ur,d);
maxeig=max(maxeigl,maxeigr);
fbar=flux_average(ul,ur,d);
flux=fbar-0.5*maxeig*(ur-ul);
end