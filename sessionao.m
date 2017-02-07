%% check hardware
if ~exist('allDev', 'var')
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

%% Use the DirectSound speakers (index 4 or Audio4)
outDev = allDev(4);
% outDev = 
% 
% directsound: DirectSound Speakers (High Definition Audio Device) (Device ID: 'Audio3')
%    Audio output subsystem supports:
%       -1.0 to +1.0  range
%       Rates from 80.0 to 1000000.0 scans/sec
%       6 channels ('1' - '6')
%       'Audio' measurement type

%% Start Session
% create audio session
S = daq.createSession('directsound');
S
% add audio output channel
addAudioOutputChannel(S, outDev.ID, 1);
% make session not continuous
S.IsContinuous = false;
%%
% set sample rate to 50KHz
Fs = 50000;
S.Rate = Fs;
S.NotifyWhenScansQueuedBelow = 1;
%% create stimulus
teststim = synmonosweep(1000, Fs, 100, 10000, 1, 0);
%% add stimulus to queue
queueOutputData(S, teststim');
%%
prepare(S);
%% start in Foreground
startForeground(S);

%% wait
pause(10);

%% clean up
% stop session
stop(S);
s.IsContinuous = false;
delete(hl);
% release hardware
release(S);
% reset
daqreset
% clear
clear S allDev inputDev



