% sessionai_continuous.m
% script to illustrate key elements of DAQ toolbox session interface
% for continuous analog input from one channel
%
% this example uses the windows directsound driver to collect data from 
% channel 1 at 50 kHz sample rate for 10 seconds

%% some settings
% sample rate (samples/sec)
Fs = 50000;
% time to collect data (seconds)
AcqDur = 10;

%% check hardware
if ~exist('allDev', 'var')
	fprintf('detecting DAQ devices...\n');
   allDev = daq.getDevices;
elseif isvalid(allDev)
	fprintf('Using existing allDev..\n');
end
% This returns a list of possible devices.  For standard directsound:
% allDev = 
% 
% Data acquisition devices:
% 
% index   Vendor    Device ID                      Description                     
% ----- ----------- --------- -----------------------------------------------------
% 1     directsound Audio0    DirectSound Primary Sound Capture Driver
% 2     directsound Audio1    DirectSound Microphone (High Definition Audio Device)
% 3     directsound Audio2    DirectSound Primary Sound Driver
% 4     directsound Audio3    DirectSound Speakers (High Definition Audio Device)

%% Use the microphone input (index 2 or Audio1)
inputDev = allDev(1);
% inputDev = 
% 
% directsound: DirectSound Microphone (High Definition Audio Device) (Device ID: 'Audio1')
%    Audio input subsystem supports:
%       -1.0 to +1.0  range
%       Rates from 80.0 to 1000000.0 scans/sec
%       2 channels ('1','2')
%       'Audio' measurement type

%% Start Session
fprintf('Creating Session\n');
% create audio session
S = daq.createSession('directsound');
% add audio input channel
fprintf('Adding Audio Input Channel Session\n');
addAudioInputChannel(S, inputDev.ID, 1);
% make session continuous
fprintf('Setting input to continuous, sampling rate to %d\n', Fs);
S.IsContinuous = true;
% set sample rate
S.Rate = Fs;

%% Create processing, initialize plots, helper, etc.
% set up plot for live FFT
fprintf('Setting plot, listener callback\n');
H = figure;
hp = plot(zeros(1000, 1));
T = title('Discrete FFT Plot');
xlabel('Frequency (Hz)');
ylabel('Y(f) (dB)');
grid on;
% add data available listener function handle
%	listener updates figure with FFT of input signal
plotFFT = @(src, event) helper_continuous_fft(event.Data, src.Rate, hp);
hl = addlistener(S, 'DataAvailable', plotFFT);

%% start in Background
fprintf('Starting acquisition\n');
startBackground(S);
figure(H);

%% wait for AcqDur seconds
fprintf('Acquiring and plotting data for %d seconds\n', AcqDur);
pause(AcqDur);

%% clean up
fprintf('Cleaning up\n');
% stop session
stop(S);
S.IsContinuous = false;
delete(hl);
% release hardware
release(S);
% reset
daqreset
% clear
clear S allDev inputDev



