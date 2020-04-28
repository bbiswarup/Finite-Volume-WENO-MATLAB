function U=prim2conVec(P)
global gas_gamma
U(1,:)=P(1,:);
U(2,:)=P(1,:).*P(2,:);
U(3,:)=0.5*P(1,:).*P(2,:).^2+P(3,:)/(gas_gamma-1);
end