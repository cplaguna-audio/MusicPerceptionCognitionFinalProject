function run_analysis(emotion)
  colnames = { ...
    'Mid Intensity Level'; ...
    'Low Intensity Level'; ...
    'Low Intensity Variability'; ...
    'High Intensity Variability'; ...
    'Low Pitch'; ...
    'High Pitch'; ...
    'Low Speech Rate'; ...
    'High Speech Rate'; ...
    'Reference'};
  data = xlsread([emotion '_results.xlsx']);
  
  num_cols = size(colnames, 1);
  
  
  data_dif = data(:, 1:8) - repmat(data(:, 9), 1, 8);
%   figure;
%   boxplot(data_dif, 'labels', {colnames{1:8}});
%   title('dif boxplots');
%   return;
  means = zeros(num_cols, 1);
  stds = zeros(num_cols, 1);
  for col_idx = 1:num_cols
    colname = colnames{col_idx};
    disp(colname);
    cur_data = data(:, col_idx);
    
    means(col_idx) = mean(cur_data);
    stds(col_idx) = std(cur_data);
  end
%   
%   figure();
%   boxplot(data, 'labels', colnames);
%   title('Test');
  figure;
  plot(means);
  title(['Mean for ' emotion]);

  figure;
  plot(stds);
  title(['Std for ' emotion]);

  num_pairs = num_cols - 1;
  dif_means = zeros(num_pairs, 1);
  dif_stds = zeros(num_pairs, 1);
  utest_pvals = zeros(num_pairs, 1);
  
  ref_idx = num_cols;
  ref_data = data(:, ref_idx);
  for col_idx = 1:num_pairs
    colname = colnames{col_idx};
    disp(colname);
    cur_data = data(:, col_idx);
    
    utest_pvals(col_idx) = ranksum(cur_data, ref_data);
    
    difs = cur_data - ref_data;
    dif_means(col_idx) = mean(difs);
    dif_stds(col_idx) = std(difs);
  end
  
  figure;
  plot(dif_means);
  title(['Mean of difference from ref for ' emotion]);

  figure;
  plot(dif_stds);
  title(['Std of difference from ref for ' emotion]);
  
  figure;
  plot(utest_pvals);
  title(['u-test p-vals for ' emotion]);

end