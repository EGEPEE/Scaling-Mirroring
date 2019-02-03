function varargout = FigureSkala(varargin)
% FIGURESKALA MATLAB code for FigureSkala.fig
%      FIGURESKALA, by itself, creates a new FIGURESKALA or raises the existing
%      singleton*.
%
%      H = FIGURESKALA returns the handle to a new FIGURESKALA or the handle to
%      the existing singleton*.
%
%      FIGURESKALA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FIGURESKALA.M with the given input arguments.
%
%      FIGURESKALA('Property','Value',...) creates a new FIGURESKALA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FigureSkala_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FigureSkala_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FigureSkala

% Last Modified by GUIDE v2.5 11-Jan-2019 00:30:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FigureSkala_OpeningFcn, ...
                   'gui_OutputFcn',  @FigureSkala_OutputFcn, ...
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


% --- Executes just before FigureSkala is made visible.
function FigureSkala_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FigureSkala (see VARARGIN)

% Choose default command line output for FigureSkala
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes FigureSkala wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = FigureSkala_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function txtSkalaX_Callback(hObject, eventdata, handles)
% hObject    handle to txtSkalaX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtSkalaX as text
%        str2double(get(hObject,'String')) returns contents of txtSkalaX as a double


% --- Executes during object creation, after setting all properties.
function txtSkalaX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtSkalaX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in cBoxPenskalaan.
function cBoxPenskalaan_Callback(hObject, eventdata, handles)
   switch(get(handles.cBoxPenskalaan,'value'))
        case 0
         set(handles.pnlSkala, 'visible', 'off');
        case 1
         set(handles.pnlSkala, 'visible', 'on');
    end
        
% hObject    handle to cBoxPenskalaan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cBoxPenskalaan

% --- Executes on button press in cBoxPencerminan.
function cBoxPencerminan_Callback(hObject, eventdata, handles)
    switch(get(handles.cBoxPencerminan,'value'))
        case 0
         set(handles.pnlCerminan, 'visible', 'off');
        case 1
         set(handles.pnlCerminan, 'visible', 'on');
    end
% hObject    handle to cBoxPencerminan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cBoxPencerminan

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
    penskalaan = get(handles.cBoxPenskalaan, 'Value');
    pencerminan = get(handles.cBoxPencerminan, 'Value');
    I = imread('image.png');

    handles= guidata(hObject);
    ShX = str2double(get(handles.txtSkalaX, 'String'));
    ShY = str2double(get(handles.txtSkalaY, 'String'));
    m = size(I,1)
    n = size(I,2)
    
    pilihan = get(handles.pnlCerminan,'SelectedObject');
    sosSelected = get(pilihan, 'String');
    
    switch sosSelected
        case 'Normal'
            J = zeros(m,n);
            for x = 1 : m-1
                for y = 1 : n-1
                    J(x,y) = I(x,y);
                end
            end
            
            flipping = uint8(J);
        case 'Horizontal Flip'
            J = zeros(m,n);
            mirror = floor(n/2);
            for x = 1 : m-1
                for y = 1 : n-1
                    J(x,y) = I(x, (2*mirror)-y);
                end
            end
            
            flipping = uint8(J);
        case 'Vertical Flip'
            J = zeros(m,n);
            mirror = floor(n/2);
            for x = 1 : m-1
                for y = 1 : n-1
                    J(x,y) = I((2*mirror)-x, y);
                end
            end
            
            flipping = uint8(J);
        case 'Horizontal + Vertical flip'
            J = zeros(m,n);
            mirror = floor(n/2);
            for x = 1 : m-1
                for y = 1 : n-1
                    J(x,y) = I((2*mirror)-x, (2*mirror)-y);
                end
            end
            
            flipping = uint8(J);
    end
    
    if(ShX == 0)
        set(handles.txtWarning, 'String', 'Input Angka Terlebih Dahulu');
    else
        if(penskalaan == 1 && pencerminan == 0)            
            J = perbesaran(I, ShX, ShY, m, n);
            
            funcTampilGambar(I, uint8(J));
        elseif(penskalaan == 0 && pencerminan == 1)      
            funcTampilGambar(I, flipping);
        elseif (penskalaan == 1 && pencerminan == 1)         
            J = perbesaran(flipping, ShX, ShY, m, n);
            
            funcTampilGambar(I,uint8(J))
        end   
        set(handles.txtSkalaX, 'enable', 'off');
        set(handles.txtSkalaY, 'enable', 'off');
        set(handles.pushbutton1, 'enable', 'off');
        set(handles.pushbutton2, 'visible', 'on');
        set(handles.pushbutton1, 'visible', 'off');
    end

% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in rbnormal.
function rbnormal_Callback(hObject, eventdata, handles)
% hObject    handle to rbnormal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rbnormal


% --- Executes on button press in rbhorizontal.
function rbhorizontal_Callback(hObject, eventdata, handles)
% hObject    handle to rbhorizontal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rbhorizontal


% --- Executes on button press in rbvertical.
function rbvertical_Callback(hObject, eventdata, handles)
% hObject    handle to rbvertical (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rbvertical


% --- Executes on button press in rbhorver.
function rbhorver_Callback(hObject, eventdata, handles)
% hObject    handle to rbhorver (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rbhorver


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
     handles= guidata(hObject);
     set(handles.pnlSkala, 'visible', 'off');
     set(handles.pnlCerminan, 'visible', 'off');
     set(handles.cBoxPenskalaan, 'value', 0);
     set(handles.cBoxPencerminan, 'value', 0);
     set(handles.pushbutton1, 'enable', 'on');
     set(handles.txtSkalaX, 'enable', 'on');
     set(handles.txtSkalaX, 'String', '');
     set(handles.txtSkalaY, 'enable', 'on');
     set(handles.txtSkalaY, 'String', '');
     set(handles.txtWarning, 'String', '');
     set(handles.pushbutton1, 'visible', 'on');
     set(handles.pushbutton2, 'visible', 'off');
     close('Gambar Asli');
     close('Gambar Mengalami Perubahan');
     
     %cla(subplot(2,2,3));
     %cla(subplot(2,2,4));

 
 set(handles.pushbutton2);
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function funcTampilGambar(I, x)
    %subplot(2,2,3), imshow(y); 
    %subplot(2,2,4), imshow(x); 
    figure('NumberTitle', 'Off', 'Name', 'Gambar Asli'),imshow(I);
    figure('NumberTitle', 'Off', 'Name', 'Gambar Mengalami Perubahan'),imshow(x);
      
function J = perbesaran(I,ShX,ShY,m,n)
    r = m * ShX
    c = n * ShY
    J = zeros(r,c)
    
    for i = 1 : m
        for j = 1 : n
            J((i-1)*ShX+1 : i*ShX, (j-1)*ShY+1 : j*ShY) = I(i,j);
        end
    end
 
function txtSkalaY_Callback(hObject, eventdata, handles)
% hObject    handle to txtSkalaY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtSkalaY as text
%        str2double(get(hObject,'String')) returns contents of txtSkalaY as a double


% --- Executes during object creation, after setting all properties.
function txtSkalaY_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtSkalaY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
