% Weierstrass Audio Paradox.
% When doubling playback speed, change B to: 
% 2 for the same pitch
% 2^(13/12) for the pitch to be a semitone lower & simultaneously higher
% 2^(14/12) for the pitch to be a tone lower
% 2^(15/12) for the pitch to be three semitones lower
% 2^(24/12)=4 for the pitch to be ambiguous. Will be up to the listener's
%             personal perception if it's an octave higher or lower..

w=0;
% B = Geometric relationship value to change
B=2^(24/12);
P=12;
sampleRate = 22050;

duration = 2;
numsamples = duration*sampleRate;
t = (0:numsamples-1)'/sampleRate;

%Create Weierstrass W(t)
for i = 5:P
  w = w+cos((B^(i))*t);
end

% Normalise
w = 0.5.*w/max(abs(w));
% Play sound 
sound(w,sampleRate); 
pause(duration);
% Play sound at double the speed
sound(w,2*sampleRate);