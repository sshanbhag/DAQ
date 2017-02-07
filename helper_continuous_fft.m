function helper_continuous_fft(data, Fs, plotHandle)
% Calculate FFT(data) and update plot with it. 

lengthOfData = length(data);
% next closest power of 2 to the length
nextPowerOfTwo = 2 ^ nextpow2(lengthOfData);

plotScaleFactor = 4;
% Plot is symmetric about n/2
plotRange = nextPowerOfTwo / 2;
plotRange = floor(plotRange / plotScaleFactor);

% Discrete Fourier Transform of data
yDFT = fft(data, nextPowerOfTwo);
h = yDFT(1:plotRange);
db_h = db(abs(h));
% Frequency range
freqRange = (0:nextPowerOfTwo-1) * (Fs / nextPowerOfTwo);
% Only plotting upto n/2 (as other half is the mirror image)
gfreq = freqRange(1:plotRange);

% Update the plot
set(plotHandle, 'ydata', db_h, 'xdata', gfreq);
drawnow;

end


