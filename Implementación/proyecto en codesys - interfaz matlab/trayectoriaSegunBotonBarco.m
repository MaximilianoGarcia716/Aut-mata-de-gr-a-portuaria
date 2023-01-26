function [alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,x_origen,x_destino,ySeguridadCarro,y_origen,y_destino] = trayectoriaSegunBotonBarco(nroBoton,~) %geometria)
global geometria

x_destino=geometria.divHoriz*nroBoton + geometria.anchoCont/2 ;
%generar trayectoria y mostrar
[alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,x_origen,ySeguridadCarro,y_origen,y_destino] = generacionDeTrayectoria1(x_destino,geometria);