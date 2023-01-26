function [alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,x_origen,ySeguridadCarro,y_origen,y_destino]=calcularPuntosInicioMovimiento(x_destino,geometria)
clc
global vmaxh vmaxhfull vmaxt 
%obtener posicion actual del carro
datosBloquePosicion=get_param('ProyectoAutomatasSimulink_jona/Comunicacion/x_t','RuntimeObject');
x_origen=datosBloquePosicion.OutputPort(1).Data;
datosBloqueAutomata=get_param('ProyectoAutomatasSimulink_jona/Comunicacion/automata','RuntimeObject');
Gcierre=datosBloqueAutomata.OutputPort(1).Data;
if Gcierre
    vIzaje=vmaxhfull;
else
    vIzaje=vmaxh;
end
vCarro=vmaxt;

%calculo del triangulo de velocidades para las trayectorias
aTriangulo=vCarro;
bTriangulo=vIzaje;
cTriangulo=sqrt((aTriangulo^2)+(bTriangulo^2)); %hipotenusa
betaTriangulo=acos(bTriangulo/cTriangulo);%asin(bTriangulo/cTriangulo);












global linea1 linea2 lineaSeguridad lineaSeguridadAut
delete(linea1)
delete(linea2)
delete(lineaSeguridad)
delete(lineaSeguridadAut)
% hold on
y_destino=999;
%inicialiar las variables, deben ser numeros negativos!!!!!!!
alturaInicioDesplazamientoCarro=-999;
PosicionCarroInicioDescensoIzaje=-999;
ySeguridadCarro=-999;
%altura de seguridad para evitar colision entre el contenedor suspendido y
%las columnas de contenedores apilados. si este valor es cero, se pueden
%ver los puntos donde se encuentran los impactos.

if Gcierre
    alturaInicioAutomatico = geometria.altoCont * 1.5;
    cantContDeSeguridad=2;
else
    alturaInicioAutomatico = geometria.altoCont * .5;
    cantContDeSeguridad=1;
end
% alturaInicioAutomatico = geometria.altoCont*cteContenedores;

% global lineaSeguridad







[nroContMuelle,nroContBarco,alturasContMuelle,alturasContBarco] = determinarAlturasContenedores(geometria);

%determinar si es una operacion de ida desde el barco hasta el muelle o
%viceversa
if x_origen>=0 && x_destino<0 %barco hasta el muelle
    %%
    title('ida del barco al muelle')
    %determinar las coordenadas "Y" de las trayectorias y graficar
    nroColOrigen=round(abs(x_origen)/geometria.divHoriz);
    if nroColOrigen<1
        nroColOrigen=1;
    end
    nroColDestino=round(abs( (geometria.xt_min-x_destino)/geometria.divHoriz));
    y_destino=alturasContMuelle(nroColDestino);
    y_destino=verificarChoquesLaterales(y_destino,nroColDestino,geometria.nroHorizContMuelle,alturasContMuelle,geometria);
    
    %establecer la altura minima a la que debe elevarse el izaje para no chocar
    for i=1: nroColOrigen
        if ySeguridadCarro<alturasContBarco(i)
            ySeguridadCarro=alturasContBarco(i);
        end
    end
    if nroColDestino==1
        donde=nroColDestino;
    else
        donde=nroColDestino-1;
    end
    for i=donde:1:geometria.nroHorizContMuelle 
        if ySeguridadCarro<alturasContMuelle(i)
            ySeguridadCarro=alturasContMuelle(i);
        end
    end
    if ySeguridadCarro<=geometria.altoVigaTestera %evitar que los contenedores choquen con la viga testera
        ySeguridadCarro=geometria.altoVigaTestera;
    end
    y_origen=alturasContBarco(nroColOrigen);
    y_origen=verificarChoquesLaterales(y_origen,nroColOrigen,geometria.nroHorizContBarco,alturasContBarco,geometria);

elseif x_origen<0 && x_destino>=0 %muelle al barco
    %%
    title('ida del muelle al barco')
    nroColOrigen=round(abs( (geometria.xt_min-x_origen)/geometria.divHoriz));
    if nroColOrigen<1 %si la resta geometria.xt_min-x_origen es = a cero, significa que estoy en la primera columna
        nroColOrigen=1;
    end
    nroColDestino=floor(abs(x_destino)/geometria.divHoriz);
    y_destino=alturasContBarco(nroColDestino);
    y_destino=verificarChoquesLaterales(y_destino,nroColDestino,geometria.nroHorizContBarco,alturasContBarco,geometria);
    if nroColDestino==1
        if geometria.altoVigaTestera > y_destino %si se desea llegar a la primera pila de contenedores, detenerse a la altura de la viga testera
            y_destino=geometria.altoVigaTestera;
        end
    end
    
    %establecer la altura minima a la que debe elevarse el izaje para no chocar
    if nroColDestino<geometria.nroHorizContBarco
        donde=nroColDestino+1;
    else
        donde=nroColDestino;
    end
    for i=1:1: donde
        if ySeguridadCarro<alturasContBarco(i)
            ySeguridadCarro=alturasContBarco(i);
        end
    end
    for i=nroColOrigen:1:geometria.nroHorizContMuelle
        if ySeguridadCarro<alturasContMuelle(i)
            ySeguridadCarro=alturasContMuelle(i);
        end
    end
    if ySeguridadCarro<=geometria.altoVigaTestera %evitar que los contenedores choquen con la viga testera
        ySeguridadCarro=geometria.altoVigaTestera;
    end
    y_origen=alturasContMuelle(nroColOrigen);
    y_origen=verificarChoquesLaterales(y_origen,nroColOrigen,geometria.nroHorizContMuelle,alturasContMuelle,geometria);
elseif x_origen<0 && x_destino<0
    title('movimiento de origen y destino en el muelle!!!')
    return
elseif x_origen>=0 && x_destino>=0
    title('movimiento de origen y destino en el barco!!!')
    return
    
end
ySeguridadCarro=ySeguridadCarro+cantContDeSeguridad*geometria.altoCont; %el sistema pasara siempre a una altura equivalente a dos contenedores cuando se desplace
lineaSeguridad=line([-30, 50], [ySeguridadCarro, ySeguridadCarro],'LineStyle','--');
lineaSeguridadAut=line([x_origen-3, x_origen+3], [y_origen+geometria.altoCont/2, y_origen+geometria.altoCont/2],'LineStyle','-');
y_origen = y_origen + alturaInicioAutomatico;

[alturaInicioDesplazamientoCarro]=trianguloAceleracion(ySeguridadCarro,x_origen,y_origen,betaTriangulo,nroColOrigen,alturasContBarco,alturasContMuelle,cantContDeSeguridad,geometria);
PosicionCarroInicioDescensoIzaje=trianguloDesaceleracion(ySeguridadCarro,x_origen,x_destino,y_destino,betaTriangulo,nroColDestino,alturasContBarco,alturasContMuelle,cantContDeSeguridad,geometria);


