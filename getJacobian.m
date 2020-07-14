function J = getJacobian(q,L)
   unitTwists = getUnitTwist();
   [H10,H20,H30] = getHmatrices(q,L);
   H = {H10,H20,H30};
   J = cell(1,size(H,2));
   J{1} = unitTwists{1};
   
   R10 = H{1}(1:3,1:3);
   p_tilde10 = tilde(H{1}(1:3,4));
   Ad10 = [R10 zeros(3); p_tilde10*R10 R10];
   J{2} = Ad10*unitTwists{2};
   
   R20 = H{2}(1:3,1:3);
   p_tilde20 = tilde(H{2}(1:3,4));
   Ad20 = [R20 zeros(3); p_tilde20*R20 R20];
   J{3} = Ad20*unitTwists{3};
end