%parametros
%parametros necesarios para el funcionamiento de la interfaz grafica y la
%generacion de trayectorias
% fprintf('ParametrosGUIyTrayectoria\n')

%se definen variables globales para acceder desde la funcion de calculo de
%trayectoria
global y_max y_max_max y_min y_min_min 
global xt_max xt_max_max xt_min xt_min_min 
global altoCont anchoCont separacionEntreCont altoVigaTestera
global yDistrBarco nroVertContBarco xDistrBarco divHoriz nroHorizContBarco contBarco
global yDistrMuelle nroVertContMuelle xDistrMuelle nroHorizContMuelle contMuelle 














%%




% global x_origen x_destino
%limites del carro - trolley
xt_max=50;
xt_max_max=51;
xt_min=-30;
xt_min_min=-31;
%limites del izaje
y_max=40;
y_max_max=41;
y_min=-20;
y_min_min=-21;
%parametros de los contenedores
altoCont=2.591;   %metros
anchoCont=2.438;
%largoCont=6.058;
separacionEntreCont=0.5;

%distribucion de contenedores en el barco
yDistrBarco=(y_max-y_min)-2*altoCont;   % va desde -20 hasta 40m
nroVertContBarco=floor(yDistrBarco/altoCont);
xDistrBarco=xt_max;             % va desde el origen hasta los 50m
divHoriz=anchoCont+separacionEntreCont;
nroHorizContBarco=floor((xDistrBarco-anchoCont)/divHoriz);
contBarco=zeros(nroVertContBarco,nroHorizContBarco);

%distribucion de contenedores en el muelle
yDistrMuelle=(y_max-altoCont)/2;%llenar muelle hasta la mitad de la altura para mayor comodidad en la operacion
nroVertContMuelle=floor(yDistrMuelle/altoCont);
xDistrMuelle=abs(xt_min+anchoCont);
nroHorizContMuelle=floor((xDistrMuelle-anchoCont)/divHoriz);
contMuelle=zeros(nroVertContMuelle,nroHorizContMuelle);
altoVigaTestera=15;




%%
%guardar los datos de la geometria de la situacion en una estructura de
%datos
% geometria.xt_max=50;


%limites del carro - trolley
geometria.xt_max=50;
geometria.xt_max_max=51;
geometria.xt_min=-30;
geometria.xt_min_min=-31;
%limites del izaje
geometria.y_max=40;
geometria.y_max_max=41;
geometria.y_min=-20;
geometria.y_min_min=-21;
%parametros de los contenedores
geometria.altoCont=2.591;   %metros
geometria.anchoCont=2.438;
%largoCont=6.058;
geometria.separacionEntreCont=0.5;

%distribucion de contenedores en el barco
yDistrBarco=(y_max-y_min)-2*altoCont;   % va desde -20 hasta 40m
geometria.nroVertContBarco=floor(yDistrBarco/altoCont);
xDistrBarco=xt_max;             % va desde el origen hasta los 50m
geometria.divHoriz=anchoCont+separacionEntreCont;
geometria.nroHorizContBarco=floor((xDistrBarco-anchoCont)/divHoriz);
geometria.contBarco=zeros(nroVertContBarco,nroHorizContBarco);

%distribucion de contenedores en el muelle
yDistrMuelle=(y_max-altoCont)/2;%llenar muelle hasta la mitad de la altura para mayor comodidad en la operacion
geometria.nroVertContMuelle=floor(yDistrMuelle/altoCont);
xDistrMuelle=abs(xt_min+anchoCont);
geometria.nroHorizContMuelle=floor((xDistrMuelle-anchoCont)/divHoriz);
geometria.contMuelle=zeros(nroVertContMuelle,nroHorizContMuelle);
geometria.altoVigaTestera=15;








%generar una distribucion inicial de contenedores en el barco
for i=1: nroHorizContBarco
    cantidadCont=1+floor( (nroVertContBarco-0).*rand(1,1) ); %TODO: revisar si se genera el maximo valor en algun momento?!?!?!?!
    for j=nroVertContBarco:-1:cantidadCont
        %crear un contenedor
        geometria.contBarco(j,i)=1;
    end
end
%generar una distribucion inicial de contenedores
for i=1: nroHorizContMuelle
    cantidadCont=1+floor( (nroVertContMuelle).*rand(1,1) ); %genera el maximo valor en algun momento?!?!?!?
    for j=nroVertContMuelle:-1:cantidadCont
        %crear un contenedor
        geometria.contMuelle(j,i)=1;
    end
end
