[x1, fs] = audioread('../Experiment/anger_ref.wav');
[x2, fs] = audioread('../Experiment/sad_ref.wav');

[ref, mid, quiet] = IntensityLevel(x1, fs);
audiowrite('angry/final_files/anger_ref.wav', ref, fs);
audiowrite('angry/final_files/anger_intensity-level_mid.wav', mid, fs);
audiowrite('angry/final_files/anger_intensity-level_down.wav', quiet, fs);

[ref, mid, quiet] = IntensityLevel(x2, fs);
audiowrite('sad/final_files/sad_ref.wav', ref, fs);
audiowrite('sad/final_files/sad_intensity-level_mid.wav', mid, fs);
audiowrite('sad/final_files/sad_intensity-level_down.wav', quiet, fs);