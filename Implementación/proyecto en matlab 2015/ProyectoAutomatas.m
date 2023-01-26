% clear all;
clear variables
close all;
clc
global vmaxh vmaxhfull vmaxt %corregir para pasar como argumentos
%%
%Condiciones iniciales
g=9.80665;
dt=0.01;        %%Paso de tiempo sistema discreto
xl0=-30;
vlx0=0;
alx0=0;

xt0=-30;
vt0=0;
at0=0;
vly0=0;
aly0=0;
lh0=5;
vh0=0;
ah0=0;
%%
ml0=15000;          %Peso gancho vacio
mlempty=17000;      %Peso gancho con contenedor vacio
mlfull=65000;       %Peso Gancho con contenedor lleno
mc=50000; %peso del contenedor
%%

multiplicador=1.2;
%carro y accionamiento
Jmc=10;
Jwc=2;
rc=15;
Rw=0.5;
beqc=30;
amaxt=1;
vmaxt=4;
%limites del carro - trolley - se dejan para usarse en stateflow
xt_max=50;
xt_min=-30;

bt   = beqc*rc^2/Rw^2;              %[N*m/(rad/s)] fricción equivalente viscosa
Mt=mc+(Jwc+Jmc*rc^2)/Rw^2;
Ttmax=((Mt+mlfull)*amaxt+bt*vmaxt)*Rw/rc;

%%PID Carro
w_t = bt/Mt;
wpost=w_t*multiplicador;
nt=2;

bat=Mt*nt*wpost;
Ksat=Mt*nt*wpost^2;
Kisat=Mt*wpost^3;

%%
%izaje y accionamiento
Jdh=8;
Jmh=30;
rh=30; %relacion de transmision?
Rd=0.75; %Radio primitivo de tambor
amaxh=1;
vmaxh=3;
vmaxhfull=1.5;      %Velocidad de izaje con carga maxima
vmaxhSobrepeso=0.1; %velocidad del izaje cuando el contenedor peso demasiado
beqh=18;

Mh   = (Jdh+Jmh*rh^2) / (Rd^2);      %[kg] masa equivalente
bh   = beqh*rh^2/Rd^2;              %[N*m/(rad/s)] fricción equivalente
Thmax=((Mh+mlfull)*(amaxh)+bh*vmaxh)*Rd/rh;

%%PID Izaje
w_h = bh/Mh;
wposh=w_h*multiplicador;
nh=2;
bah=Mh*nh*wposh;
Ksah=Mh*nh*wposh^2;
Kisah=Mh*wposh^3;
%%
% figure
% H = tf(1,[Mt bt]);
% pole(H)
% H1= tf(1,[Mh bh]);
% pole(H1)
% ele=40; %extension del cable medio
% H3 = tf(-(mc + mlfull ),[(Mt+mlfull)*ele 0 Mt*g]);
% pole(H3)
% pzmap(H,H1,H3)
% grid on
%%
%Datos del Cable elastico amortiguado
Kw=1800*10^3;
bw=30*10^3;
yt0=45;
yl0=yt0-lh0-ml0*g/Kw;
l0=yt0-yl0;
%%
%%PID Pendulo
%T=2*pi*(l/g)^0.5
na=3;
%%
%guardar los datos de la geometria de la situacion en una estructura de
%datos
global geometria
%limites del carro - trolley
geometria.xt_max=50;
geometria.xt_max_max=51;
xt_max_max=51;
geometria.xt_min=-30;
geometria.xt_min_min=-31;
xt_min_min=-31;
%limites del izaje
geometria.y_max=40;
geometria.y_max_max=41;
geometria.y_min=-20;
geometria.y_min_min=-21;
%parametros de los contenedores
geometria.altoCont=2.591;   %metros
geometria.anchoCont=2.438;
%largoCont=6.058;
geometria.separacionEntreCont=1;%0.5;
%distribucion de contenedores en el barco
geometria.yDistrBarco=(geometria.y_max-geometria.y_min)-2*geometria.altoCont;   % va desde -20 hasta 40m
geometria.nroVertContBarco=floor(geometria.yDistrBarco/geometria.altoCont);
geometria.xDistrBarco=geometria.xt_max;             % va desde el origen hasta los 50m
geometria.divHoriz=geometria.anchoCont+geometria.separacionEntreCont;
geometria.nroHorizContBarco=floor((geometria.xDistrBarco-geometria.anchoCont)/geometria.divHoriz);
geometria.contBarco=zeros(geometria.nroVertContBarco,geometria.nroHorizContBarco);
%distribucion de contenedores en el muelle
geometria.nroVertContMuelle=2;                    %floor(yDistrMuelle/altoCont);
geometria.xDistrMuelle=abs(geometria.xt_min+geometria.anchoCont);
geometria.nroHorizContMuelle=floor((geometria.xDistrMuelle-geometria.anchoCont)/geometria.divHoriz);
geometria.contMuelle=zeros(geometria.nroVertContMuelle,geometria.nroHorizContMuelle);
geometria.altoVigaTestera=15;
%generar una distribucion inicial de contenedores en el barco
a = 1; b = geometria.nroVertContBarco-6;
r = floor(   (b-a).*rand(1,1) + a   )   ;
for i=1: geometria.nroHorizContBarco
    a = 0; b = 6;
    cantidadCont = r + floor(   (b-a).*rand(1,1) + a   )   ;
    for j=geometria.nroVertContBarco:-1:cantidadCont
        geometria.contBarco(j,i)=1;
    end
end
%generar una distribucion inicial de contenedores
cantidadCont=0;
for i=1: geometria.nroHorizContMuelle
    cantidadCont=1+floor( (geometria.nroVertContMuelle).*rand(1,1) );
    for j=geometria.nroVertContMuelle:-1:cantidadCont
        geometria.contMuelle(j,i)=1;
    end
end
%holder para graficar y mantener rectangulos en la memoria
global holderBarco holderMuelle
% geometria.holderBarco = gobjects(size(geometria.contBarco)); %es incompatible con simulink?!?!?!?!?!?!?!?!?!
holderBarco = gobjects(size(geometria.contBarco));
holderMuelle = gobjects(size(geometria.contMuelle));
%%
load_system('ProyectoAutomatasSimulink_jona.slx')
constSegCarro=12;
distanciaSegMaxCarro=geometria.xt_max-constSegCarro; %TODO: calcular distancia para iniciar la desaceleracion cerca de los limites
distanciaSegMinCarro=geometria.xt_min+constSegCarro; %TODO: calcular distancia para iniciar la desaceleracion cerca de los limites
tiempoTransicionAutMan=1; %Segundos
l_max_max_cable=66;
l_min_min_cable=4;
l_max_cable=65; %maxima extension del cable en el fondo del barco
l_min_cable=5; %el cable queda extendido 5 metros minimo
% divisionCable=(l_max_cable-l_min_cable)/3;
constSegCable=5;
longitudSegMaxCable=l_max_cable-constSegCable;
longitudSegMinCable=l_min_cable+constSegCable;
%establecer parametros para evitar la operacion automatica en el inicio
% setParamTrayectoria(alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,ySeguridadCarro, x_origen, x_destino,y_origen,y_destino)
setParamTrayectoria(-999, -999,40, xt0, xt0,40,40);

interfazPrueba
%Cambios: se cambio la constante del P de posicion
%Se agrego en el automata nivel 2 la variable ctecarro que se usa en
%actualizarParametros y como condicion en las transiciones del automatico}
%En triangulo Desaceleracion se redujo en 10 metros la posicion de inicio
%de izaje cuando no hay que descender
%se dejo en 20 segundos el control de posicion