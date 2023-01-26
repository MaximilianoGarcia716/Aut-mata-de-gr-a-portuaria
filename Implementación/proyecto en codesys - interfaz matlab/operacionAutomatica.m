function [finOperacion,vh,vt]=operacionAutomatica(alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,ySeguridadCarro,x_origen,x_destino,x_actual,y_actual,geometria)  
% global y_max y_max_max y_min y_min_min 
% global xt_max xt_max_max xt_min xt_min_min 
% global altoCont anchoCont separacionEntreCont altoVigaTestera
% global yDistrBarco nroVertContBarco xDistrBarco divHoriz nroHorizContBarco contBarco
% global yDistrMuelle nroVertContMuelle xDistrMuelle nroHorizContMuelle contMuelle 
% global x_origen x_destino
%global y_actual x_actual %es la posicion actual del gancho
%inicialmente es necesario mover el carro y el izaje para que se ubique
%sobre el contenedor a mover para luego proseguir con los resultados del
%generador de trayectorias

disp('operacion Automatica')
% inicializar variables
vt=0;
vh=0;

vmaxh=3;%TODO: estos valores dependen del gancho, corregir!!!!!!!!!!!
vmaxt=4;

%determinar el perfil de alturas de contenedores del barco
alturasContBarco=zeros(1,geometria.nroHorizContBarco);
cantidadCont=0;
for j=1:1:geometria.nroHorizContBarco
    %determinar la altura del contenedor actual
    for i=1:geometria.nroVertContBarco
        if geometria.contBarco(i,j)
            cantidadCont=geometria.nroVertContBarco-i+1;
            break
        end
    end
    alturaActual=cantidadCont*geometria.altoCont+geometria.y_min;
    alturasContBarco(j)=alturaActual;
    %     plot(j*geometria.divHoriz, alturaActual, 'o')
end
%determinar el perfil de alturas de contenedores del muelle
alturasContMuelle=zeros(1,geometria.nroHorizContMuelle);
cantidadCont=0;
for j=1:1:geometria.nroHorizContMuelle
    %determinar la altura del contenedor actual
    for i=1:geometria.nroVertContMuelle
        if geometria.contMuelle(i,j)
            cantidadCont=geometria.nroVertContMuelle-i+1;
            break
        end
    end
    alturaActual=cantidadCont*geometria.altoCont;
    alturasContMuelle(j)=alturaActual;
    %plot(j*geometria.divHoriz+geometria.xt_min, alturaActual, 'o')
end



ySeguridadCarro
x_origen
x_destino
x_actual
y_actual


%operar segun el generador de trayectorias: subir - mover carro - bajar
if x_origen>=0 && x_destino<0 %ida desde el barco hasta el muelle
    disp('barco al muelle')
%     %determinar las coordenadas "Y" de las trayectorias y graficar
%     nroColOrigen=floor(abs(x_origen)/geometria.divHoriz);
%     y_origen=alturasContBarco(nroColOrigen);
% %     rectangle('Position',[x_origen,y_origen-geometria.altoCont,geometria.altoCont,anchoCont],'FaceColor','green')
%     nroColDestino=round(abs( (geometria.xt_min-x_destino)/geometria.divHoriz)); %revisar modificando la x_destino
%     y_destino=alturasContMuelle(nroColDestino);
% %     rectangle('Position',[x_destino,y_destino-geometria.altoCont,geometria.altoCont,anchoCont],'FaceColor','green')
%     
%     if (y_actual<ySeguridad)
%         %se establecen las velocidades del izaje
%         %TODO: esta velocidad debe corregirse si el izaje esta cerca de los limites
%         %TODO: hay que decidir si se usa la v maxima (gancho vacio) o si se
%         %usa la v max con el izaje cargado
%         vh=vmaxh; %este valor debe actualizarse en el automata, primer valor es la v hacia arriba y el segundo es la v hacia abajo
%     end
%     if y_actual>=alturaInicioDesplazamientoCarro
%         vt=-vmaxt; %se mueve a la izquierda
%     end
%     
%     
%     
% %     vh=vhPermitida(1);
    
elseif x_origen<0 && x_destino>=0 %
    disp('muelle al barco')
    nroColOrigen=round(abs( (geometria.xt_min-x_origen)/geometria.divHoriz))
    if nroColOrigen==0 %si la resta geometria.xt_min-x_origen es = a cero, significa que estoy en la primera columna
        nroColOrigen=1;
    end
%     y_origen=alturasContMuelle(nroColOrigen);
    nroColDestino=floor(abs(x_destino)/geometria.divHoriz)
    y_destino=alturasContBarco(nroColDestino);
    if (y_actual<ySeguridadCarro)
        disp('izaje subiendo')
        %se establecen las velocidades del izaje
        %TODO: esta velocidad debe corregirse si el izaje esta cerca de los limites
        %TODO: hay que decidir si se usa la v maxima (gancho vacio) o si se
        %usa la v max con el izaje cargado
        vh=-vmaxh; %este valor debe actualizarse en el automata
    else
        disp('izaje mas alto que la ySeguridad, bajar o mover carro')
        vh=0;
    end
    %subir y desplazar el carro
    if y_actual>=alturaInicioDesplazamientoCarro
        vt=vmaxt; %se mueve a la derecha %TODO: pasar como parametros!!!!!!!!!
    end

%     finOperacion=1;
%     return
end




finOperacion=0;
end