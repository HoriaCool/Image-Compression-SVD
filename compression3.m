function [A_k S] = compression3(image_path, k)
  A = double(imread(image_path));
  [m n] = size(A);

  miu = sum(A')' / n;
  A -= miu;
  Z = A * A' / (n - 1);

  [V S] = eig(Z);
  [S perm] = sort(diag(S), 'descend');
  S = diag(S);
  V = V(:, perm);

  W = V(:, 1: k);
  Y = W' * A;
  A_k = W * Y + miu;
end
