function varargout = ResponseTime(varargin)
% RESPONSETIME MATLAB code for ResponseTime.fig
%      RESPONSETIME, by itself, creates a new RESPONSETIME or raises the existing
%      singleton*.
%
%      H = RESPONSETIME returns the handle to a new RESPONSETIME or the handle to
%      the existing singleton*.
%
%      RESPONSETIME('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RESPONSETIME.M with the given input arguments.
%
%      RESPONSETIME('Property','Value',...) creates a new RESPONSETIME or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ResponseTime_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ResponseTime_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ResponseTime

% Last Modified by GUIDE v2.5 02-May-2018 14:35:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @ResponseTime_OpeningFcn, ...
    'gui_OutputFcn',  @ResponseTime_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before ResponseTime is made visible.
function ResponseTime_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ResponseTime (see VARARGIN)

% Choose default command line output for ResponseTime
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ResponseTime wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ResponseTime_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Clicar.
function Clicar_Callback(hObject,~, handles)
% hObject    handle to Clicar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%     global endTime
%     endTime = toc(startTime);
% set(handles.start.endTime,'Float32',toc(handles.start.startTime))
%if isfield(handles,'startTime')
% do something with this variable
% handles.endTime = toc(uint64(handles.startTime))

% responseTime(handles.endTime) = uint64(toc(uint64(handles.startTime)))

responseTime = csvread('ResponseTime.csv');
% double(toc(uint64(handles.startTime)))
responseTime(handles.endTime) = (toc(uint64(handles.startTime)));
csvwrite('ResponseTime.csv',responseTime);


% --- Executes on button press in start.

function start_Callback(hObject, eventdata, handles)
% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%     global startTime
data = guidata(hObject);
pause(1)
csvwrite('ResponseTime.csv',0)
globT = tic
for i=1:350
    set(handles.mensagem,'String','Preparar...');
    pause(randi([1 4],1,1));
    set(handles.mensagem,'String','Clicar!');
    pause(0.000001);
    
    handles.startTime = 0;
    handles.endTime = i;
    
    handles.startTime = tic;
    guidata(hObject, handles);
    pause(1)
end
set(handles.Clicar,'Enable','off')
toc(globT)/60
disp('Oi')
