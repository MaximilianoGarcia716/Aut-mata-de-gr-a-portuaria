function setParamTrayectoria(alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,ySeguridadCarro, x_origen, x_destino,y_origen,y_destino)

%actualizar los bloques que entran al automata
set_param('ProyectoAutomatasSimulink_jona/Controlador/x_destino', 'Value', num2str(x_destino))
set_param('ProyectoAutomatasSimulink_jona/Controlador/alturaInicioDesplazamientoCarro', 'Value', num2str(alturaInicioDesplazamientoCarro))
set_param('ProyectoAutomatasSimulink_jona/Controlador/PosicionCarroInicioDescensoIzaje', 'Value', num2str(PosicionCarroInicioDescensoIzaje))
set_param('ProyectoAutomatasSimulink_jona/Controlador/ySeguridadCarro', 'Value', num2str(ySeguridadCarro))
set_param('ProyectoAutomatasSimulink_jona/Controlador/y_destino', 'Value', num2str(y_destino))
set_param('ProyectoAutomatasSimulink_jona/Controlador/y_origen','Value', num2str(y_origen))


end