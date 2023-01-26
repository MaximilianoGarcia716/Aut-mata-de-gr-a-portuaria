function varargout = interfazPrueba(varargin)
% INTERFAZPRUEBA MATLAB code for interfazPrueba.fig
%      INTERFAZPRUEBA, by itself, creates a new INTERFAZPRUEBA or raises the existing
%      singleton*.
%
%      H = INTERFAZPRUEBA returns the handle to a new INTERFAZPRUEBA or the handle to
%      the existing singleton*.
%
%      INTERFAZPRUEBA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERFAZPRUEBA.M with the given input arguments.
%
%      INTERFAZPRUEBA('Property','Value',...) creates a new INTERFAZPRUEBA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before interfazPrueba_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to interfazPrueba_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help interfazPrueba

% Last Modified by GUIDE v2.5 25-Mar-2019 11:58:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interfazPrueba_OpeningFcn, ...
                   'gui_OutputFcn',  @interfazPrueba_OutputFcn, ...
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


% --- Executes just before interfazPrueba is made visible.
function interfazPrueba_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to interfazPrueba (see VARARGIN)

% Choose default command line output for interfazPrueba
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

function varargout = interfazPrueba_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;


% --- Executes on button press in bot1muelle.
function bot1muelle_Callback(hObject, eventdata, handles, geometria) %TODO: el argumento geometria esta mal, no coincide con el del base workspace, se usa una variable global para corregirlo
[alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,x_origen,x_destino,ySeguridadCarro,y_origen,y_destino] = trayectoriaSegunBotonMuelle(1, geometria);
setParamTrayectoria(alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,ySeguridadCarro, x_origen, x_destino,y_origen,y_destino)

myString = sprintf('x_origen = %d\nx_destino = %d', x_origen, x_destino);
set(handles.textoGenerador, 'String', myString);


% --- Executes on button press in bot2muelle.
function bot2muelle_Callback(hObject, eventdata, handles, geometria)
[alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,x_origen,x_destino,ySeguridadCarro,y_origen,y_destino] = trayectoriaSegunBotonMuelle(2, geometria);
setParamTrayectoria(alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,ySeguridadCarro, x_origen, x_destino,y_origen,y_destino) 

myString = sprintf('x_origen = %d\nx_destino = %d', x_origen, x_destino);
set(handles.textoGenerador, 'String', myString);

% --- Executes on button press in botBarco8.
function botBarco8_Callback(hObject, eventdata, handles, geometria)
[alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,x_origen,x_destino,ySeguridadCarro,y_origen,y_destino] = trayectoriaSegunBotonBarco(8, geometria);
setParamTrayectoria(alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,ySeguridadCarro, x_origen, x_destino,y_origen,y_destino) 

myString = sprintf('x_origen = %d\nx_destino = %d', x_origen, x_destino);
set(handles.textoGenerador, 'String', myString);

% --- Executes on button press in botBarco7.
function botBarco7_Callback(hObject, eventdata, handles, geometria)
[alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,x_origen,x_destino,ySeguridadCarro,y_origen,y_destino] = trayectoriaSegunBotonBarco(7, geometria);
setParamTrayectoria(alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,ySeguridadCarro, x_origen, x_destino,y_origen,y_destino) 

myString = sprintf('x_origen = %d\nx_destino = %d', x_origen, x_destino);
set(handles.textoGenerador, 'String', myString);

% --- Executes on button press in botBarco6.
function botBarco6_Callback(hObject, eventdata, handles, geometria)
[alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,x_origen,x_destino,ySeguridadCarro,y_origen,y_destino] = trayectoriaSegunBotonBarco(6, geometria);
setParamTrayectoria(alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,ySeguridadCarro, x_origen, x_destino,y_origen,y_destino) 

myString = sprintf('x_origen = %d\nx_destino = %d', x_origen, x_destino);
set(handles.textoGenerador, 'String', myString);

