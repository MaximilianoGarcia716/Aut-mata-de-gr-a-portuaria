function PosicionCarroInicioDescensoIzaje=trianguloDesaceleracion(ySeguridadCarro,x_origen,x_destino,y_origen,betaTriangulo,nroColOrigen,alturasContBarco,alturasContMuelle,contenedoresDeSeguridad,geometria)
%encontrar el lugar de la trayectoria del carro donde el izaje puede comenzar a descender para evitar colisiones con contenedores que puedan haber debajo de la altura de seguridad
%nroColOrigen es el nroColDestino, se usan los mismos nombres de variables que en trianguloAceleracion
%y_origen es y_destino, se usan los mismos nombres de variables

deltaAltura=1; %desciende de a 1 metro y evalua colisiones

if x_destino<0  %x_origen>0 %barco hacia el muelle  %TODO: esta condicion ya se verifico en la funcion calcularPuntosInicioMovimiento, codigo duplicado!!!
    %descender desde la altura maxima hasta donde esta el contenedor a mover
    for i=ySeguridadCarro:-deltaAltura:y_origen        %     for i=ySeguridadCarro:-geometria.altoCont:y_origen
        catetoVert=geometria.altoCont*( (ySeguridadCarro-i)/geometria.altoCont );
        catetoHoriz=tan(betaTriangulo)*catetoVert;
        coordxTriangulo=x_destino+catetoHoriz;
        if coordxTriangulo > x_origen+5
            break
        end
        if colisionBarcoAlMuelleDesacel(catetoHoriz,ySeguridadCarro,betaTriangulo,x_destino,nroColOrigen,alturasContBarco,alturasContMuelle,geometria)
            break
        end
        
    end
else %desde el muelle hacia el barco
    %descender desde la altura maxima hasta donde esta el contenedor a mover
    for i=ySeguridadCarro:-deltaAltura:y_origen        %     for i=ySeguridadCarro:-geometria.altoCont:y_origen
        catetoVert=geometria.altoCont*( (ySeguridadCarro-i)/geometria.altoCont );
        catetoHoriz=tan(betaTriangulo)*catetoVert;
        if colisionMuelleAlBarcoDesacel(catetoHoriz,ySeguridadCarro,betaTriangulo,x_destino,nroColOrigen,alturasContBarco,alturasContMuelle,geometria)
            break
        end


    end %for
end %if muelle al barco


if ((ySeguridadCarro-i)/geometria.altoCont)-contenedoresDeSeguridad >0.01 %usando 0.01 se evitan errores numericos
    catetoVert=geometria.altoCont*( ((ySeguridadCarro-i)/geometria.altoCont)-contenedoresDeSeguridad );
    catetoHoriz=(sin(betaTriangulo)*catetoVert)/cos(betaTriangulo);
    alturaDondeDetieneDescensoIzaje=ySeguridadCarro-catetoVert;
    
    if x_destino<0 %se parte del barco hacia el muelle
        PosicionCarroInicioDescensoIzaje=nroColOrigen*geometria.divHoriz+geometria.xt_min+catetoHoriz;
        dibujarTriang(-1,nroColOrigen,catetoHoriz,ySeguridadCarro,alturaDondeDetieneDescensoIzaje,geometria)
    else %se parte desde el muelle hacia el barco
        PosicionCarroInicioDescensoIzaje=nroColOrigen*geometria.divHoriz-catetoHoriz;%nroColOrigen es el nroColDestino
        dibujarTriang(1,nroColOrigen,catetoHoriz,ySeguridadCarro,alturaDondeDetieneDescensoIzaje,geometria)
    end
else %ascenso primero, luego mover el carro, ambos movimientos separados
    disp('en desaceleracion no mover carro')
    PosicionCarroInicioDescensoIzaje=x_destino-10;
end



