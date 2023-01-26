function [alturaInicioDesplazamientoCarro,catetoHoriz]= trianguloAceleracion(ySeguridadCarro,x_origen,betaTriangulo,nroColOrigen,alturasContenedores,geometria)
%encontrar la altura minima a la que el carro puede comenzar a moverse sin
%chocar contenedores que puedan haber debajo de la altura de seguridad
%para esto se va descendiendo de a poco y buscando con una linea de angulo
%beta si hay contenedores en la trayectoria. al encontrar un impacto se
%detiene la busqueda

% los valores de catetoVert y catetoHoriz se utilizan para determinar la alturaInicioDesplazamientoCarro

global linea1 linea2




y_origen=alturasContenedores(nroColOrigen);
detener=0;
catetoHoriz=0;
for i=ySeguridadCarro:-geometria.altoCont:y_origen %descender desde la altura maxima hasta donde esta el contenedor a mover
    
    if x_origen>0 %barco hacia el muelle  %TODO: esta condicion ya se verifico en la funcion calcularPuntosInicioMovimiento, codigo duplicado!!!
        %%
        %determinar desde cual fila se debe evaluar si la grua choca con los contenedores
        catetoVert=geometria.altoCont*( (ySeguridadCarro-i)/geometria.altoCont );
        catetoHoriz=(sin(betaTriangulo)*catetoVert)/cos(betaTriangulo);
        xTriangulo=x_origen-catetoHoriz;
        nroColActual=floor(xTriangulo/geometria.divHoriz);
        iterador=1;
        %             if nroColActual>=0 %TODO: es necesaria esta verificacion?????
        %para evitar choque con la viga testera se eleva a la maxima altura de seguridad
        if nroColActual<=0
            disp('aceleracion pasa sobre la viga testera, nroColActual=')
            disp(nroColActual)
            
            
            
            
            break
        else
            for k=nroColActual:1:nroColOrigen
                %determinar la altura por donde pasaria la trayectoria
                distHoriz=iterador*geometria.divHoriz; %abs(nroColOrigen-k)*geometria.divHoriz %iterador*geometria.divHoriz;
                distVertTrayectoria=distHoriz/tan(betaTriangulo);
                plot(k*geometria.divHoriz, alturasContenedores(k), '*')
                
                %se detecta el impacto
                if alturasContenedores(k) > (ySeguridadCarro-distVertTrayectoria)
                    detener=1;
                    break
                end
                iterador=iterador+1;
            end
        end
        if detener
            break
        end
    else %desde el muelle hacia el barco
        %%
        catetoVert=geometria.altoCont*( (ySeguridadCarro-i)/geometria.altoCont );
        catetoHoriz=(sin(betaTriangulo)*catetoVert)/cos(betaTriangulo);
        xTriangulo=x_origen+catetoHoriz;
        nroColActual=nroColOrigen + floor(abs( (x_origen-xTriangulo)/geometria.divHoriz  ));
        iterador=1;
        if nroColActual<=geometria.nroHorizContMuelle+1 %se suma 1 para encontrar impactos con la viga testera
            for k=nroColOrigen:1:nroColActual
                %determinar la altura por donde pasaria la trayectoria
                distHoriz=iterador*geometria.divHoriz; %abs(nroColOrigen-k)*geometria.divHoriz %iterador*geometria.divHoriz;
                distVertTrayectoria=distHoriz/tan(betaTriangulo);
                %se detecta el impacto
                if nroColActual==geometria.nroHorizContMuelle+1 %viga testera
                    if geometria.altoVigaTestera > (ySeguridadCarro-distVertTrayectoria) %TODO: verificar si esta bien este condicional, si es coherente
                        detener=1;
                        break
                    end
                else
                    if alturasContenedores(k) > (ySeguridadCarro-distVertTrayectoria)
                        detener=1;
                        break
                    end
                end
                %colocar aca la verificacion de colisiones sobre el barco
                
                
                
                iterador=iterador+1;
            end
            if detener, break, end %poner esta linea debajo del condicional if de la linea 63
        else
            disp('triang aceleracion pasa despues de la viga testera.....')
            %se deben verificar colisiones sobre el barco
            %cuantas columnas de contenedores se deben verificar?
            columnasRestantes=nroColActual-geometria.nroHorizContMuelle
%             for k=nroColOrigen:1:columnasRestantes
%                 %determinar la altura por donde pasaria la trayectoria
%                 distHoriz=iterador*geometria.divHoriz; %abs(nroColOrigen-k)*geometria.divHoriz %iterador*geometria.divHoriz;
%                 distVertTrayectoria=distHoriz/tan(betaTriangulo);
%                 %se detecta el impacto
%                 
%             
            
            
            break
        end
    end
end %for






if ((ySeguridadCarro-i)/geometria.altoCont)-2 > 0.001 %verificar que sea posible mover el carro simultaneamente con el izaje
    catetoVert=geometria.altoCont*( ((ySeguridadCarro-i)/geometria.altoCont)-2 );  %el numero que se resta es el espacio libre entre la grua y la columna de contenedores, medido en multiplos de geometria.altoCont, se mide desde el gancho y se elige un espacio libre mas 1 contenedor
    catetoHoriz=(sin(betaTriangulo)*catetoVert)/cos(betaTriangulo);
    alturaInicioDesplazamientoCarro=ySeguridadCarro-catetoVert; %+geometria.altoCont
    if x_origen>0 %se parte del barco hacia el muelle
        linea1=plot([nroColOrigen*geometria.divHoriz, nroColOrigen*geometria.divHoriz,nroColOrigen*geometria.divHoriz-catetoHoriz,nroColOrigen*geometria.divHoriz], [ySeguridadCarro, alturaInicioDesplazamientoCarro,ySeguridadCarro,ySeguridadCarro]); %triangulo
%         plot(nroColOrigen*geometria.divHoriz, alturaInicioDesplazamientoCarro, 'h')
%         set(linea1,'visible','on')
    else
        linea2=plot([nroColOrigen*geometria.divHoriz+geometria.xt_min, nroColOrigen*geometria.divHoriz+geometria.xt_min,nroColOrigen*geometria.divHoriz+geometria.xt_min+catetoHoriz,nroColOrigen*geometria.divHoriz+geometria.xt_min], [ySeguridadCarro, alturaInicioDesplazamientoCarro,ySeguridadCarro,ySeguridadCarro]); %triangulo
%         plot(nroColOrigen*geometria.divHoriz+geometria.xt_min, alturaInicioDesplazamientoCarro, 'h')
%         set(linea2,'visible','on')
    end
else %ascenso primero, luego mover el carro, ambos movimientos separados
    disp('en aceleracion no mover carro')
    alturaInicioDesplazamientoCarro=ySeguridadCarro;
end

%     rectangle('Position',[nroColOrigen*geometria.divHoriz-catetoHoriz,ySeguridadCarro-geometria.altoCont,geometria.altoCont,anchoCont],'FaceColor','red') % posicion del contenedor cuando alcanza la altura de seguridad
%     rectangle('Position',[nroColOrigen*geometria.divHoriz,alturaInicioDesplazamientoCarro-geometria.altoCont,geometria.altoCont,anchoCont],'FaceColor','blue') %posicion del contenedor cuando empieza el movimiento del carro

end