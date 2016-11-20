function y = NormalizeIntensityLevel(x, fs)
  ref = 0.07;
  rms_x = rms(x);
  y = x .* (ref / rms_x);
end