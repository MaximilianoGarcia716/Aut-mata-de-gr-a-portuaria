function [alturaInicioDesplazamientoCarro]= trianguloAceleracion(ySeguridadCarro,x_origen,y_origen,betaTriangulo,nroColOrigen,alturasContBarco,alturasContMuelle,cantContDeSeguridad,geometria)
%encontrar la altura minima a la que el carro puede comenzar a moverse sin
%chocar contenedores que puedan haber debajo de la altura de seguridad
%para esto se va descendiendo de a poco y buscando con una linea de angulo
%beta si hay contenedores en la trayectoria. al encontrar un impacto se
%detiene la busqueda
% los valores de catetoVert y catetoHoriz se utilizan para determinar la alturaInicioDesplazamientoCarro

deltaAltura=1; %desciende de a 1 metro y evalua colisiones



if x_origen>0 %barco hacia el muelle  %TODO: esta condicion ya se verifico en la funcion calcularPuntosInicioMovimiento, codigo duplicado!!!
    %     y_origen=alturasContBarco(nroColOrigen);
    
    %descender desde la altura maxima hasta donde esta el contenedor a mover
    for i=ySeguridadCarro:-deltaAltura:y_origen     %for i=ySeguridadCarro:-geometria.altoCont:y_origen
        catetoVert= ySeguridadCarro-i;            %geometria.altoCont*( (ySeguridadCarro-i)/geometria.altoCont );
        catetoHoriz=tan(betaTriangulo)*catetoVert;
        if colisionBarcoAlMuelleAcel(catetoHoriz,ySeguridadCarro,betaTriangulo,x_origen,nroColOrigen,alturasContBarco,alturasContMuelle,geometria)
            break
        end
        
    end
else %desde el muelle hacia el barco
    %     y_origen=alturasContMuelle(nroColOrigen);
    
    %descender desde la altura maxima hasta donde esta el contenedor a mover
    for i=ySeguridadCarro:-deltaAltura:y_origen    %for i=ySeguridadCarro:-geometria.altoCont:y_origen
        catetoVert= ySeguridadCarro-i;      %geometria.altoCont*( (ySeguridadCarro-i)/geometria.altoCont );
        catetoHoriz=tan(betaTriangulo)*catetoVert;
        if colisionMuelleAlBarcoAcel(catetoHoriz,ySeguridadCarro,betaTriangulo,x_origen,nroColOrigen,alturasContBarco,alturasContMuelle,geometria)
            break
        end
        
    end %for
end %if muelle al barco


%dar una altura mayor para evitar colision entre el contenedor transportado
%y las columnas apiladas

if ((ySeguridadCarro-i)/geometria.altoCont)-cantContDeSeguridad >0.01
    catetoVert=geometria.altoCont*( ((ySeguridadCarro-i)/geometria.altoCont)-cantContDeSeguridad );
    catetoHoriz=(sin(betaTriangulo)*catetoVert)/cos(betaTriangulo);
    alturaInicioDesplazamientoCarro=ySeguridadCarro-catetoVert;
    %graficar la trayectoria
    dibujarTriang(x_origen,nroColOrigen,catetoHoriz,ySeguridadCarro,alturaInicioDesplazamientoCarro,geometria)
else %ascenso primero, luego mover el carro, ambos movimientos separados
    disp('en aceleracion no mover carro')
    alturaInicioDesplazamientoCarro=ySeguridadCarro;
end
