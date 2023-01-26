function [detener] = colisionBarcoAlMuelleAcel(catetoHoriz,ySeguridadCarro,betaTriangulo,x_origen,nroColOrigen,alturasContBarco,alturasContMuelle,geometria)
%nroColOrigen es el nroColDestino, se usan los mismos nombres de variables que en trianguloAceleracion
%x_origen puede ser x_origen o x_origen, se usan los mismo nombres que en la funcion de colisionMuelleAlBarco

detener=0;


if x_origen >=0

    coordxTriangulo=x_origen-catetoHoriz;
    nroColActual=floor(coordxTriangulo/geometria.divHoriz);
%     iterador=1;
    
    for k=nroColOrigen:-1:nroColActual

        %verificar colisiones sobre el barco
        if k>=1
            %determinar la altura por donde pasaria la trayectoria
            cuantasColumnas=nroColOrigen-k;
            distHoriz=catetoHoriz-cuantasColumnas*geometria.divHoriz;
            distVertTrayectoria=distHoriz/tan(betaTriangulo);
            if alturasContBarco(k) > (ySeguridadCarro-distVertTrayectoria) %si la altura de la columna de contenedores es mayor que la trayectoria sobre la misma
                detener=1;
                break
            end
            %verificar colisiones sobre el muelle y viga testera
        else
            %determinar la altura por donde pasaria la trayectoria
            cuantasColumnas=nroColOrigen-k;
            distHoriz=catetoHoriz-cuantasColumnas*geometria.divHoriz;
            if distHoriz<0
%                 detener=1;
%                 break
                distHoriz=0;%poner el break aca????
            end
            distVertTrayectoria=distHoriz/tan(betaTriangulo);
            %viga testera
            if geometria.altoVigaTestera > (ySeguridadCarro-distVertTrayectoria) && coordxTriangulo<=0 %TODO: verificar si esta bien este condicional, si es coherente
                detener=1;
                break
            end
            %muelle
            if coordxTriangulo<=(geometria.nroHorizContMuelle+1)*geometria.divHoriz+geometria.xt_min %efectivamente la trayectoria pasa sobre los contenedores del muelle
                columnaCorresponde=geometria.nroHorizContMuelle+k;
                if columnaCorresponde<=0
                    detener=1;
                    break
                elseif alturasContMuelle(columnaCorresponde) > (ySeguridadCarro-distVertTrayectoria)
                    detener=1;
                    break
                end
            end
        end
%         iterador=iterador+1;
        
    end
    
    
    
    
else %hay que desacelerar sobre el muelle
    disp('error en aceleracion')
%     
%     coordxTriangulo=x_origen+catetoHoriz;
%     nroColActual=nroColOrigen + floor(abs( (x_origen-coordxTriangulo)/geometria.divHoriz  ));
%     iterador=1;
%     
%     for k=nroColOrigen:1:nroColActual
%         %determinar la altura por donde pasaria la trayectoria
%         distHoriz=iterador*geometria.divHoriz;
%         distVertTrayectoria=distHoriz/tan(betaTriangulo);
%         
%         %verificar colisiones sobre el muelle
%         if k<=geometria.nroHorizContMuelle
%             if alturasContMuelle(k) > (ySeguridadCarro-distVertTrayectoria) %si la altura de la columna de contenedores es mayor que la trayectoria sobre la misma
%                 detener=1;
%                 break
%             end
%             %verificar colisiones sobre el barco y viga testera
%         else
%             %viga testera
%             if geometria.altoVigaTestera > (ySeguridadCarro-distVertTrayectoria) && coordxTriangulo>=0 %TODO: verificar si esta bien este condicional, si es coherente
%                 detener=1;
%                 break
%             end
%             %barco
%             if coordxTriangulo>geometria.separacionEntreCont %efectivamente la trayectoria pasa sobre los contenedores del barco
%                 %                 columnaCorresponde=geometria.nroHorizContMuelle+k;
%                 %                 columnaCorresponde=floor(coordxTriangulo/geometria.divHoriz);
%                 columnaCorresponde=k-geometria.nroHorizContMuelle;
%                 if columnaCorresponde==0
%                     columnaCorresponde=1;
%                 end
%                 if columnaCorresponde> geometria.nroHorizContBarco
%                     detener=1;
%                     break
%                 elseif alturasContBarco(columnaCorresponde) > (ySeguridadCarro-distVertTrayectoria)
%                     detener=1;
%                     break
%                 end
%             end
%             
%         end
%         iterador=iterador+1;
%     end
    
end