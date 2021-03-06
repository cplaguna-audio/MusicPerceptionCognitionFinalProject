function fix_audio(filename)
  filenames = {
    'sad_ref.wav'; ...
    'sad_intensity-level_mid.wav'; ...
    'sad_intensity-level_down.wav'; ...
    'sad_intensity-variability_down.wav'; ...
    'sad_intensity-variability_up.wav'; ...
    'sad_pitch-level_up.wav'; ...
    'sad_pitch-level_down.wav'; ...
    'sad_speech-rate_up.wav'; ...
    'sad_speech-rate_down.wav'};
  
  num_files = length(filenames);
  for file_idx = 1:num_files
    filename = filenames{file_idx}
    [x, fs] = audioread(['tmp/' filename]);
    y = NormalizeIntensityLevel(x);
    audiowrite(['fix/' filename], y, fs); 
  end
end