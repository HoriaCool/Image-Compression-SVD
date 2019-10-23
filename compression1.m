function [A_k S] = compression1(image_path, k)
  image_matrix = double(imread(image_path));

  [U Sigma V] = svd(image_matrix);
  Uc = U(:, 1: k);
  Sigmac = Sigma(1: k, 1: k);
  Vc = V(:, 1: k);
  
  A_k = Uc * Sigmac * Vc';
  S = Sigma;
end
