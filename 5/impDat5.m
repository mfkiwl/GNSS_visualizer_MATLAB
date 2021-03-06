function dat = impDat5(filename, startRow, endRow)
%IMPORTFILE Import numeric data from a text file as a matrix.
%   DAT = IMPORTFILE(FILENAME) Reads data from text file FILENAME for the
%   default selection.
%
%   DAT = IMPORTFILE(FILENAME, STARTROW, ENDROW) Reads data from rows
%   STARTROW through ENDROW of text file FILENAME.
%
% Example:
%   dat = importfile('Debug_V3-0_2nd.dat', 2, 7993);
%
%    See also TEXTSCAN.

% Auto-generated by MATLAB on 2018/10/24 18:07:17

%% Initialize variables.
delimiter = '\t';
if nargin<=2
    startRow = 2;
    endRow = inf;
end

%% Format for each line of text:
%   column1: datetimes (%{yyyy/MM/dd HH:mm:ss}D)
%	column2: double (%f)
%   column3: double (%f)
%	column4: double (%f)
%   column5: double (%f)
%	column6: double (%f)
%   column7: double (%f)
%	column8: double (%f)
%   column9: double (%f)
%	column10: double (%f)
%   column11: double (%f)
%	column12: double (%f)
%   column13: double (%f)
%	column14: double (%f)
%   column15: double (%f)
%	column16: double (%f)
%   column17: double (%f)
%	column18: double (%f)
%   column19: double (%f)
%	column20: double (%f)
%   column21: double (%f)
%	column22: double (%f)
%   column23: double (%f)
%	column24: double (%f)
%   column25: double (%f)
%	column26: double (%f)
%   column27: double (%f)
%	column28: double (%f)
%   column29: double (%f)
%	column30: double (%f)
%   column31: double (%f)
%	column32: double (%f)
%   column33: double (%f)
%	column34: double (%f)
%   column35: double (%f)
%	column36: double (%f)
%   column37: double (%f)
%	column38: double (%f)
%   column39: double (%f)
%	column40: double (%f)
%   column41: double (%f)
%	column42: double (%f)
%   column43: double (%f)
%	column44: double (%f)
%   column45: double (%f)
%	column46: double (%f)
%   column47: double (%f)
%	column48: double (%f)
%   column49: double (%f)
%	column50: double (%f)
%   column51: double (%f)
%	column52: double (%f)
%   column53: double (%f)
%	column54: double (%f)
%   column55: double (%f)
%	column56: double (%f)
%   column57: double (%f)
%	column58: double (%f)
%   column59: double (%f)
%	column60: double (%f)
%   column61: double (%f)
%	column62: double (%f)
%   column63: double (%f)
%	column64: double (%f)
%   column65: double (%f)
%	column66: double (%f)
%   column67: double (%f)
%	column68: double (%f)
%   column69: double (%f)
%	column70: double (%f)
%   column71: double (%f)
%	column72: double (%f)
%   column73: double (%f)
%	column74: double (%f)
%   column75: double (%f)
%	column76: double (%f)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%{yyyy/MM/dd HH:mm:ss}D%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to the format.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'TextType', 'string', 'EmptyValue', NaN, 'HeaderLines', startRow(1)-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
for block=2:length(startRow)
    frewind(fileID);
    dataArrayBlock = textscan(fileID, formatSpec, endRow(block)-startRow(block)+1, 'Delimiter', delimiter, 'TextType', 'string', 'EmptyValue', NaN, 'HeaderLines', startRow(block)-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
    for col=1:length(dataArray)
        dataArray{col} = [dataArray{col};dataArrayBlock{col}];
    end
end

%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post
% processing code is included. To generate code which works for
% unimportable data, select unimportable cells in a file and regenerate the
% script.

%% Create output variable
dat = table(dataArray{1:end-1}, 'VariableNames', {'timeUTC','PDOP_0','HDOP_0','VDOP_0','satelliteInView_0','satelliteInViewGPS_0','satelliteInViewGLONASS_0','satelliteUsed_0','satelliteUsedGPS_0','satelliteUsedGLONASS_0','maxSnr_0','maxSnrGPS_0','maxSnrGLONASS_0','avrSnr_0','avrSnrGPS_0','avrSnrGLONASS_0','PDOP_1','HDOP_1','VDOP_1','satelliteInView_1','satelliteInViewGPS_1','satelliteInViewGLONASS_1','satelliteUsed_1','satelliteUsedGPS_1','satelliteUsedGLONASS_1','maxSnr_1','maxSnrGPS_1','maxSnrGLONASS_1','avrSnr_1','avrSnrGPS_1','avrSnrGLONASS_1','PDOP_2','HDOP_2','VDOP_2','satelliteInView_2','satelliteInViewGPS_2','satelliteInViewGLONASS_2','satelliteUsed_2','satelliteUsedGPS_2','satelliteUsedGLONASS_2','maxSnr_2','maxSnrGPS_2','maxSnrGLONASS_2','avrSnr_2','avrSnrGPS_2','avrSnrGLONASS_2','PDOP_3','HDOP_3','VDOP_3','satelliteInView_3','satelliteInViewGPS_3','satelliteInViewGLONASS_3','satelliteUsed_3','satelliteUsedGPS_3','satelliteUsedGLONASS_3','maxSnr_3','maxSnrGPS_3','maxSnrGLONASS_3','avrSnr_3','avrSnrGPS_3','avrSnrGLONASS_3','PDOP_4','HDOP_4','VDOP_4','satelliteInView_4','satelliteInViewGPS_4','satelliteInViewGLONASS_4','satelliteUsed_4','satelliteUsedGPS_4','satelliteUsedGLONASS_4','maxSnr_4','maxSnrGPS_4','maxSnrGLONASS_4','avrSnr_4','avrSnrGPS_4','avrSnrGLONASS_4'});

% For code requiring serial dates (datenum) instead of datetime, uncomment
% the following line(s) below to return the imported dates as datenum(s).

% dat.timeUTC=datenum(dat.timeUTC);

