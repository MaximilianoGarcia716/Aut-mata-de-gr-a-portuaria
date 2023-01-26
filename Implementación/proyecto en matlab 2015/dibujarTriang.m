function dibujarTriang(x_origen,nroColOrigen,catetoHoriz,ySeguridadCarro,alturaInicioDesplazamientoCarro,geometria)

global linea1 linea2

if x_origen>0 %barco hacia el muelle
%     delete(linea1)
    linea1=plot([nroColOrigen*geometria.divHoriz, nroColOrigen*geometria.divHoriz,nroColOrigen*geometria.divHoriz-catetoHoriz,nroColOrigen*geometria.divHoriz], [ySeguridadCarro, alturaInicioDesplazamientoCarro,ySeguridadCarro,ySeguridadCarro]);
    %         plot(nroColOrigen*geometria.divHoriz, alturaInicioDesplazamientoCarro, 'h')
    %         set(linea1,'visible','on')
    %linea4=plot([nroColOrigen*geometria.divHoriz, nroColOrigen*geometria.divHoriz,nroColOrigen*geometria.divHoriz-catetoHoriz,nroColOrigen*geometria.divHoriz], [ySeguridadCarro, alturaDondeDetieneDescensoIzaje,ySeguridadCarro,ySeguridadCarro]); %triangulo

else
%     delete(linea2)
    linea2=plot([nroColOrigen*geometria.divHoriz+geometria.xt_min, nroColOrigen*geometria.divHoriz+geometria.xt_min,nroColOrigen*geometria.divHoriz+geometria.xt_min+catetoHoriz,nroColOrigen*geometria.divHoriz+geometria.xt_min], [ySeguridadCarro, alturaInicioDesplazamientoCarro,ySeguridadCarro,ySeguridadCarro]);
    %         plot(nroColOrigen*geometria.divHoriz+geometria.xt_min, alturaInicioDesplazamientoCarro, 'h')
    %         set(linea2,'visible','on')
    %linea3=plot([nroColOrigen*geometria.divHoriz+geometria.xt_min, nroColOrigen*geometria.divHoriz+geometria.xt_min,nroColOrigen*geometria.divHoriz+geometria.xt_min+catetoHoriz,nroColOrigen*geometria.divHoriz+geometria.xt_min], [ySeguridadCarro, alturaDondeDetieneDescensoIzaje,ySeguridadCarro,ySeguridadCarro]); %triangulo

end

