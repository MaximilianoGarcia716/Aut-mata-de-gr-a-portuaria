function y_destino = verificarChoquesLaterales(cuantosCont,y_destino,nroColDestino,nroMaxCont,alturasContenedores,geometria)
%verificar si a cada lado del destino la pila de contenedores es mas
%alta, de ser asi, modificar el valor de la y_destino para evitar choques
%laterales debido a las oscilaciones
%se sube la y_destino hasta la altura de dos columnas de contenedores a
%cada lado
if nroColDestino==1
    inicio=1;
    fin=nroColDestino+cuantosCont;
elseif nroColDestino==2
    inicio=1;
    fin=nroColDestino+cuantosCont;
elseif nroColDestino==nroMaxCont-1
    inicio = nroColDestino -cuantosCont;
    fin=nroColDestino+1;
elseif nroColDestino==nroMaxCont %esta en la ultima columna
    inicio = nroColDestino -cuantosCont;
    fin=nroColDestino;
    if alturasContenedores(nroMaxCont)< geometria.altoVigaTestera
        y_destino=geometria.altoVigaTestera; %evitar choque con la pared del barco
    end 
else %esta en cualquier posicion intermedia
    inicio = nroColDestino - cuantosCont;
    fin=nroColDestino + cuantosCont;
end
for i=inicio:fin
    if nroColDestino~=i
        if alturasContenedores(i) > y_destino %al lado es mas alto
            y_destino=alturasContenedores(i);
        end
    end
end