% --- Executes on button press in botBarco5.
function botBarco5_Callback(hObject, eventdata, handles, geometria)
[alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,x_origen,x_destino,ySeguridadCarro,y_origen,y_destino] = trayectoriaSegunBotonBarco(5, geometria);
setParamTrayectoria(alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,ySeguridadCarro, x_origen, x_destino,y_origen,y_destino) 

myString = sprintf('x_origen = %d\nx_destino = %d', x_origen, x_destino);
set(handles.textoGenerador, 'String', myString);

% --- Executes on button press in botBarco4.
function botBarco4_Callback(hObject, eventdata, handles, geometria)
[alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,x_origen,x_destino,ySeguridadCarro,y_origen,y_destino] = trayectoriaSegunBotonBarco(4, geometria);
setParamTrayectoria(alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,ySeguridadCarro, x_origen, x_destino,y_origen,y_destino) 

myString = sprintf('x_origen = %d\nx_destino = %d', x_origen, x_destino);
set(handles.textoGenerador, 'String', myString);

% --- Executes on button press in botBarco3.
function botBarco3_Callback(hObject, eventdata, handles, geometria)
[alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,x_origen,x_destino,ySeguridadCarro,y_origen,y_destino] = trayectoriaSegunBotonBarco(3, geometria);
setParamTrayectoria(alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,ySeguridadCarro, x_origen, x_destino,y_origen,y_destino) 

myString = sprintf('x_origen = %d\nx_destino = %d', x_origen, x_destino);
set(handles.textoGenerador, 'String', myString);

% --- Executes on button press in botBarco2.
function botBarco2_Callback(hObject, eventdata, handles, geometria)
[alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,x_origen,x_destino,ySeguridadCarro,y_origen,y_destino] = trayectoriaSegunBotonBarco(2, geometria);
setParamTrayectoria(alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,ySeguridadCarro, x_origen, x_destino,y_origen,y_destino) 

myString = sprintf('x_origen = %d\nx_destino = %d', x_origen, x_destino);
set(handles.textoGenerador, 'String', myString);

% --- Executes on button press in botBarco1.
function botBarco1_Callback(hObject, eventdata, handles, geometria) %al modificar los parametros que recibe, tambien modificar esta funcion en guide haciendo doble click en el boton
[alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,x_origen,x_destino,ySeguridadCarro,y_origen,y_destino] = trayectoriaSegunBotonBarco(1, geometria);
setParamTrayectoria(alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,ySeguridadCarro, x_origen, x_destino,y_origen,y_destino);

myString = sprintf('x_origen = %d\nx_destino = %d', x_origen, x_destino);
set(handles.textoGenerador, 'String', myString);

% --- Executes on button press in botBarco9.
function botBarco9_Callback(hObject, eventdata, handles, geometria)
[alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,x_origen,x_destino,ySeguridadCarro,y_origen,y_destino] = trayectoriaSegunBotonBarco(9, geometria);
setParamTrayectoria(alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,ySeguridadCarro, x_origen, x_destino,y_origen,y_destino) 

myString = sprintf('x_origen = %d\nx_destino = %d', x_origen, x_destino);
set(handles.textoGenerador, 'String', myString);

% --- Executes on button press in botBarco10.
function botBarco10_Callback(hObject, eventdata, handles, geometria)
[alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,x_origen,x_destino,ySeguridadCarro,y_origen,y_destino] = trayectoriaSegunBotonBarco(10, geometria);
setParamTrayectoria(alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,ySeguridadCarro, x_origen, x_destino,y_origen,y_destino) 

myString = sprintf('x_origen = %d\nx_destino = %d', x_origen, x_destino);
set(handles.textoGenerador, 'String', myString);

function botBarco11_Callback(hObject, eventdata, handles, geometria)
[alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,x_origen,x_destino,ySeguridadCarro,y_origen,y_destino] = trayectoriaSegunBotonBarco(11, geometria);
setParamTrayectoria(alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,ySeguridadCarro, x_origen, x_destino,y_origen,y_destino) 

myString = sprintf('x_origen = %d\nx_destino = %d', x_origen, x_destino);
set(handles.textoGenerador, 'String', myString);

