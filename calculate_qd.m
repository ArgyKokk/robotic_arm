function velocity = calculate_qd(q,pset,L)
  [H10,H20,H30] = getHmatrices(q,L);
   H = {H10,H20,H30};
   J = getJacobian(q,L);
   %set a gain
   Ku = 10;
   
   %take the pee
   p30 = H{3}(1:3,4);
   pee = p30;
   pee_dot = Ku * (pset - pee);
   
   %safety check
   if norm(pee_dot)>10
        pee_dot = 10*(pee_dot/norm(pee_dot));
   end
   
   %set the new Homogeneous matrix H40
   H40 = [eye(3), p30 ; [0 0 0 1]];
   
   %take the inverse of H40 using the known property
   H04 = [eye(3), -p30 ; [0 0 0 1]];
   
   %calculate the adjoint H04 for the new Jacobian
   Ad04 = [H04(1:3,1:3) , zeros(3) ; tilde(H04(1:3,4))*H04(1:3,1:3) , H04(1:3,1:3)];
   
   Jnew = cell(size(J));
   Jnew{1} = Ad04*J{1};
   Jnew{2} = Ad04*J{2};
   Jnew{3} = Ad04*J{3};
   
 Ju = [Jnew{1}(4:6) , Jnew{2}(4:6) , Jnew{3}(4:6) ];
 
 %find pseudo inverse and the velocity
 velocity = pinv(Ju) * pee_dot
end