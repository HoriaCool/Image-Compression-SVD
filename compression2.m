function [A_k S] = compression2(image_path, k)
  A = double(imread(image_path));
  [m n] = size(A);

  miu = sum(A')' / n;
  A -= miu;
  Z = A' / sqrt(n - 1);
  [U S V] = svd(Z);
  W = V(:, 1: k);
  Y = W' * A;
  A_k = W * Y + miu;
end
