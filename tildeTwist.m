function t = tildeTwist(twist)
  omega = tilde(twist(1:3));
  t = [omega, twist(4:6); [0 0 0 0]];
end