function botBarco12_Callback(hObject, eventdata, handles, geometria)
[alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,x_origen,x_destino,ySeguridadCarro,y_origen,y_destino] = trayectoriaSegunBotonBarco(12, geometria);
setParamTrayectoria(alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,ySeguridadCarro, x_origen, x_destino,y_origen,y_destino) 

myString = sprintf('x_origen = %d\nx_destino = %d', x_origen, x_destino);
set(handles.textoGenerador, 'String', myString);

function botBarco13_Callback(hObject, eventdata, handles, geometria)
[alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,x_origen,x_destino,ySeguridadCarro,y_origen,y_destino] = trayectoriaSegunBotonBarco(13, geometria);
setParamTrayectoria(alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,ySeguridadCarro, x_origen, x_destino,y_origen,y_destino) 

myString = sprintf('x_origen = %d\nx_destino = %d', x_origen, x_destino);
set(handles.textoGenerador, 'String', myString);

% --- Executes on button press in botBarco14.
function botBarco14_Callback(hObject, eventdata, handles, geometria)
[alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,x_origen,x_destino,ySeguridadCarro,y_origen,y_destino] = trayectoriaSegunBotonBarco(14, geometria);
setParamTrayectoria(alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,ySeguridadCarro, x_origen, x_destino,y_origen,y_destino) 

myString = sprintf('x_origen = %d\nx_destino = %d', x_origen, x_destino);
set(handles.textoGenerador, 'String', myString);

% --- Executes on button press in botBarco15.
function botBarco15_Callback(hObject, eventdata, handles, geometria)
[alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,x_origen,x_destino,ySeguridadCarro,y_origen,y_destino] = trayectoriaSegunBotonBarco(15, geometria);
setParamTrayectoria(alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,ySeguridadCarro, x_origen, x_destino,y_origen,y_destino) 

myString = sprintf('x_origen = %d\nx_destino = %d', x_origen, x_destino);
set(handles.textoGenerador, 'String', myString);

% --- Executes on button press in botBarco16.
function botBarco16_Callback(hObject, eventdata, handles, geometria)
[alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,x_origen,x_destino,ySeguridadCarro,y_origen,y_destino] = trayectoriaSegunBotonBarco(16, geometria);
setParamTrayectoria(alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,ySeguridadCarro, x_origen, x_destino,y_origen,y_destino) 

myString = sprintf('x_origen = %d\nx_destino = %d', x_origen, x_destino);
set(handles.textoGenerador, 'String', myString);

% --- Executes on button press in bot3muelle.
function bot3muelle_Callback(hObject, eventdata, handles, geometria)
[alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,x_origen,x_destino,ySeguridadCarro,y_origen,y_destino] = trayectoriaSegunBotonMuelle(3, geometria);
setParamTrayectoria(alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,ySeguridadCarro, x_origen, x_destino,y_origen,y_destino) 

myString = sprintf('x_origen = %d\nx_destino = %d', x_origen, x_destino);
set(handles.textoGenerador, 'String', myString);

% --- Executes on button press in bot4muelle.
function bot4muelle_Callback(hObject, eventdata, handles, geometria)
[alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,x_origen,x_destino,ySeguridadCarro,y_origen,y_destino] = trayectoriaSegunBotonMuelle(4, geometria);
setParamTrayectoria(alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,ySeguridadCarro, x_origen, x_destino,y_origen,y_destino) 

myString = sprintf('x_origen = %d\nx_destino = %d', x_origen, x_destino);
set(handles.textoGenerador, 'String', myString);

% --- Executes on button press in bot5muelle.
function bot5muelle_Callback(hObject, eventdata, handles, geometria)
[alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,x_origen,x_destino,ySeguridadCarro,y_origen,y_destino] = trayectoriaSegunBotonMuelle(5, geometria);
setParamTrayectoria(alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,ySeguridadCarro, x_origen, x_destino,y_origen,y_destino) 

myString = sprintf('x_origen = %d\nx_destino = %d', x_origen, x_destino);
set(handles.textoGenerador, 'String', myString);

