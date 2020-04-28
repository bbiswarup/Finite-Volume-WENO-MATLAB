function fbar=flux_average(ul,ur,d)
 fl= calc_flux(ul,d);
 fr= calc_flux(ur,d);
fbar=0.5*(fl+fr);
end
