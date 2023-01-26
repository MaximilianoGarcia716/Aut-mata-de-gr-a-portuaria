function [alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,x_origen,x_destino,ySeguridadCarro,y_origen,y_destino] = trayectoriaSegunBotonMuelle(nroBoton, ~)
global geometria
% global vmaxh vmaxhfull vmaxt 
% %obtener posicion actual del carro
% datosBloquePosicion=get_param('ProyectoAutomatasSimulink_jona/planta:Grua Portuaria/Carro/x_t','RuntimeObject');
% x_origen=datosBloquePosicion.OutputPort(1).Data;
% datosBloqueAutomata=get_param('ProyectoAutomatasSimulink_jona/Controlador/automata','RuntimeObject');
% Gcierre=datosBloqueAutomata.OutputPort(1).Data;
% if Gcierre
%     vIzaje=vmaxhfull;
% else
%     vIzaje=vmaxh;
% end
%definir destino del carro segun el boton presionado
x_destino=geometria.xt_min+geometria.divHoriz*nroBoton + geometria.anchoCont/2 ;
%generar trayectoria y mostrar
[alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,x_origen,ySeguridadCarro,y_origen,y_destino] = generacionDeTrayectoria1(x_destino,geometria);