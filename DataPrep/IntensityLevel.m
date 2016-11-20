function [y1, y2, y3] = IntensityLevel(x, fs)
  ref = 0.07;
  MID_DB = -7;
  SOFT_DB = MID_DB * 2;
  
  mid_rms = ref * 10^(MID_DB / 20);
  soft_rms = ref * 10^(SOFT_DB / 20);
  
  rms_x = rms(x);
  
  y1 = x .* (ref / rms_x);
  y2 = x .* (mid_rms / rms_x);
  y3 = x .* (soft_rms / rms_x);
end