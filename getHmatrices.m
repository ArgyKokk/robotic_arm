function[H10,H20,H30] = getHmatrices(q,L)
    %set initial H matrices at qi = 0
    H10_0 = [eye(3), [0;0; L(1)]; [0,0,0,1]];
    H21_0 = [eye(3), [0;0; L(2)]; [0,0,0,1]];
    H32_0 = [eye(3), [0;0; L(3)]; [0,0,0,1]];
    
    %taking the twists at the initial configuration
    InitialTwists = getUnitTwist();
  
    %taking the tilde twists for the 3 DOFs
    tildeTwist10 = tildeTwist(InitialTwists{1});
    tildeTwist21 = tildeTwist(InitialTwists{2});
    tildeTwist32 = tildeTwist(InitialTwists{3});
    
    H10 = expm(tildeTwist10*q(1))*H10_0;
    H20 = H10*expm(tildeTwist21*q(2))*H21_0;
    H30 = H20*expm(tildeTwist32*q(3))*H32_0;
end