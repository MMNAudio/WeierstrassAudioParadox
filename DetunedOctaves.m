% Found this here https://dsp.stackexchange.com/questions/35690/double-the-speed-double-the-frequency 
% Detuning octaves a wee bit and playing back at double the speed; the perceived
% pitch goes down. Mad.

sampleRate = 44100;
numHarmonics = 10;
duration = 2;
% Starting frequency
f0 = 20;
% 'Detune' multiplier
multiplier = 2.05;

numSamples = duration*sampleRate;
t = (0:numSamples-1)'/sampleRate;

% Fundamental frequencies
x0 = sin(2*pi*f0*t);
f1 = f0;
% Add all harmonics
for i = 2:numHarmonics
  f1 = f1*multiplier;
  x0 = x0+sin(2*pi*f1*t);
end

% Normalise
x0 = 0.5.*x0/max(abs(x0));

sound(x0,sampleRate);
pause(duration);
% Play sound at double the speed - listen to the pitch go down
sound(x0,2*sampleRate);
