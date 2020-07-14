function tildeMatrix = tilde(arg)
  tildeMatrix = [0 -arg(3) arg(2);arg(3) 0 -arg(1);-arg(2) arg(1) 0];
end