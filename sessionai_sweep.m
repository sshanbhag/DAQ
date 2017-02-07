% sessionai_sweep.m
% script to illustrate key elements of DAQ toolbox session interface
% for 1 "sweep" of analog input from one channel
%
% this example uses the windows directsound driver to collect data from 
% channel 1 at 50 kHz sample rate for 2 seconds

%% some settings
% sample rate (samples/sec)
Fs = 50000;
% time to collect data (seconds)
AcqDur = 1;


%% check hardware
if ~exist('allDev', 'var')
	fprintf('detecting DAQ devices...\n');
   allDev = daq.getDevices;
elseif isvalid(allDev)
	fprintf('Using existing allDev..\n');
end
% This returns a list of possible devices.  For standard directsound:
% allDev = 
% Data acquisition devices:
% 
% index   Vendor    Device ID                      Description                     
% ----- ----------- --------- -----------------------------------------------------
% 1     directsound Audio0    DirectSound Primary Sound Capture Driver
% 2     directsound Audio1    DirectSound Microphone (High Definition Audio Device)
% 3     directsound Audio2    DirectSound Primary Sound Driver
% 4     directsound Audio3    DirectSound Speakers (High Definition Audio Device)

%% Use the microphone input (index 2 or Audio1)
inputDev = allDev(2);
fprintf('Using input %s\n', inputDev.ID);
% inputDev = 
% directsound: DirectSound Microphone (High Definition Audio Device) 
% (Device ID: 'Audio1')
%    Audio input subsystem supports:
%       -1.0 to +1.0  range
%       Rates from 80.0 to 1000000.0 scans/sec
%       2 channels ('1','2')
%       'Audio' measurement type

%% Start Session
% create audio session
fprintf('Creating Session\n');
S = daq.createSession('directsound');
% add audio input channel
fprintf('Adding Audio Input Channel Session\n');
addAudioInputChannel(S, inputDev.ID, 1);
% make session "dis"continuous
fprintf('Setting input to non-continulus... ');
S.IsContinuous = false;
% set acqusition duration
fprintf('acqusition time to %d seconds...', AcqDur);
S.DurationInSeconds = AcqDur;
% set sample rate to 50KHz
fprintf('and sampling rate to %d\n', Fs);
S.Rate = Fs;

%% set up plot
H = figure;
hp = plot(zeros(1000, 1));
T = title('Acquired Data');
xlabel('Time (s)');
ylabel('V');
grid on;

%% start in Foreground
fprintf('Acquiring data...');
data = startForeground(S);
fprintf('...done!\n');

% plot data
t = ((1:length(data)) - 1)./Fs;
plot(t, data);

%% clean up
% stop session
stop(S);
% release hardware
release(S);
% reset
daqreset
% clear
clear S



