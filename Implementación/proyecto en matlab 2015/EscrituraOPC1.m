% Server = opcda('localhost','CoDeSys.OPC.DA');
% connect(Server);
% Group = addgroup(Server);
% 
% %serveritems(Server) permite leer los nombres de los items
% 
% itm = additem(Group,'PLC1.Application.Global.contBarco[1,1]');
% array_ini = 30;
% %write(itm, array_ini);
% %r_grp = read(Group, 'device')
% disconnect(Server)
% save opcda_client Server

Server = opcda('localhost','CoDeSys.OPC.DA');
connect(Server);
Group = addgroup(Server);

%serveritems(Server) permite leer los nombres de los items
if ~exist('ItemVectorBarco','var')
    ItemVectorBarco=[];
    ItemVectorMuelle=[];
    for i=1:1:21
        for j=1:1:13
            st=['PLC_GW3.Application.Global.contBarco[' num2str(i) ',' num2str(j),']'];
            itm=additem(Group,st);
            ItemVectorBarco=[ItemVectorBarco itm];
            write(itm,geometria.contBarco(i,j));
        end
    end
    for i=1:1:2
        for j=1:1:7
            st=['PLC_GW3.Application.Global.contMuelle[' num2str(i) ',' num2str(j),']'];
            itm=additem(Group,st);
            ItemVectorMuelle=[ItemVectorMuelle itm];
            write(itm,geometria.contMuelle(i,j));
        end
    end
else
    for i=1:1:21
        for j=1:1:13
            write(ItemVectorBarco((i-1)*13+j),geometria.contBarco(i,j));
        end
    end
    for i=1:1:2
        for j=1:1:7
            write(ItemVectorMuelle((i-1)*7+j),geometria.contMuelle(i,j));
        end
    end
end