% --- Executes on button press in bot6muelle.
function bot6muelle_Callback(hObject, eventdata, handles, geometria)
[alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,x_origen,x_destino,ySeguridadCarro,y_origen,y_destino] = trayectoriaSegunBotonMuelle(6, geometria);
setParamTrayectoria(alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,ySeguridadCarro, x_origen, x_destino,y_origen,y_destino) 

myString = sprintf('x_origen = %d\nx_destino = %d', x_origen, x_destino);
set(handles.textoGenerador, 'String', myString);

% --- Executes on button press in bot7muelle.
function bot7muelle_Callback(hObject, eventdata, handles, geometria)
[alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,x_origen,x_destino,ySeguridadCarro,y_origen,y_destino] = trayectoriaSegunBotonMuelle(7, geometria);
setParamTrayectoria(alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,ySeguridadCarro, x_origen, x_destino,y_origen,y_destino) 

myString = sprintf('x_origen = %d\nx_destino = %d', x_origen, x_destino);
set(handles.textoGenerador, 'String', myString);

% --- Executes on button press in bot8muelle.
function bot8muelle_Callback(hObject, eventdata, handles, geometria)
[alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,x_origen,x_destino,ySeguridadCarro,y_origen,y_destino] = trayectoriaSegunBotonMuelle(8, geometria);
setParamTrayectoria(alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,ySeguridadCarro, x_origen, x_destino,y_origen,y_destino) 

myString = sprintf('x_origen = %d\nx_destino = %d', x_origen, x_destino);
set(handles.textoGenerador, 'String', myString);

% --- Executes on button press in botonIniciarSimulacion.
function botonIniciarSimulacion_Callback(hObject, eventdata, handles,geometria1)
global geometria
button_state = get(hObject,'Value');
if button_state == get(hObject,'Max') %aprieta el boton
    if strcmp(get_param('ProyectoAutomatasSimulink_jona','SimulationStatus') , 'stopped' )%si la simulacion esta detenida dibujar e iniciar
        axes(handles.axes1)
        dibujarSituacionInicial1(geometria)
        set_param('ProyectoAutomatasSimulink_jona', 'SimulationCommand', 'start')
    elseif strcmp(get_param('ProyectoAutomatasSimulink_jona','SimulationStatus') , 'paused') %poner en pausa
        set_param('ProyectoAutomatasSimulink_jona', 'SimulationCommand', 'continue')
    end
    
    %obtener handles de los objetos del diagrama simulink
    datosBloquePosicion=get_param('ProyectoAutomatasSimulink_jona/planta:Grua Portuaria/Carro/x_t','RuntimeObject');
    datosBloqueIzaje=get_param('ProyectoAutomatasSimulink_jona/planta:Grua Portuaria/Izaje/l_h','RuntimeObject');
    datosBloqueAnguloTheta=get_param('ProyectoAutomatasSimulink_jona/planta:Grua Portuaria/ang_theta','RuntimeObject');
    
    %descomentar esta linea para usar el automata de codesys
    datosGancho=get_param('ProyectoAutomatasSimulink_jona/Controlador/Gcierre','RuntimeObject');
    %descomentar esta linea para usar el automata de simulink
    %datosGancho=get_param('ProyectoAutomatasSimulink_jona/Controlador/automata','RuntimeObject');
    
    %rectangulo que simula al carro, linea que simula el cable y rectangulo que
    %simula el sistema de ganchos
    carro = rectangle('EdgeColor','k','Position', [geometria.xt_min ,geometria.y_max , 5  5]);
    cable=line;
    gancho = rectangle('EdgeColor','k','Position', [geometria.xt_min-(geometria.anchoCont/2) ,geometria.y_max , geometria.anchoCont 1]);
    %verificar si el gancho esta cerrado y dibujar contenedor
    contenedor=rectangle('EdgeColor','k','Position', [geometria.xt_min-(geometria.anchoCont) ,geometria.y_max , geometria.anchoCont 1]);
    contenedor.Visible='off';
    contLevantado=0;
    contDepositado=1;
    while get(hObject,'Value') %mientras este el boton presionado
        %actualizar valor de posicion en el panel de posicion actual
        x_t = datosBloquePosicion.OutputPort(1).Data;
        carro.Position = [x_t-2.5 ,geometria.y_max , 5  5];
        l_h=datosBloqueIzaje.OutputPort(1).Data;
        ang_theta=datosBloqueAnguloTheta.OutputPort(1).Data;
        myString = sprintf('posicion del carro (x_t): %d\ndesenrollado del izaje (l_h): %d\nangulo en grados (theta): %d', x_t, l_h,ang_theta*180/pi);
        set(handles.textoPosicion, 'String', myString);
        %linea o cable
        puntoInicial=[x_t,geometria.y_max+5];
        angulo=ang_theta-1.5708; %sumar 90 grados para que dibuje una linea vertical
        LargoLinea=l_h; % This defines the length of the line
        x=[0,1]*LargoLinea*cos(angulo)+puntoInicial(1);
        y=[0,1]*LargoLinea*sin(angulo)+puntoInicial(2);
        cable.XData=x;
        cable.YData=y;
        gancho.Position = [LargoLinea*cos(angulo)+puntoInicial(1)-(geometria.anchoCont/2) ,LargoLinea*sin(angulo)+puntoInicial(2) , geometria.anchoCont 1];
        if datosGancho.OutputPort(1).Data %verificar si el gancho esta cerrado
            contenedor.Position = [LargoLinea*cos(angulo)+puntoInicial(1)-(geometria.anchoCont/2) ,LargoLinea*sin(angulo)+puntoInicial(2)-geometria.altoCont , geometria.anchoCont geometria.altoCont];
            if ~contLevantado
                contenedor.Visible='on';
                %leer los valores de los bloques que entran al automata
