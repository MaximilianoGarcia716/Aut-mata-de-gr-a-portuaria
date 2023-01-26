function []=dibujarSituacionInicial1(geometria)
%dibujar la situacion inicial del simulador
% global geometria %TODO: no usar variable global

hold on
global linea1 linea2 linea3 linea4
global holderBarco holderMuelle

linea1= line(0,0);linea2= line(0,0);linea3= line(0,0);linea4= line(0,0);
x = [-30 50]; y = [45 45]; plot(x,y,'g', 'LineWidth',2) %carro
x = [-30 50]; y = [40 40]; plot(x,y,'g', 'LineWidth',2) %carro
rectangle('Position',[-30,-20,30,20],'FaceColor', [0.25, 0.25, 0.25]); %rectangulo muelle
x = [geometria.xt_min_min-10 geometria.xt_min_min-10 geometria.xt_max_max+10 geometria.xt_max_max+10 geometria.xt_min_min-10]; y = [geometria.y_min_min-20 geometria.y_max_max+20 geometria.y_max_max+20 geometria.y_min_min-20 geometria.y_min_min-20]; plot(x,y, 'LineWidth',3) %cuadro exterior
x = [0 0 50 50]; y = [geometria.altoVigaTestera -20 -20 15]; plot(x,y, 'LineWidth',2) %barco y viga testera
xlim([-40 60]); ylim([-40 60]);
grid on

%graficar distribucion inicial de contenedores en el barco
for i=1: geometria.nroHorizContBarco
    for j=1:geometria.nroVertContBarco
        if geometria.contBarco(j,i)
            %graficar un rectangulo correspondiente
            coordXcontenedor=i*geometria.divHoriz;
            coordYcontenedor=-j*geometria.altoCont+ 60.57-2*geometria.altoCont+geometria.y_min_min; %TODO: de donde sale el valor 54.4?
            holderBarco (j,i)=rectangle('Position',[coordXcontenedor,coordYcontenedor,geometria.altoCont,geometria.anchoCont]); %x, y, alto, ancho
        end
    end
end

%muelle
for i=1: geometria.nroHorizContMuelle
    for j=1:geometria.nroVertContMuelle
        %crear un contenedor
        %geometria.contMuelle(j,i)=1;
        if geometria.contMuelle(j,i)
            %graficar un rectangulo correspondiente
            coordXcontenedor=i*geometria.divHoriz+geometria.xt_min;
            coordYcontenedor=-j*geometria.altoCont+geometria.nroVertContMuelle*geometria.altoCont;
            holderMuelle(j,i) = rectangle('Position',[coordXcontenedor,coordYcontenedor,geometria.altoCont,geometria.anchoCont]); %x, y, alto, ancho
        end
    end
end
end %function