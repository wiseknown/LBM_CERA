% Size of media
m = 4; %x coord
n = 5; %y coord
o = 4; %z coord

dis_velo = 19; %discrete velocities
dimen = 3;     %dimension
u0 = 0.9;

[f_nodes,Logic_M] = ReadMedia('media_test.csv',m,n,o);
% meq is the equilibrium in the momentum space (not distribution
% function)
[f,meq,vel,rho,cx,cy,cz] = VarSetUp(f_nodes,dis_velo,dimen);
[vel{1}] = SetPlaneValue('xy1',u0,vel{1},m,n,o,Logic_M);

[meq] = Equilibrium(meq,rho,vel,dis_velo,dimen,'MRT-GS');
[M,Minv] = MRT_Matrix(dimen,dis_velo,'MRT-GS');
[f] = StdInitialization(f,meq,'MRT-GS',Minv);
%[f,eq,u,v,rho,cx,cy] = VarSetUp(5,5,2,9);
%[M,Minv] = MRT_Matrix(2,9,'MRT-GS');
%[u] = SetVelocityField('Input Velocity',0.1,u,5,5);
%[eq] = Equilibrium(eq,rho,u,v,2,9,'MRT-GS');
%[f] = StdInitialization(f,eq,'MRT-GS',2,Minv);


% s_0 to s_6 -> Liu et al. (2014) doi: j.ijheatmasstransfer.2014.02.047
% s_7 and s_8 belongs to [0.89,1.17] doi: 10.1016/j.jcp.2014.10.038
% This interval is optimal but not exclusive

%S = [1.0; 1.1; 1.1; 1.0; 1.2; 1.0; 1.2; 1.0; 1.0];
%S = SetCollider(S,5,5);

%iter = 1;

%Main Loop
% while iter > 2
%     MM = Momentum(2,9,f,M);
%     % rho index 1
%     % u index 4
%     % v index 6
%     eq = Equilibrium(eq,MM(1,:),MM(4,:),MM(6,:),'MRT-GS');
%     f = CollesionMRT2D(eq,S,MM,Minv);
%     f = Streaming(f,9,cx,cy,5,5);
%     f = ReArraging(f,9,5,5);
%     iter = iter + 1;
% end