function [nroContMuelle,nroContBarco,alturasContMuelle,alturasContBarco] = determinarAlturasContenedores(geometria)
%determinar el perfil de alturas de contenedores y el nro de
%contenedores en cada columna

%barco
alturasContBarco=zeros(1,geometria.nroHorizContBarco);
cantidadCont=0;
for j=1:1:geometria.nroHorizContBarco
    %determinar la altura del contenedor actual
    %TODO:mover cantidadCont=0; a esta linea
    for i=1:geometria.nroVertContBarco
        if geometria.contBarco(i,j)
            cantidadCont=geometria.nroVertContBarco-i+1;
            break
        end
    end
    nroContBarco(j)=cantidadCont;%revisar
    alturaActual=cantidadCont*geometria.altoCont+geometria.y_min;
    alturasContBarco(j)=alturaActual;
%     plot(j*geometria.divHoriz, alturaActual, 'o')
end
% muelle
alturasContMuelle=zeros(1,geometria.nroHorizContMuelle);
for j=1:1:geometria.nroHorizContMuelle
    cantidadCont=0;
    %determinar la altura del contenedor actual
    for i=1:geometria.nroVertContMuelle
        if geometria.contMuelle(i,j)
            cantidadCont=geometria.nroVertContMuelle-i+1;
            break
        end
    end
    nroContMuelle(j)=cantidadCont;%revisar
    alturaActual=cantidadCont*geometria.altoCont;
    alturasContMuelle(j)=alturaActual;
%     plot(j*geometria.divHoriz+geometria.xt_min, alturaActual, 'o')
end

end