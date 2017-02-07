%------------------------------------------------------------------------
%[D, varargout] = openDAQ(varargin)
%------------------------------------------------------------------------
% TytoLogy -> DAQtoolbox -> API
%------------------------------------------------------------------------
% 
% Function specification to return DAQ hardware interface
% 
%------------------------------------------------------------------------
% Input Arguments:
% 	Input		input info
% 
% Output Arguments:
% 	Output	output info
%
%------------------------------------------------------------------------
% See also: TytoLogy->TDTtoolbox
%------------------------------------------------------------------------

%------------------------------------------------------------------------
% Sharad J. Shanbhag
% sshanbhag@neomed.edu
%------------------------------------------------------------------------
% Created: 1 February, 2017 (SJS)
%
% Revisions:
%------------------------------------------------------------------------
% TO DO:
%------------------------------------------------------------------------


function [D, varargout] = openDAQ(varargin)
%------------------------------------------------------------------------
%[D, varargout] = openDAQ(varargin)
%------------------------------------------------------------------------
% TytoLogy -> DAQtoolbox -> API
%------------------------------------------------------------------------
% 
% Function specification to return DAQ hardware interface
% 
%------------------------------------------------------------------------
% Input Arguments:
% 	will depend on specifics of hardware!
% 
% Output Arguments:
%  D	DAQ hardware interface struct with fields:
%
%------------------------------------------------------------------------
% See also: TytoLogy->TDTtoolbox
%------------------------------------------------------------------------

%------------------------------------------------------------------------
% Sharad J. Shanbhag
% sshanbhag@neomed.edu
%------------------------------------------------------------------------
% Created: 1 February, 2017 (SJS)
%
% Revisions:
%------------------------------------------------------------------------

end

function varargout = closeDAQ(D, varargin)
%------------------------------------------------------------------------
%varargout = closeDAQ(D, varargin)
%------------------------------------------------------------------------
% TytoLogy -> DAQtoolbox -> API
%------------------------------------------------------------------------
% 
% Function specification to close DAQ hardware interface
% 
%------------------------------------------------------------------------
% Input Arguments:
%	D	DAQ hardware interface struct with fields:
% 
% Output Arguments:
% 	will depend on specifics of hardware! 
%
%------------------------------------------------------------------------
% See also: TytoLogy->TDTtoolbox
%------------------------------------------------------------------------

%------------------------------------------------------------------------
% Sharad J. Shanbhag
% sshanbhag@neomed.edu
%------------------------------------------------------------------------
% Created: 1 February, 2017 (SJS)
%
% Revisions:
%------------------------------------------------------------------------

end


function varargout = inputFs(D, varargin)
%------------------------------------------------------------------------
% varargout = inputFs(D, varargin)
%------------------------------------------------------------------------
% TytoLogy -> DAQtoolbox -> API
%------------------------------------------------------------------------
% 
% Function specification to set input sample rate
%
% Actions: 
%	- if no sample rate given, returns input sample rate
%  - if sample rate provided as varargin{1}, sample rate is set to
%		value in varargin{1} and updated struct D is returned
%------------------------------------------------------------------------
% Input Arguments:
%	D	DAQ hardware interface struct
% 	Optional:
% 		Fs		sample rate in samples/second
% 
% Output Arguments:
% 	Sample rate (if no input provided)
% 	or
% 	D	DAQ hardware struct (if Fs provided as input)
%
%------------------------------------------------------------------------
% See also: TytoLogy->TDTtoolbox
%------------------------------------------------------------------------

%------------------------------------------------------------------------
% Sharad J. Shanbhag
% sshanbhag@neomed.edu
%------------------------------------------------------------------------
% Created: 1 February, 2017 (SJS)
%
% Revisions:
%------------------------------------------------------------------------

end

function varargout = outputFs(D, varargin)
%------------------------------------------------------------------------
% varargout = outputFs(D, varargin)
%------------------------------------------------------------------------
% TytoLogy -> DAQtoolbox -> API
%------------------------------------------------------------------------
% 
% Function specification to set output sample rate
%
% Actions: 
%	- if no sample rate given, returns output sample rate
%  - if sample rate provided as varargin{1}, sample rate is set to
%		value in varargin{1} and updated struct D is returned
%------------------------------------------------------------------------
% Input Arguments:
%	D	DAQ hardware interface struct
% 	Optional:
% 		Fs		sample rate in samples/second
% 
% Output Arguments:
% 	Sample rate (if no input provided)
% 	or
% 	D	DAQ hardware struct (if Fs provided as input)
%
%------------------------------------------------------------------------
% See also: TytoLogy->TDTtoolbox
%------------------------------------------------------------------------

%------------------------------------------------------------------------
% Sharad J. Shanbhag
% sshanbhag@neomed.edu
%------------------------------------------------------------------------
% Created: 1 February, 2017 (SJS)
%
% Revisions:
%------------------------------------------------------------------------

end

function [data, varargout] = readData(D, nsamples)


end





