function varargout = MuWaveGUI(varargin)
% RESPONSETIMEGUI MATLAB code for ResponseTimeGUI.fig
%      RESPONSETIMEGUI, by itself, creates a new RESPONSETIMEGUI or raises the existing
%      singleton*.
%
%      H = RESPONSETIMEGUI returns the handle to a new RESPONSETIMEGUI or the handle to
%      the existing singleton*.
%
%      RESPONSETIMEGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RESPONSETIMEGUI.M with the given input arguments.
%
%      RESPONSETIMEGUI('Property','Value',...) creates a new RESPONSETIMEGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ResponseTimeGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ResponseTimeGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ResponseTimeGUI

% Last Modified by GUIDE v2.5 27-Apr-2018 12:05:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ResponseTimeGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @ResponseTimeGUI_OutputFcn, ...
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


% --- Executes just before ResponseTimeGUI is made visible.
function ResponseTimeGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ResponseTimeGUI (see VARARGIN)

% Choose default command line output for ResponseTimeGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ResponseTimeGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ResponseTimeGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function textBox_Callback(hObject, eventdata, handles)
% hObject    handle to textBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textBox as text
%        str2double(get(hObject,'String')) returns contents of textBox as a double


% --- Executes during object creation, after setting all properties.
function textBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function Time_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
%Aqui vai o contador de tempo de digitaçao


% --- Executes during object creation, after setting all properties.
function SentenceBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SentenceBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
%Aqui vai o ditado com 10 frases que o camarada precisa copiar ateh o
%tempo acabar


% --- Executes on button press in pushbutton2.18
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    sentences = {'O gato subiu no telhado.';'O rato roeu o queijo.';'Eu nao sei escrever.';...
        'A Mylena esta escrevendo.';'Ela sabe como fazer as coisas.';'O terceiro filho nasceu em Londres.';...
        'O casal retornou para casa.'; 'Os membros carregam as casas.';...
        'A despedida foi em jantar na Bahia.';'Um outro jeito de ver o mundo.';...
        'Molho de mostarda gerou briga.';'O jogador promete nova chance.';'Erros que pioram as dores.';...
        'Maria aceitou a entrevista.'; 'Ela relatou todos os momentos.';...
        'Vi que ele apresentava disturbios.';'Ele estava muito feliz com isso.'};
%     set(handles.Time,'String','OI')
    startTimeGlobal = tic%tempo total de execucao
    for i=1:23
        o = 1
        startTime = tic
        uicontrol(handles.textBox)
        set(handles.textBox,'String','');
        pause(2)
        k=1;
        while toc(startTime) < 8
            if k==1
                a(i,o) = toc(startTimeGlobal)
                frase{i} = sentences(randi([1 length(sentences)],1,1));
                set(handles.SentenceBox,'String',frase{i})
                %startTimeSentence = tic%tempo em que apareceu a sentenca
                k = k+1;
                o = o+1
                pause(0.0000000000000001)
            end 
        end
        % % apaga a frase quando statTime for = 8
        set(handles.SentenceBox,'String','')
        a(i,o) = toc(startTimeGlobal)
        %tempo em ms
        %quando mostra a frase
        %quando some a frase
    end
    fimExec = toc(startTimeGlobal)
    csvwrite('MNRF_27_07052018_S4.csv',a);
    set(handles.textBox,'Visible','off')
    pause(0.000000001)
    set(handles.SentenceBox,'String','FIM! ACABOU! C´EST FINI!');
        csvwrite('MNRF_27_07052018_S4_frase.csv',frase);


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pushbutton2.
function pushbutton2_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    
