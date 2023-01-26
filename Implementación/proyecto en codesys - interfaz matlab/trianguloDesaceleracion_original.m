function PosicionCarroInicioDescensoIzaje=trianguloDesaceleracion(ySeguridadCarro,x_destino,betaTriangulo,nroColDestino,alturasContBarco,geometria)
%encontrar el lugar de la trayectoria del carro donde el izaje puede
%comenzar a descender para evitar colisiones con contenedores que puedan
%haber debajo de la altura de seguridad

global linea3 linea4

detener=0;
y_destino=alturasContBarco(nroColDestino);
for i=ySeguridadCarro:-geometria.altoCont:y_destino %descender desde la altura maxima hasta donde debe dejarse el contenedor
    
    if x_destino<0 %se parte del barco hacia el muelle
        %%
        %determinar desde cual fila se debe evaluar si la grua choca con los contenedores
        catetoVert=geometria.altoCont*( (ySeguridadCarro-i)/geometria.altoCont );
        catetoHoriz=(sin(betaTriangulo)*catetoVert)/cos(betaTriangulo);
        xTriangulo=x_destino+catetoHoriz;
        nroColActual=nroColDestino + floor(abs( (x_destino-xTriangulo)/geometria.divHoriz  ));
        iterador=1;
        if nroColActual<=geometria.nroHorizContMuelle+1 %se suma 1 para encontrar impactos con la viga testera
            if nroColActual==geometria.nroHorizContMuelle+1 %para evitar choque con la viga testera se eleva a la maxima altura de seguridad
                disp('desaceleracion pasa sobre la viga testera')
                %TODO: esto es ineficiente y se puede pasar a una altura menor
                break
            else
                for k=nroColDestino:1:nroColActual
                    %determinar la altura por donde pasaria la trayectoria
                    distHoriz=iterador*geometria.divHoriz; %abs(nroColOrigen-k)*geometria.divHoriz %iterador*geometria.divHoriz;
                    distVertTrayectoria=distHoriz/tan(betaTriangulo);
                    
%                     plot(k*geometria.divHoriz+geometria.xt_min, alturasCont(k), '*')
                    %se detecta el impacto
                    if alturasContBarco(k) > (ySeguridadCarro-distVertTrayectoria)
                        detener=1;
                        break
                    end
                    iterador=iterador+1;
                end
            end
            if detener
                break
            end
        else
            disp('implementar busqueda en el barco!!!')
            break
        end
    else %se parte desde el muelle hacia el barco
        %%
        catetoVert=geometria.altoCont*( (ySeguridadCarro-i)/geometria.altoCont );
        catetoHoriz=(sin(betaTriangulo)*catetoVert)/cos(betaTriangulo);
        xTriangulo=x_destino-catetoHoriz;
        nroColActual=floor(xTriangulo/geometria.divHoriz);
        iterador=1;
        if nroColActual<=0
            disp('desaceleracion pasa sobre la viga testera!!!!')
            %TODO: esto es ineficiente y se puede pasar a una altura menor
            break
        else
            for k=nroColActual:1:nroColDestino
                %determinar la altura por donde pasaria la trayectoria
                distHoriz=iterador*geometria.divHoriz; %abs(nroColOrigen-k)*geometria.divHoriz %iterador*geometria.divHoriz;
                distVertTrayectoria=distHoriz/tan(betaTriangulo);
                
%                 plot(k*geometria.divHoriz, alturasCont(k), '*')
                %se detecta el impacto
                if alturasContMuelle(k) > (ySeguridadCarro-distVertTrayectoria)
                    detener=1;
                    break
                end
                iterador=iterador+1;
            end
        end
        if detener
            break
        end
    end
end
if ((ySeguridadCarro-i)/geometria.altoCont)-2 > 0.001 %verificar que sea posible mover el carro simultaneamente con el izaje
    catetoVert=geometria.altoCont*( ((ySeguridadCarro-i)/geometria.altoCont)-2 );  %el numero que se resta es el espacio libre entre la grua y la columna de contenedores, medido en multiplos de geometria.altoCont, se mide desde el gancho y se elige un espacio libre mas 1 contenedor
    catetoHoriz=(sin(betaTriangulo)*catetoVert)/cos(betaTriangulo);
    alturaDondeDetieneDescensoIzaje=ySeguridadCarro-catetoVert; %+geometria.altoCont
    %k*geometria.divHoriz
    if x_destino<0 %se parte del barco hacia el muelle
        linea3=plot([nroColDestino*geometria.divHoriz+geometria.xt_min, nroColDestino*geometria.divHoriz+geometria.xt_min,nroColDestino*geometria.divHoriz+geometria.xt_min+catetoHoriz,nroColDestino*geometria.divHoriz+geometria.xt_min], [ySeguridadCarro, alturaDondeDetieneDescensoIzaje,ySeguridadCarro,ySeguridadCarro]); %triangulo
%         plot(nroColDestino*geometria.divHoriz+geometria.xt_min, alturaDondeDetieneDescensoIzaje, 'h')
        set(linea3,'visible','on')
        PosicionCarroInicioDescensoIzaje=nroColDestino*geometria.divHoriz+geometria.xt_min+catetoHoriz;
    else %se parte desde el muelle hacia el barco
        linea4=plot([nroColDestino*geometria.divHoriz, nroColDestino*geometria.divHoriz,nroColDestino*geometria.divHoriz-catetoHoriz,nroColDestino*geometria.divHoriz], [ySeguridadCarro, alturaDondeDetieneDescensoIzaje,ySeguridadCarro,ySeguridadCarro]); %triangulo
%         plot(nroColDestino*geometria.divHoriz, alturaDondeDetieneDescensoIzaje, 'h')
        set(linea4,'visible','on')
        PosicionCarroInicioDescensoIzaje=nroColDestino*geometria.divHoriz-catetoHoriz;
    end
else %ascenso primero, luego mover el carro, ambos movimientos separados
    disp('en desaceleracion no mover carro')
    alturaDondeDetieneDescensoIzaje=ySeguridadCarro; 
    PosicionCarroInicioDescensoIzaje=x_destino;
end

% rectangle('Position',[nroColDestino*geometria.divHoriz+catetoHoriz+geometria.xt_min,ySeguridadCarro-geometria.altoCont,geometria.altoCont,anchoCont],'FaceColor','red') % posicion del contenedor cuando alcanza la altura de seguridad
% rectangle('Position',[nroColDestino*geometria.divHoriz+geometria.xt_min,alturaInicioDescensoIzaje-geometria.altoCont,geometria.altoCont,anchoCont],'FaceColor','blue') %posicion del contenedor cuando empieza el movimiento del carro


end


