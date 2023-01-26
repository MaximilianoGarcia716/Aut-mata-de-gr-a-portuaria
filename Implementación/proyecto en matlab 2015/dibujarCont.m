function dibujarCont(x_t)
%funcion que dibuja un contendor en la pila cuando se abre el gancho

global holderBarco holderMuelle geometria

[nroContMuelle,nroContBarco,alturasContMuelle,alturasContBarco] = determinarAlturasContenedores(geometria);

if x_t>=0 % barco 
    nroColOrigen=round(abs(x_t)/geometria.divHoriz); %%TODO:verficar que no se pase del maximo
    if nroColOrigen<1
        nroColOrigen=1;
    end
    %TODO: las lineas anteriores son muy parecidas a la funcion
    %calcularPuntosInicioMovimiento, codigo repetido!!!!!!!!!!
    vert=geometria.nroVertContBarco-nroContBarco(nroColOrigen);
    horiz=nroColOrigen;
    dimensiones=size(holderBarco);
    if vert <= dimensiones(1)
%         if ~isgraphics(holderBarco(vert,horiz))
            coordXcontenedor=horiz*geometria.divHoriz;
            coordYcontenedor=-vert*geometria.altoCont+ 60.57-2*geometria.altoCont+geometria.y_min_min;
            holderBarco (vert,horiz)=rectangle('FaceColor','blue','Position',[coordXcontenedor,coordYcontenedor,geometria.altoCont,geometria.anchoCont]);    %x, y, alto, ancho

            
            geometria.contBarco(vert,horiz)=1;
%         end
    else
        disp('error: se esta tratando de dibujar un contenedor por debajo del fondo del barco')
    end
    
elseif x_t<0 %en el muelle
    nroColOrigen=round(abs( (geometria.xt_min-x_t)/geometria.divHoriz));
    if nroColOrigen<1 %si la resta geometria.xt_min-x_origen es = a cero, significa que estoy en la primera columna
        nroColOrigen=1;
    end
    vert=geometria.nroVertContMuelle-nroContMuelle(nroColOrigen);
    horiz=nroColOrigen;
    dimensiones=size(holderMuelle);
    if vert <= dimensiones(1)
        coordXcontenedor=horiz*geometria.divHoriz+geometria.xt_min;
        coordYcontenedor=-vert*geometria.altoCont+geometria.nroVertContMuelle*geometria.altoCont;
        holderMuelle(vert,horiz) = rectangle('FaceColor','blue','Position',[coordXcontenedor,coordYcontenedor,geometria.altoCont,geometria.anchoCont]); %x, y, alto, ancho
        
        geometria.contMuelle(vert,horiz)=1;
    end
end
    
    
    