%                 x_destino=get_param('ProyectoAutomatasSimulink_jona/Controlador/x_destino', 'Value')
%                 alturaInicioDesplazamientoCarro=get_param('ProyectoAutomatasSimulink_jona/Controlador/alturaInicioDesplazamientoCarro', 'Value')
%                 PosicionCarroInicioDescensoIzaje=get_param('ProyectoAutomatasSimulink_jona/Controlador/PosicionCarroInicioDescensoIzaje', 'Value')
%                 ySeguridadCarro=get_param('ProyectoAutomatasSimulink_jona/Controlador/ySeguridadCarro', 'Value')
%                 y_destino=get_param('ProyectoAutomatasSimulink_jona/Controlador/y_destino', 'Value')
                borrarCont(x_t)%,x_destino); %TODO: verificar si funciona utilizando x_t o es necesario buscar la x_origen
                contLevantado=1;
                contDepositado=0;
            end
        else %si el gancho esta abierto
            if ~contDepositado % si aun no se dibuja en la posicion donde se va a descargar
%                 if contLevantado  %si hay un contenedor en el gancho
                    dibujarCont(x_t);
                    contDepositado=1;
%                 end
            end
            contLevantado=0;%revisar
            contenedor.Visible='off';
        end
        pause(0.02) %0.01 buena fluidez de actualizacion de la gui
    end
elseif button_state == get(hObject,'Min') %suelta el boton
    set_param('ProyectoAutomatasSimulink_jona', 'SimulationCommand', 'pause')
end




% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over bot1muelle.
function bot1muelle_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to bot1muelle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over textoPosicion.
function textoPosicion_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to textoPosicion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in stopReset.
function stopReset_Callback(hObject, eventdata, handles)
% hObject    handle to stopReset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set_param('ProyectoAutomatasSimulink_jona', 'SimulationCommand', 'stop')
cla(handles.axes1)
set(handles.botonIniciarSimulacion, 'Value', 0); %desactivar el boton de iniciar simulacion


% --- Executes on button press in botonEspera.
function botonEspera_Callback(hObject, eventdata, handles)
% hObject    handle to botonEspera (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in botonOperando.
function botonOperando_Callback(hObject, eventdata, handles)
% hObject    handle to botonOperando (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in botonError.
function botonError_Callback(hObject, eventdata, handles)
% hObject    handle to botonError (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton30.
function pushbutton30_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
