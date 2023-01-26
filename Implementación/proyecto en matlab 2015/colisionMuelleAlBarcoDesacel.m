function detener = colisionMuelleAlBarcoDesacel(catetoHoriz,ySeguridadCarro,betaTriangulo,x_destino,nroColOrigen,alturasContBarco,alturasContMuelle,geometria)

detener=0;

coordxTriangulo=x_destino-catetoHoriz;
nroColActual=floor(coordxTriangulo/geometria.divHoriz);
% iterador=1;

for k=nroColOrigen:-1:nroColActual
    
%     distHoriz=iterador*geometria.divHoriz;
%     distVertTrayectoria=distHoriz/tan(betaTriangulo);
    
    %     %verificar colisiones sobre el barco
    %     if k>=1
    %         if alturasContBarco(k) > (ySeguridadCarro-distVertTrayectoria) %si la altura de la columna de contenedores es mayor que la trayectoria sobre la misma
    %             detener=1;
    %             break
    %         end
    
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
        %     else
        %         %viga testera
        %         if geometria.altoVigaTestera > (ySeguridadCarro-distVertTrayectoria) && coordxTriangulo<=0 %TODO: verificar si esta bien este condicional, si es coherente
        %             detener=1;
        %             break
        %         end
        %         %muelle
        %         if coordxTriangulo<=(geometria.nroHorizContMuelle+1)*geometria.divHoriz+geometria.xt_min %efectivamente la trayectoria pasa sobre los contenedores del muelle
        %             columnaCorresponde=geometria.nroHorizContMuelle+k;
        %             if columnaCorresponde<=0
        %                 detener=1;
        %                 break
        %             elseif alturasContMuelle(columnaCorresponde) > (ySeguridadCarro-distVertTrayectoria)
        %                 detener=1;
        %                 break
        %             end
        %         end
        %     end
        
        
        
        
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
    
    
    
    
    
%     iterador=iterador+1;
    
end



