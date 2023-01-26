function borrarCont(x_t)%,x_destino)
%funcion que borra un contendor de la pila cuando se cierra el gancho

global holderBarco holderMuelle geometria

[nroContMuelle,nroContBarco,alturasContMuelle,alturasContBarco] = determinarAlturasContenedores(geometria);

if x_t>=0 %barco
    nroColOrigen=round(abs(x_t)/geometria.divHoriz); %usar round??? verficar que no se pase del maximo
    if nroColOrigen<1
        nroColOrigen=1;
    end
    if nroColOrigen>geometria.nroHorizContBarco
        nroColOrigen=geometria.nroHorizContBarco;
    end
    %TODO: las lineas anteriores son muy parecidas a la funcion
    %calcularPuntosInicioMovimiento, codigo repetido!!!!!!!!!!
    vert=geometria.nroVertContBarco-nroContBarco(nroColOrigen)+1;
    horiz=nroColOrigen;
    dimensiones=size(holderBarco);
    if vert <= dimensiones(1)
        if isgraphics(holderBarco(vert,horiz))
            delete(holderBarco(vert,horiz)  )
            geometria.contBarco(vert,horiz)=0;
        end
    else
        disp('ya no quedan contenedores en esta columna!')
    end
elseif x_t<0
    nroColOrigen=round(abs( (geometria.xt_min-x_t)/geometria.divHoriz));
    if nroColOrigen<1 %si la resta geometria.xt_min-x_origen es = a cero, significa que estoy en la primera columna
        nroColOrigen=1;
    end
    vert=geometria.nroVertContMuelle-nroContMuelle(nroColOrigen)+1;
    horiz=nroColOrigen;
    dimensiones=size(holderMuelle);
    if vert <= dimensiones(1)
        if isgraphics(holderMuelle(vert,horiz))
            delete(holderMuelle(vert,horiz)  )
            geometria.contMuelle(vert,horiz)=0;
        end
    end
end




