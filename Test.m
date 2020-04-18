[f,eq,u,v,rho,cx,cy] = VarSetUp(5,5,2,9);
[M,Minv] = MRT_Matrix(2,9,'MRT-GS');
%Std Initiallization
[u] = SetVelocityField('Input Velocity',0.1,u,5,5);
[eq] = Equilibrium(eq,rho,u,v,2,9,'MRT-GS');
[f] = StdInitialization(f,eq,'MRT-GS',2,Minv);
