function varargout = TugasPrakJST(varargin)
% TUGASPRAKJST MATLAB code for TugasPrakJST.fig
%      TUGASPRAKJST, by itself, creates a new TUGASPRAKJST or raises the existing
%      singleton*.
%
%      H = TUGASPRAKJST returns the handle to a new TUGASPRAKJST or the handle to
%      the existing singleton*.
%
%      TUGASPRAKJST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TUGASPRAKJST.M with the given input arguments.
%
%      TUGASPRAKJST('Property','Value',...) creates a new TUGASPRAKJST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TugasPrakJST_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TugasPrakJST_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TugasPrakJST

% Last Modified by GUIDE v2.5 02-Jun-2021 11:12:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TugasPrakJST_OpeningFcn, ...
                   'gui_OutputFcn',  @TugasPrakJST_OutputFcn, ...
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


% --- Executes just before TugasPrakJST is made visible.
function TugasPrakJST_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TugasPrakJST (see VARARGIN)

% Choose default command line output for TugasPrakJST
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes TugasPrakJST wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TugasPrakJST_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in bt_hasil.
function bt_hasil_Callback(hObject, eventdata, handles)
% hObject    handle to bt_hasil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input1=str2num(get(handles.input1, 'String'));
input2=str2num(get(handles.input2, 'String'));
if ((input1 >= 0 && input1 < 2) && (input2 >= 0 && input2 < 2))
    net = newp([0 1; 0 1], 1);
    net.IW{1,1} = [-1 1];
    bias = [1];
    net.b{1} = bias;
    p = [[1;1] [1;0] [0;1] [0;0]];
    t = [1 1 1 0];
    net = train(net,p,t);
 
    hasil = net([input1;input2]);
    
    set(handles.hasil, 'String', hasil);
    set(handles.bias, 'String', net.b{1});
else
    set(handles.hasil, 'String', "Ulangi Inputan");
    set(handles.bias, 'String', "Ulangi Inputan");
end



function input1_Callback(hObject, eventdata, handles)
% hObject    handle to input1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input1 as text
%        str2double(get(hObject,'String')) returns contents of input1 as a double
input1 = str2double(get(hObject, 'String'));
if isnan(input1)
    set(hObject, 'String', '');
    errordlg('Isi dengan angka..','Input Ulang');
elseif (input1 < 0 && input1 > 1)
    set(hObject, 'String', '');
    errordlg('Input Angka 0 atau 1','Input Ulang'); 
elseif isempty(input1) 
    errordlg('kolom masih kosong..','Input Ulang');   
end 

% --- Executes during object creation, after setting all properties.
function input1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function input2_Callback(hObject, eventdata, handles)
% hObject    handle to input2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input2 as text
%        str2double(get(hObject,'String')) returns contents of input2 as a double
input2 = str2double(get(hObject, 'String'));
if isnan(input2)
    set(hObject, 'String', '');
    errordlg('Isi dengan angka..','Input Ulang');
elseif (input2 < 0 && input2 > 1)
    set(hObject, 'String', '');
    errordlg('Input Angka 0 atau 1','Input Ulang'); 
elseif isempty(input2) 
    errordlg('kolom masih kosong..','Input Ulang');   
end 

% --- Executes during object creation, after setting all properties.
function input2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function hasil_Callback(hObject, eventdata, handles)
% hObject    handle to hasil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hasil as text
%        str2double(get(hObject,'String')) returns contents of hasil as a double


% --- Executes during object creation, after setting all properties.
function hasil_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hasil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bias_Callback(hObject, eventdata, handles)
% hObject    handle to bias (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bias as text
%        str2double(get(hObject,'String')) returns contents of bias as a double


% --- Executes during object creation, after setting all properties.
function bias_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bias (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
