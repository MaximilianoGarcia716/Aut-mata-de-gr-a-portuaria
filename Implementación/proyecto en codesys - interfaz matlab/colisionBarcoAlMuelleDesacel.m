% function detener = colisionBarcoAlMuelleDesacel(catetoHoriz,ySeguridadCarro,betaTriangulo,x_destino,nroColOrigen,alturasContBarco,alturasContMuelle,geometria)
function detener = colisionBarcoAlMuelleDesacel(catetoHoriz,ySeguridadCarro,betaTriangulo,x_origen,nroColOrigen,alturasContBarco,alturasContMuelle,geometria)


%nroColOrigen es el nroColDestino, se usan los mismos nombres de variables que en trianguloAceleracion
%x_origen puede ser x_origen o x_destino, se usan los mismo nombres que en la funcion de colisionMuelleAlBarco


%TODO: verificar que la x_origen no este antes de la posicion actual del
%carro y hacer detener=1





detener=0;

if x_origen >=0    %hay que desacelerar sobre el barco
% if x_destino >=0    %hay que desacelerar sobre el barco
    
%     detener = colisionMuelleAlBarcoDesacel(catetoHoriz,ySeguridadCarro,betaTriangulo,x_origen,nroColOrigen,alturasContBarco,alturasContMuelle,geometria);
    disp('error en colisionBarcoAlMuelleDesacel')

else %hay que desacelerar sobre el muelle
    
    
    
    
    
    
    
    detener=0;

coordxTriangulo=x_origen+catetoHoriz;
nroColActual=nroColOrigen + floor(abs( (x_origen-coordxTriangulo)/geometria.divHoriz  ));
% iterador=1;

%TODO: este codigo es exactamente igual que colisionBarcoAlMuelleDesacel

for k=nroColOrigen:1:nroColActual
    %     %determinar la altura por donde pasaria la trayectoria

    %verificar colisiones sobre el muelle
    if k<=geometria.nroHorizContMuelle
        %determinar la altura por donde pasaria la trayectoria
        cuantasColumnas=k;%nroColOrigen-k;
        distHoriz=catetoHoriz-cuantasColumnas*geometria.divHoriz;
        distVertTrayectoria=distHoriz/tan(betaTriangulo);
        if alturasContMuelle(k) > (ySeguridadCarro-distVertTrayectoria) %si la altura de la columna de contenedores es mayor que la trayectoria sobre la misma
            detener=1;
            break
        end
        
        
        %verificar colisiones sobre el barco y viga testera
    else
        
        %determinar la altura por donde pasaria la trayectoria
        cuantasColumnas=k;
        cte=20; 
        distHoriz=catetoHoriz-cuantasColumnas*geometria.divHoriz+cte;
        %             distHoriz=catetoHoriz-geometria.divHoriz*geometria.nroHorizContMuelle-cte-cuantasColumnas*geometria.divHoriz;
        if distHoriz<0
            %                 detener=1;
            %                 break
            distHoriz=0;%poner el break aca????
        end
        distVertTrayectoria=distHoriz/tan(betaTriangulo);

        %         else %verificar colisiones sobre el barco y viga testera
        
        %viga testera
        if geometria.altoVigaTestera > (ySeguridadCarro-distVertTrayectoria) && coordxTriangulo>=0 %TODO: verificar si esta bien este condicional, si es coherente
            detener=1;
            break
        end
        %         %barco

        if coordxTriangulo>geometria.separacionEntreCont %efectivamente la trayectoria pasa sobre los contenedores del barco
            %                 columnaCorresponde=geometria.nroHorizContMuelle+k;
            %                 columnaCorresponde=floor(coordxTriangulo/geometria.divHoriz);
            columnaCorresponde=k-geometria.nroHorizContMuelle;
            if columnaCorresponde==0
                columnaCorresponde=1;
            end
            if columnaCorresponde> geometria.nroHorizContBarco
                detener=1;
                break
            elseif alturasContBarco(columnaCorresponde) > (ySeguridadCarro-distVertTrayectoria)
                detener=1;
                break
            end
        end
        
        
    end
%     iterador=iterador+1;
end
    
    
    
    
    
    
    
    
%     
%     coordxTriangulo=x_destino+catetoHoriz;
%     nroColActual=nroColOrigen + floor(abs( (x_destino-coordxTriangulo)/geometria.divHoriz  ));
%     
%     for k=nroColOrigen:1:nroColActual
%         %         %determinar la altura por donde pasaria la trayectoria
%         
%         %verificar colisiones sobre el muelle
%         if k<=geometria.nroHorizContMuelle
%             %determinar la altura por donde pasaria la trayectoria
%             cuantasColumnas=k;%nroColOrigen-k;
%             distHoriz=catetoHoriz-cuantasColumnas*geometria.divHoriz;
%             distVertTrayectoria=distHoriz/tan(betaTriangulo);
%             if alturasContMuelle(k) > (ySeguridadCarro-distVertTrayectoria) %si la altura de la columna de contenedores es mayor que la trayectoria sobre la misma
%                 detener=1;
%                 break
%             end
%             
%             %verificar colisiones sobre el barco y viga testera
%         else
%             
%             %determinar la altura por donde pasaria la trayectoria
%             cuantasColumnas=k;
%             cte=15; %distancia entre el ultimo cont del muelle y el primero del barco, este valor se puede aumentar para que la trayectoria sea mas conservadora, o sea, para que pase mas lejos de los contenedores
%             distHoriz=catetoHoriz-cuantasColumnas*geometria.divHoriz+cte;
% %             distHoriz=catetoHoriz-geometria.divHoriz*geometria.nroHorizContMuelle-cte-cuantasColumnas*geometria.divHoriz;
%             if distHoriz<0
% %                 detener=1;
% %                 break
%                 distHoriz=0;%poner el break aca????
%             end
%             distVertTrayectoria=distHoriz/tan(betaTriangulo);
%             
%             
%             
%             %viga testera
%             if geometria.altoVigaTestera > (ySeguridadCarro-distVertTrayectoria) && coordxTriangulo>=0 %TODO: verificar si esta bien este condicional, si es coherente, verificar usando contenedores en el barco a baja altura
%                 detener=1;
%                 break
%             end
%             %barco
%             if coordxTriangulo>geometria.separacionEntreCont %efectivamente la trayectoria pasa sobre los contenedores del barco
%                 %                 columnaCorresponde=geometria.nroHorizContMuelle+k;
% %                 columnaCorresponde=floor(coordxTriangulo/geometria.divHoriz);
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
% %         iterador=iterador+1;
%     end
    
end