function plot_compression1(image_path)
  %close all, clc;

  % image_matrix
  A = double(imread(image_path));
  [m n] = size(A);
  [~, S] = compression1(image_path, 1);

  k = [1: min(m, n)];
  % k = [1: 19];
  % k = [20: 20: 99];
  % k = [100: 30: min(m, n)];

  func = @(x) sum(diag(S(1: x, 1: x)));
  sg_val_info = arrayfun(func, k) / sum(diag(S));

  func = @(x) sum(sumsq(A - compression1(image_path, x))) / (m * n);
  approx_error = arrayfun(func, k);
  
  data_comp_rate = (m + n + 1) * k / (m * n);
  
  figure(1);
  plot(diag(S));
  title("Compression 1: The singular values ​​of the matrix A", "fontsize", 14);

  figure(2);
  plot(k, sg_val_info);
  title("Compression 1: Information given by the first k singular values", "fontsize", 14);

  figure(3);
  plot(k, approx_error);
  title("Compression 1: The approximation error for matrix A", "fontsize", 14);
  
  figure(4);
  plot(k, data_comp_rate);
  title("Compression 1: Data compression rate", "fontsize", 14);
end
