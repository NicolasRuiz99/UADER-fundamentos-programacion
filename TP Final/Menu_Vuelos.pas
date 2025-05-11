unit Menu_Vuelos;
interface
uses crt,vuelos,dos,aeropuertos,validacion,aerolineas,mensajes;

var arch:vuelo; arch_a:aeropuerto; arch_aer:aerolinea;

procedure menu_vuelo ();
procedure escribir_escalas (var reg:t_vuelo; x,y:integer);

implementation

procedure datos (x,y:integer);
begin
      textcolor (yellow);
      textbackground (blue);
      gotoxy(x,y); writeln  ('------------------------------------------------------------------- Vuelos ---------------------------------------------------------------------');
      gotoxy(x,y+1); writeln('------------------------------------------------------------------------------------------------------------------------------------------------');
      gotoxy(x,y+2); writeln('| ID Vuelo | ID Origen  | ID Destino | ID Aerolinea | Fecha Partida | Hora P | Fecha Llegada | Hora L |   Estado   | Pasajeros |    Escalas    |');
      gotoxy(x,y+3); writeln('------------------------------------------------------------------------------------------------------------------------------------------------');
end;

procedure si_existe_aeropuerto_origen (var arch_a:aeropuerto; var reg:t_vuelo; x,y:integer);
var op:char; pos:integer; id_a:integer; reg_a:t_aeropuerto;
begin
     abrir_aeropuerto (arch_a);
     repeat
     begin
          validacion_entero (id_a,10,x,y);
          buscar_aeropuerto_id(arch_a,reg_a,pos,id_a);
          if pos = (-1) then
          begin
               gotoxy (x,y);writeln('                                             ');
               repeat
               begin
                    gotoxy (x,y);writeln('Error aeropuerto inexistente | ENTER - Continuar'); gotoxy (x+48,y); op:=readkey;
                    gotoxy (x,y);writeln('                                                 ');
               end;
               until op = #13;
          end
          else
          begin
               if reg_a.activo then
               begin
                    reg.aeropuerto_origen:=id_a;
               end
               else
               begin
                    gotoxy (x,y);writeln('                                              ');
                    repeat
                    begin
                         gotoxy (x,y);writeln('Error aeropuerto dado de baja | ENTER - Continuar'); gotoxy (x+49,y); op:=readkey;
                         gotoxy (x,y);writeln('                                                      ');
                    end;
                    until op = #13;
               end;
          end;
     end;
     until ((pos<>-1) and (reg_a.activo=true));
     close (arch_a);
end;

procedure si_existe_aeropuerto_destino (var arch_a:aeropuerto; var reg:t_vuelo; x,y:integer);
var op:char; pos:integer; id_a:integer; reg_a:t_aeropuerto;
begin
     abrir_aeropuerto (arch_a);
     repeat
     begin
          validacion_entero (id_a,10,x,y);
          buscar_aeropuerto_id(arch_a,reg_a,pos,id_a);
          if pos = (-1) then
          begin
               gotoxy (x,y);writeln('                                                 ');
               repeat
               begin
                    gotoxy (x,y);writeln('Error aeropuerto inexistente | ENTER - Continuar'); gotoxy (x+48,y); op:=readkey;
                    gotoxy (x,y);writeln('                                                       ');
               end;
               until op = #13;
          end
          else
          begin
               if reg_a.activo then
               begin
                    reg.aeropuerto_destino:=id_a;
               end
               else
               begin
                    gotoxy (x,y);writeln('                                                         ');
                    repeat
                    begin
                         gotoxy (x,y);writeln('Error aeropuerto dado de baja | ENTER - Continuar'); gotoxy (x+49,y); op:=readkey;
                         gotoxy (x,y);writeln('                                                     ');
                    end;
                    until op = #13;
               end;
          end;
     end;
     until ((pos<>-1) and (reg_a.activo=true));
     close (arch_a);
end;

procedure si_existe_aerolinea (var arch_aer:aerolinea; var reg:t_vuelo; x,y:integer);
var op:char; pos:integer; id_a:integer; reg_a:t_aerolinea;
begin
     abrir_aerolinea (arch_aer);
     repeat
     begin
          validacion_entero (id_a,10,x,y);
          buscar_aerolinea_id(arch_aer,reg_a,pos,id_a);
          if pos = (-1) then
          begin
               gotoxy (x,y);writeln('                                                ');
               repeat
               begin
                    gotoxy (x,y);writeln('Error aerolinea inexistente | ENTER - Continuar'); gotoxy (x+47,y); op:=readkey;
                    gotoxy (x,y);writeln('                                                ');
               end;
               until op = #13;
          end
          else
          begin
               if reg_a.activo then
               begin
                    reg.id_aerolinea:=id_a;
               end
               else
               begin
                    gotoxy (x,y);writeln('                                                          ');
                    repeat
                    begin
                         gotoxy (x,y);writeln('Error aerolinea dada de baja | ENTER - Continuar'); gotoxy (x+48,y); op:=readkey;
                         gotoxy (x,y);writeln('                                                         ');
                    end;
                    until op = #13;
               end;
          end;
     end;
     until ((pos<>-1) and (reg_a.activo=true));
     close (arch_aer);
end;

procedure si_existe_aeropuerto (var arch_a:aeropuerto; var aux:integer; x,y:integer);
var op:char; pos:integer; reg_a:t_aeropuerto; id_a:integer;
begin
     abrir_aeropuerto (arch_a);
     repeat
     begin
          validacion_entero_2 (id_a,10,x,y);
          if id_a <> 0 then
          begin
               buscar_aeropuerto_id(arch_a,reg_a,pos,id_a);
               if pos = (-1) then
               begin
                    gotoxy (x,y);writeln('                                                 ');
                    repeat
                    begin
                         gotoxy (x,y);writeln('Error aeropuerto inexistente | ENTER - Continuar'); gotoxy (x+48,y); op:=readkey;
                         gotoxy (x,y);writeln('                                                       ');
                    end;
                    until op = #13;
               end
               else
               begin
                    if reg_a.activo then
                    begin
                         aux:=id_a;
                    end
                    else
                    begin
                         gotoxy (x,y);writeln('                                                         ');
                         repeat
                         begin
                              gotoxy (x,y);writeln('Error aeropuerto dado de baja | ENTER - Continuar'); gotoxy (x+49,y); op:=readkey;
                              gotoxy (x,y);writeln('                                                     ');
                         end;
                         until op = #13;
                    end;
               end;
          end
          else
          begin
               pos:=0;
               reg_a.activo:=true;
               aux:=id_a;
          end;
     end;
     until ((pos<>-1) and (reg_a.activo=true));
     close (arch_a);
end;

procedure leer_escalas (var arch_a:aeropuerto; var reg:t_vuelo; x,y:integer);
var aux:integer; lim:word; op:char;
begin
     lim:=0;
     repeat
     begin
          gotoxy (x,y); writeln ('                                             ');
          gotoxy (x,y); writeln ('Para finalizar la carga de escalas ingrese " 0 y ENTER " | ENTER - continuar'); gotoxy(x+76,y); op:=readkey;
     end;
     until op=#13;
     si_existe_aeropuerto (arch_a,aux,x,y);
     with reg do
     begin
          while (aux<>0) and (lim<=3) do
          begin
               inc (lim);
               escalas[lim]:=aux;

               repeat
               begin
                    gotoxy (x,y); writeln ('                                             ');
                    gotoxy (x,y); writeln ('Escala cargada con exito | ENTER - continuar '); gotoxy(x+45,y); op:=readkey;
               end;
               until op=#13;

               if lim<3 then
               begin
                    si_existe_aeropuerto (arch_a,aux,x,y);
               end
               else
                   aux:=0;
          end;
          cant_escalas:=lim;

          repeat
          begin
               gotoxy (x,y); writeln ('                                             ');
               gotoxy (x,y); writeln ('Carga finalizada | ENTER - continuar '); gotoxy(x+39,y); op:=readkey;
          end;
          until op=#13;

     end;
end;

procedure escribir_escalas (var reg:t_vuelo; x,y:integer);
var i:1..3;
begin
     for i:=1 to reg.cant_escalas do
     begin
          gotoxy (x,y+i); writeln ('ID: ', reg.escalas[i]);
     end;
end;

procedure mostrar_vuelo (reg:t_vuelo; x,y:integer);
var i:1..m; cond:boolean;
begin
     with reg do
     begin
          datos (x,y);
          gotoxy(x,y+4); writeln('|'); gotoxy(x,y+5); writeln('|'); gotoxy(x,y+6); writeln('|'); gotoxy(x+2,y+4); writeln(id_vuelo);
          gotoxy(x+11,y+4); writeln('|'); gotoxy(x+11,y+5); writeln('|'); gotoxy(x+11,y+6); writeln('|'); gotoxy(x+13,y+4); writeln(aeropuerto_origen);
          gotoxy(x+24,y+4); writeln('|'); gotoxy(x+24,y+5); writeln('|'); gotoxy(x+24,y+6); writeln('|'); gotoxy(x+26,y+4); writeln(aeropuerto_destino);
          gotoxy(x+37,y+4); writeln('|'); gotoxy(x+37,y+5); writeln('|'); gotoxy(x+37,y+6); writeln('|'); gotoxy(x+39,y+4); writeln(id_aerolinea);
          gotoxy(x+52,y+4); writeln('|'); gotoxy(x+52,y+5); writeln('|'); gotoxy(x+52,y+6); writeln('|');
          if fecha_partida.dia in [1,2,3,4,5,6,7,8,9] then
          begin
               gotoxy(x+55,y+4); writeln('0');
               gotoxy(x+56,y+4); writeln(fecha_partida.dia);
          end
          else
              gotoxy(x+55,y+4); writeln(fecha_partida.dia);
          gotoxy(x+57,y+4); writeln('/');
          if fecha_partida.mes in [1,2,3,4,5,6,7,8,9] then
          begin
               gotoxy(x+58,y+4); writeln('0');
               gotoxy(x+59,y+4); writeln(fecha_partida.mes);
          end
          else
              gotoxy(x+58,y+4); writeln(fecha_partida.mes);
          gotoxy(x+60,y+4); writeln('/');gotoxy(x+61,y+4); writeln(fecha_partida.anio);
          gotoxy(x+68,y+4); writeln('|'); gotoxy(x+68,y+5); writeln('|'); gotoxy(x+68,y+6); writeln('|');
          if fecha_partida.hora in [0,1,2,3,4,5,6,7,8,9] then
          begin
               gotoxy(x+70,y+4); writeln('0');
               gotoxy(x+71,y+4); writeln(fecha_partida.hora);
          end
          else
              gotoxy(x+70,y+4); writeln(fecha_partida.hora);
          gotoxy(x+72,y+4); writeln(':');
          if fecha_partida.minutos in [0,1,2,3,4,5,6,7,8,9] then
          begin
               gotoxy(x+73,y+4); writeln('0');
               gotoxy(x+74,y+4); writeln(fecha_partida.minutos);
          end
          else
              gotoxy(x+73,y+4); writeln(fecha_partida.minutos);
          gotoxy(x+77,y+4); writeln('|'); gotoxy(x+77,y+5); writeln('|'); gotoxy(x+77,y+6); writeln('|');
          if fecha_llegada.dia in [1,2,3,4,5,6,7,8,9] then
          begin
               gotoxy(x+80,y+4); writeln('0');
               gotoxy(x+81,y+4); writeln(fecha_llegada.dia);
          end
          else
              gotoxy(x+80,y+4); writeln(fecha_llegada.dia);
          gotoxy(x+82,y+4); writeln('/');
          if fecha_llegada.mes in [1,2,3,4,5,6,7,8,9] then
          begin
               gotoxy(x+83,y+4); writeln('0');
               gotoxy(x+84,y+4); writeln(fecha_llegada.mes);
          end
          else
              gotoxy(x+83,y+4); writeln(fecha_llegada.mes);
          gotoxy(x+85,y+4); writeln('/');gotoxy(x+86,y+4); writeln(fecha_llegada.anio);
          gotoxy(x+93,y+4); writeln('|'); gotoxy(x+93,y+5); writeln('|'); gotoxy(x+93,y+6); writeln('|');
          if fecha_llegada.hora in [0,1,2,3,4,5,6,7,8,9] then
          begin
               gotoxy(x+95,y+4); writeln('0');
               gotoxy(x+96,y+4); writeln(fecha_llegada.hora);
          end
          else
              gotoxy(x+95,y+4); writeln(fecha_llegada.hora);
          gotoxy(x+97,y+4); writeln(':');
          if fecha_llegada.minutos in [0,1,2,3,4,5,6,7,8,9] then
          begin
               gotoxy(x+98,y+4); writeln('0');
               gotoxy(x+99,y+4); writeln(fecha_llegada.minutos);
          end
          else
              gotoxy(x+98,y+4); writeln(fecha_llegada.minutos);
          cond:=true;
          for i:=1 to cant_escalas do
          begin
               if reg.escalas[i] <> 0 then
                  cond:=false
          end;
          if cond then
          begin
               gotoxy (x+129,y+4); writeln ('Sin Escalas');
          end
          else
              escribir_escalas(reg,x+129,y+3);
          gotoxy(x+102,y+4); writeln('|'); gotoxy(x+102,y+5); writeln('|'); gotoxy(x+102,y+6); writeln('|'); gotoxy(x+104,y+4); writeln(estado);
          gotoxy(x+115,y+4); writeln('|'); gotoxy(x+115,y+5); writeln('|'); gotoxy(x+115,y+6); writeln('|'); gotoxy(x+117,y+4); writeln(cant_pasajeros);
          gotoxy(x+127,y+4); writeln('|'); gotoxy(x+127,y+5); writeln('|'); gotoxy(x+127,y+6); writeln('|');
          gotoxy(x+143,y+4); writeln('|'); gotoxy(x+143,y+5); writeln('|'); gotoxy(x+143,y+6); writeln('|');
          gotoxy(x,y+7); writeln('------------------------------------------------------------------------------------------------------------------------------------------------');
     end;
end;

procedure mostrar_vuelos_listado (reg:t_vuelo; p,p_2:integer);
var x:integer; i:1..m; cond:boolean;
begin
     textcolor (yellow);
     textbackground (blue);
     x:=7;
     with reg do
          if reg.activo then
          begin
               gotoxy(x-2,p+6); writeln(p_2);
               gotoxy(x,p+5); writeln('|'); gotoxy(x,p+6); writeln('|'); gotoxy(x,p+7); writeln('|'); gotoxy(x+2,p+5); writeln(id_vuelo);
               gotoxy(x+11,p+5); writeln('|'); gotoxy(x+11,p+6); writeln('|'); gotoxy(x+11,p+7); writeln('|'); gotoxy(x+13,p+5); writeln(aeropuerto_origen);
               gotoxy(x+24,p+5); writeln('|'); gotoxy(x+24,p+6); writeln('|'); gotoxy(x+24,p+7); writeln('|'); gotoxy(x+26,p+5); writeln(aeropuerto_destino);
               gotoxy(x+37,p+5); writeln('|'); gotoxy(x+37,p+6); writeln('|'); gotoxy(x+37,p+7); writeln('|'); gotoxy(x+39,p+5); writeln(id_aerolinea);
               gotoxy(x+52,p+5); writeln('|'); gotoxy(x+52,p+6); writeln('|'); gotoxy(x+52,p+7); writeln('|');
               if fecha_partida.dia in [1,2,3,4,5,6,7,8,9] then
               begin
                    gotoxy(x+55,p+5); writeln('0');
                    gotoxy(x+56,p+5); writeln(fecha_partida.dia);
               end
               else
                   gotoxy(x+55,p+5); writeln(fecha_partida.dia);
               gotoxy(x+57,p+5); writeln('/');
               if fecha_partida.mes in [1,2,3,4,5,6,7,8,9] then
               begin
                    gotoxy(x+58,p+5); writeln('0');
                    gotoxy(x+59,p+5); writeln(fecha_partida.mes);
               end
               else
                   gotoxy(x+58,p+5); writeln(fecha_partida.mes);
               gotoxy(x+60,p+5); writeln('/');gotoxy(x+61,p+5); writeln(fecha_partida.anio);
               gotoxy(x+68,p+5); writeln('|'); gotoxy(x+68,p+6); writeln('|'); gotoxy(x+68,p+7); writeln('|');
               if fecha_partida.hora in [0,1,2,3,4,5,6,7,8,9] then
               begin
                    gotoxy(x+70,p+5); writeln('0');
                    gotoxy(x+71,p+5); writeln(fecha_partida.hora);
               end
               else
                   gotoxy(x+70,p+5); writeln(fecha_partida.hora);
               gotoxy(x+72,p+5); writeln(':');
               if fecha_partida.minutos in [0,1,2,3,4,5,6,7,8,9] then
               begin
                    gotoxy(x+73,p+5); writeln('0');
                    gotoxy(x+74,p+5); writeln(fecha_partida.minutos);
               end
               else
                   gotoxy(x+73,p+5); writeln(fecha_partida.minutos);
               gotoxy(x+77,p+5); writeln('|'); gotoxy(x+77,p+6); writeln('|'); gotoxy(x+77,p+7); writeln('|');
               if fecha_llegada.dia in [1,2,3,4,5,6,7,8,9] then
               begin
                    gotoxy(x+80,p+5); writeln('0');
                    gotoxy(x+81,p+5); writeln(fecha_llegada.dia);
               end
               else
                   gotoxy(x+80,p+5); writeln(fecha_llegada.dia);
               gotoxy(x+82,p+5); writeln('/');
               if fecha_llegada.mes in [1,2,3,4,5,6,7,8,9] then
               begin
                    gotoxy(x+83,p+5); writeln('0');
                    gotoxy(x+84,p+5); writeln(fecha_llegada.mes);
               end
               else
                   gotoxy(x+83,p+5); writeln(fecha_llegada.mes);
               gotoxy(x+85,p+5); writeln('/');gotoxy(x+86,p+5); writeln(fecha_llegada.anio);
               gotoxy(x+93,p+5); writeln('|'); gotoxy(x+93,p+6); writeln('|'); gotoxy(x+93,p+7); writeln('|');
               if fecha_llegada.hora in [0,1,2,3,4,5,6,7,8,9] then
               begin
                    gotoxy(x+95,p+5); writeln('0');
                    gotoxy(x+96,p+5); writeln(fecha_llegada.hora);
               end
               else
                   gotoxy(x+95,p+5); writeln(fecha_llegada.hora);
               gotoxy(x+97,p+5); writeln(':');
               if fecha_llegada.minutos in [0,1,2,3,4,5,6,7,8,9] then
               begin
                    gotoxy(x+98,p+5); writeln('0');
                    gotoxy(x+99,p+5); writeln(fecha_llegada.minutos);
               end
               else
                   gotoxy(x+98,p+5); writeln(fecha_llegada.minutos);
               gotoxy(x+102,p+5); writeln('|'); gotoxy(x+102,p+6); writeln('|'); gotoxy(x+102,p+7); writeln('|'); gotoxy(x+104,p+5); writeln(estado);
               gotoxy(x+115,p+5); writeln('|'); gotoxy(x+115,p+6); writeln('|'); gotoxy(x+115,p+7); writeln('|'); gotoxy(x+117,p+5); writeln(cant_pasajeros);
               gotoxy(x+127,p+5); writeln('|'); gotoxy(x+127,p+6); writeln('|'); gotoxy(x+127,p+7); writeln('|');
               cond:=true;
               for i:=1 to cant_escalas do
               begin
                    if reg.escalas[i] <> 0 then
                       cond:=false
               end;
               if cond then
               begin
                    gotoxy (x+129,p+5); writeln ('Sin Escalas');
               end
               else
                   escribir_escalas(reg,x+129,p+4);
               gotoxy(x+143,p+5); writeln('|'); gotoxy(x+143,p+6); writeln('|'); gotoxy(x+143,p+7); writeln('|');
               gotoxy(x,p+8); writeln('------------------------------------------------------------------------------------------------------------------------------------------------');
          end;
end;

procedure Listado_vuelos_5 (var arch:vuelo; var op:char);
var reg:t_vuelo; pos:integer; p,p_2:integer; x,y:integer;
begin
     p:=1;
     p_2:=0;
     pos:=0;
     y:=0;
     x:=7;
     seek (arch,0);
     repeat
     begin
          textcolor (yellow);
          textbackground (blue);
          gotoxy(x,p+1); writeln ('------------------------------------------------------------------- Vuelos ---------------------------------------------------------------------');
          gotoxy(x,p+2); writeln('------------------------------------------------------------------------------------------------------------------------------------------------');
          gotoxy(x,p+3); writeln('| ID Vuelo | ID Origen  | ID Destino | ID Aerolinea | Fecha Partida | Hora P | Fecha Llegada | Hora L |   Estado   | Pasajeros |    Escalas    |');
          gotoxy(x,p+4); writeln('------------------------------------------------------------------------------------------------------------------------------------------------');
          if eof(arch) then
          begin
               gotoxy(x,p+5); writeln('                                                                                                                                                  ');
               gotoxy(x,p+5); writeln('|');gotoxy(x+60,p+5); writeln('No hay vuelos para mostrar');
               gotoxy(x+143,p+5); writeln('|');
               gotoxy(x,p+6); writeln('------------------------------------------------------------------------------------------------------------------------------------------------');;
               repeat
               begin
                    gotoxy(x,9);textcolor (white);
                    textbackground (black); writeln('|2| - Alta ');
                    gotoxy(x,11); writeln('|3| - Reactivacion ');
                    gotoxy (x,13);textcolor (blue);
                    textbackground (white); writeln ('|ESC| - Regresar al menu anterior'); gotoxy(x+33,13); op:=readkey;
               end;
               until op in ['2','3',#27];
          end
          else
          begin
               seek (arch,0);
               repeat
               begin
                    p:=1;
                    textbackground (blue);clrscr;
                    textcolor (yellow);
                    gotoxy(x,p+1); writeln  ('------------------------------------------------------------------- Vuelos ---------------------------------------------------------------------');
                    gotoxy(x,p+2); writeln('------------------------------------------------------------------------------------------------------------------------------------------------');
                    gotoxy(x,p+3); writeln('| ID Vuelo | ID Origen  | ID Destino | ID Aerolinea | Fecha Partida | Hora P | Fecha Llegada | Hora L |   Estado   | Pasajeros |    Escalas    |');
                    Gotoxy(x,p+4); writeln('------------------------------------------------------------------------------------------------------------------------------------------------');
                    while (not eof(arch)) and (p<=20) do
                    begin
                         leer_vuelo(arch,pos,reg);
                         inc(pos);
                         if not (reg.activo) then
                         begin
                            p:=p-4;
                         end
                         else
                             inc (p_2);
                         mostrar_vuelos_listado(reg,p,p_2);
                         p:=p+4;
                         y:=p;
                    end;
                    if eof (arch) then
                    begin
                         repeat
                         begin
                              gotoxy(x,y+9);textcolor (white);
                              textbackground (black); writeln('|2| - Alta ');
                              gotoxy(x,y+11); writeln('|3| - Reactivacion ');
                              gotoxy (x,y+13);textcolor (blue);
                              textbackground (white); writeln ('|ESC| - Regresar al menu anterior'); gotoxy(x+33,y+13); op:=readkey;
                         end;
                         until op in ['2','3',#27];
                    end
                    else
                    begin
                         repeat
                         begin
                              gotoxy(x,y+7);textcolor (white);
                              textbackground (black); writeln('|1| - Continuar con los 5 proximos registros');
                              gotoxy(x,y+9);textcolor (white);
                              textbackground (black); writeln('|2| - Alta ');
                              gotoxy(x,y+11); writeln('|3| - Reactivacion ');
                              gotoxy (x,y+13);textcolor (blue);
                              textbackground (white); writeln ('|ESC| - Regresar al menu anterior'); gotoxy(x+33,y+13); op:=readkey;
                         end;
                         until op in ['1','2','3',#27];
                    end;
               end;
               until op in ['2','3',#27];
           end;
      end;
      until op in ['2','3',#27];
end;

procedure alta_vuelo (var arch:vuelo; var arch_a:aeropuerto; var arch_aer:aerolinea);
var id:integer; pos:integer; op:char; reg:t_vuelo; cond:char; x,y:integer;
begin
     x:=5;
     y:=7;
     textbackground (blue);clrscr;
     abrir_vuelo (arch);
     ordenar_vuelo (arch);
     Listado_vuelos_5(arch,op);
     if op = '2' then
     begin
          repeat
          begin
               textbackground (blue);clrscr;
               datos (x,y);
               with reg do
               begin
                    id_vuelo:= filesize (arch)+1;
                    si_existe_aeropuerto_origen (arch_a,reg,x+13,y+4);
                    si_existe_aeropuerto_destino (arch_a,reg,x+26,y+4);
                    si_existe_aerolinea (arch_aer,reg,x+39,y+4);
                    activo:=true;
                    cant_pasajeros:=0;
                    with fecha_partida do
                    begin
                         gotoxy(x+54,y+4); writeln('D: ');
                         validacion_fecha_2 (dia,1,x+57,y+4);
                         gotoxy(x+54,y+6); writeln('M: ');
                         validacion_fecha_2 (mes,2,x+57,y+6);
                         gotoxy(x+54,y+8); writeln('A: ');
                         validacion_fecha_2 (anio,3,x+57,y+8);
                         gotoxy(x+69,y+4); writeln('H: ');
                         validacion_fecha_2 (hora,4,x+72,y+4);
                         gotoxy(x+69,y+6);writeln('M: ');
                         validacion_fecha (minutos,5,x+72,y+6);
                    end;
                    with fecha_llegada do
                    begin
                         gotoxy(x+79,y+4); writeln('D: ');
                         validacion_fecha_2 (dia,1,x+82,y+4);
                         gotoxy(x+79,y+6); writeln('M: ');
                         validacion_fecha_2 (mes,2,x+82,y+6);
                         gotoxy(x+79,y+8); writeln('A: ');
                         validacion_fecha_2 (anio,3,x+82,y+8);
                         gotoxy(x+95,y+4); writeln('H: ');
                         validacion_fecha_2 (hora,4,x+98,y+4);
                         gotoxy(x+95,y+6);writeln('M: ');
                         validacion_fecha (minutos,5,x+98,y+6);
                    end;
                    validacion_string (estado,40,x+104,y+4);
                    leer_escalas (arch_a,reg,x+129,y+4);
                    activo:=true;
               end;
               repeat
               begin
                    textbackground (blue);clrscr;
                    mostrar_vuelo (reg,x,y);
                    gotoxy (x,y+9);textcolor (white);
                    textbackground (black); writeln ('Desea confirmar la operacion? s/n: ');
                    gotoxy (x+34,y+9); cond:=readkey;
               end;
               until cond in ['S','s','N','n'];
               if (cond = 'S') or (cond = 's') then
               begin
                    guardar_vuelo (arch,reg);
                    msj_exitoso (op,x,y);
               end
               else
                   msj_cancelado(op,x,y);
          end;
          until op=#27;
      end
      else
          if op = '3' then
             repeat
             begin
                  textbackground (blue);clrscr;
                  datos (x,y);
                  validacion_entero (id,10,x+2,y+4);
                  buscar_vuelo_id (arch,reg,pos,id);
                  if pos = (-1) then
                  begin
                       msj_inexistente (op,x,y);
                  end
                  else
                  begin
                       leer_vuelo (arch,pos,reg);
                       if reg.activo then
                       begin
                            textbackground(blue);clrscr;
                            repeat
                            begin
                                 gotoxy (x,y-2);textcolor (white);
                                 textbackground (black); writeln ('Vuelo existente:');
                                 datos(x,y);
                                 mostrar_vuelo (reg,x,y);
                                 gotoxy (x,y+11);textbackground(white);textcolor(blue); writeln ('|ESC| - Regresar al menu anterior'); gotoxy (x+33,y+11); op:=readkey;
                            end;
                            until op = #27;
                       end
                       else
                       begin
                            textbackground (blue);clrscr;
                            repeat
                            begin
                                 gotoxy (x,y-2);textcolor (white);
                                 textbackground (black); writeln ('Vuelo dado de baja:');
                                 mostrar_vuelo (reg,x,y);
                                 gotoxy (x,y+9); writeln ('|1| - Reactivar');
                                 gotoxy (x,y+11);textcolor (blue);
                                 textbackground (white); writeln ('|ESC| - Regresar al menu anterior'); gotoxy (x+33,y+11); op:=readkey;
                            end;
                            until op in ['1',#27];
                            if op = '1' then
                            begin
                                 reg.activo:=true;
                                 repeat
                                 begin
                                      textbackground (blue);clrscr;
                                      mostrar_vuelo (reg,x,y);
                                      gotoxy (x,y+9);textcolor (white);
                                      textbackground (black); writeln ('Desea confirmar la operacion? s/n: ');
                                      gotoxy (x+34,y+9); cond:=readkey;
                                 end;
                                 until cond in ['S','N','s','n'];
                                 if (cond = 'S') or (cond = 's') then
                                 begin
                                      modificar_v (arch,pos,reg);
                                      msj_exitoso(op,x,y);
                                 end
                                 else
                                     msj_cancelado(op,x,y);
                            end;
                       end;
                  end;
             end;
             until op=#27;
      close(arch);
end;

procedure baja_vuelo(var arch:vuelo);
var id:integer; pos:integer; op:char; reg:t_vuelo; cond:char; x,y:integer;
begin
     x:=5;
     y:=7;
     abrir_vuelo (arch);
     textbackground (blue);clrscr;
     menu_confirmacion (op,58,12);
     if op = '1' then
        repeat
        begin
             textbackground (blue);clrscr;
             datos (x,y);
             validacion_entero (id,10,x+2,y+4);
             buscar_vuelo_id (arch,reg,pos,id);
             if pos = (-1) then
             begin
                  msj_inexistente(op,x,y);
             end
             else
             begin
                  leer_vuelo (arch,pos,reg);
                  if reg.activo then
                  begin
                       textbackground(blue);clrscr;
                       repeat
                       begin
                            gotoxy (x,y-2);textcolor (white);
                            textbackground (black); writeln ('Vuelo existente:');
                            datos(x,y);
                            mostrar_vuelo (reg,x,y);
                            gotoxy (x,y+11); writeln ('|1| - Dar de baja');
                            gotoxy (x,y+13);textcolor (blue);
                            textbackground (white); writeln ('|ESC| - Regresar al menu anterior'); gotoxy (x+33,y+13); op:=readkey;
                       end;
                       until op in ['1',#27];
                       if op = '1' then
                       begin
                            reg.activo:=false;
                            repeat
                            begin
                                 textbackground (blue);clrscr;
                                 mostrar_vuelo (reg,x,y);
                                 gotoxy (x,y+9);textcolor (white);
                                 textbackground (black); writeln ('Desea confirmar la operacion? s/n: ');
                                 gotoxy (x+34,y+9); cond:=readkey;
                            end;
                            until cond in ['N','S','n','s'];
                            if (cond = 'S') or (cond = 's') then
                            begin
                                 modificar_v (arch,pos,reg);
                                 msj_exitoso(op,x,y);
                            end
                            else
                                msj_cancelado(op,x,y);
                       end;
                  end
                  else
                      msj_baja (op,x,y);
             end;
        end;
        until op=#27;
     close (arch);
end;

procedure modificar_vuelo(var arch:vuelo; var arch_a:aeropuerto; var arch_aer:aerolinea);
var id:integer; pos:integer; op:char; reg,reg_2:t_vuelo; cond:char; dia,mes:integer; anio:integer; hora,minutos:integer; estado:string [40]; x,y:integer;
begin
     x:=5;
     y:=7;
     abrir_vuelo (arch);
     textbackground (blue);clrscr;
     menu_confirmacion (op,58,12);
     if op = '1' then
        repeat
        begin
             textbackground (blue);clrscr;
             datos (x,y);
             validacion_entero (id,10,x+2,y+4);
             buscar_vuelo_id (arch,reg,pos,id);
             if pos = (-1) then
             begin
                  msj_inexistente (op,x,y);
             end
             else
             begin
                  if reg.activo then
                  begin
                       repeat
                       begin
                            repeat
                            begin
                                 textbackground (blue);clrscr;
                                 gotoxy (x,y-2);textcolor (white);
                                 textbackground (black); writeln ('Vuelo existente:');
                                 mostrar_vuelo (reg,x,y);
                                 gotoxy (x+2,y+8);textcolor (white);
                                 textbackground (black); writeln ('Opciones: ');
                                 gotoxy (x+18,y+8); writeln ('1');
                                 gotoxy (x+31,y+8); writeln ('2');
                                 gotoxy (x+45,y+8); writeln ('3');
                                 gotoxy (x+60,y+8); writeln ('4');
                                 gotoxy (x+73,y+8); writeln ('5');
                                 gotoxy (x+85,y+8); writeln ('6');
                                 gotoxy (x+97,y+8); writeln ('7');
                                 gotoxy (x+108,y+8); writeln ('8');
                                 gotoxy (x+134,y+8); writeln ('9');
                                 gotoxy (x,y+11); writeln ('Ingrese el numero para modificar dicho campo');
                                 gotoxy (x,y+13);textcolor (blue);
                                 textbackground (white); writeln ('|ESC| - Regresar al menu anterior'); gotoxy (x+33,y+13); op:=readkey;
                            end;
                            until op in ['1','2','3','4','5','6','7','8','9',#27];
                            case op of
                                 '1':
                                     begin
                                          gotoxy (x,y+15); writeln ('                                              ');
                                          gotoxy (x,y+15);textcolor (white);
                                          textbackground (black); writeln ('Origen: '); si_existe_aeropuerto_origen (arch_a,reg_2,x+8,y+15);
                                          repeat
                                          begin
                                               gotoxy (x,y+17);textcolor (white);
                                               textbackground (black); writeln ('Desea confirmar la operacion? s/n: ');
                                               gotoxy (x+34,y+17); cond:=readkey;
                                          end;
                                          until cond in ['S','N','s','n'];
                                          if (cond = 'S') or (cond = 's') then
                                          begin
                                               reg.aeropuerto_origen:=reg_2.aeropuerto_origen;
                                               modificar_v (arch,pos,reg);
                                          end;
                                     end;
                                 '2':
                                     begin
                                          gotoxy (x,y+15); writeln ('                                              ');
                                          gotoxy (x,y+15);textcolor (white);
                                          textbackground (black); writeln ('Destino: '); si_existe_aeropuerto_destino (arch_a,reg_2,x+9,y+15);
                                          repeat
                                          begin
                                               gotoxy (x,y+17);textcolor (white);
                                               textbackground (black); writeln ('Desea confirmar la operacion? s/n: ');
                                               gotoxy (x+34,y+17); cond:=readkey;
                                          end;
                                          until cond in ['S','N','s','n'];
                                          if (cond = 'S') or (cond = 's') then
                                          begin
                                               reg.aeropuerto_destino:=reg_2.aeropuerto_destino;
                                               modificar_v (arch,pos,reg);
                                          end;
                                     end;
                                 '3':
                                     begin
                                          gotoxy (x,y+15); writeln ('                                              ');
                                          gotoxy (x,y+15);textcolor (white);
                                          textbackground (black); writeln ('Aerolinea: '); si_existe_aerolinea (arch_aer,reg_2,x+11,y+15);
                                          repeat
                                          begin
                                               gotoxy (x,y+17);textcolor (white);
                                               textbackground (black); writeln ('Desea confirmar la operacion? s/n: ');
                                               gotoxy (x+34,y+17); cond:=readkey;
                                          end;
                                          until cond in ['S','N','s','n'];
                                          if (cond = 'S') or (cond = 's') then
                                          begin
                                               reg.id_aerolinea:=reg_2.id_aerolinea;
                                               modificar_v (arch,pos,reg);
                                          end;
                                     end;
                                 '4':
                                     begin
                                          gotoxy (x,y+15); writeln ('                                   ');
                                          gotoxy (x,y+15);textcolor (white);
                                          textbackground (black); writeln('D: ');
                                          validacion_fecha_2 (dia,1,x+3,y+15);
                                          gotoxy(x,y+17); writeln('M: ');
                                          validacion_fecha_2 (mes,2,x+3,y+17);
                                          gotoxy(x,y+19); writeln('A: ');
                                          validacion_fecha_2 (anio,3,x+3,y+19);
                                          repeat
                                          begin
                                               gotoxy (x,y+21);textcolor (white);
                                               textbackground (black); writeln ('Desea confirmar la operacion? s/n: ');
                                               gotoxy (x+34,y+21); cond:=readkey;
                                          end;
                                          until cond in ['S','N','s','n'];
                                          if (cond = 'S') or (cond = 's') then
                                          begin
                                               with reg do
                                               begin
                                                    fecha_partida.dia:=dia;
                                                    fecha_partida.mes:=mes;
                                                    fecha_partida.anio:=anio;
                                               end;
                                               modificar_v(arch,pos,reg);
                                          end;
                                     end;
                                 '5':
                                     begin
                                          gotoxy (x,y+15); writeln ('                                   ');
                                          gotoxy(x,y+15);textcolor (white);
                                          textbackground (black); writeln('H: ');
                                          validacion_fecha_2 (hora,4,x+3,y+15);
                                          gotoxy(x,y+17);writeln('M: ');
                                          validacion_fecha (minutos,5,x+3,y+17);
                                          repeat
                                          begin
                                               gotoxy (x,y+19);textcolor (white);
                                               textbackground (black); writeln ('Desea confirmar la operacion? s/n: ');
                                               gotoxy (x+36,y+19); cond:=readkey;
                                          end;
                                          until cond in ['S','N','s','n'];
                                          if (cond = 'S') or (cond = 's') then
                                          begin
                                               with reg do
                                               begin
                                                    fecha_partida.hora:=hora;
                                                    fecha_partida.minutos:=minutos;
                                               end;
                                               modificar_v(arch,pos,reg);
                                          end;
                                     end;
                                 '6':
                                     begin
                                          gotoxy (x,y+15); writeln ('                                   ');
                                          gotoxy (x,y+15);textcolor (white);
                                          textbackground (black); writeln('D: ');
                                          validacion_fecha_2 (dia,1,x+3,y+15);
                                          gotoxy(x,y+17); writeln('M: ');
                                          validacion_fecha_2 (mes,2,x+3,y+17);
                                          gotoxy(x,y+19); writeln('A: ');
                                          validacion_fecha_2 (anio,3,x+3,y+19);
                                          repeat
                                          begin
                                               gotoxy (x,y+21);textcolor (white);
                                               textbackground (black); writeln ('Desea confirmar la operacion? s/n: ');
                                               gotoxy (x+34,y+21); cond:=readkey;
                                          end;
                                          until cond in ['S','N','s','n'];
                                          if (cond = 'S') or (cond = 's') then
                                          begin
                                               with reg do
                                               begin
                                                    fecha_llegada.dia:=dia;
                                                    fecha_llegada.mes:=mes;
                                                    fecha_llegada.anio:=anio;
                                               end;
                                               modificar_v(arch,pos,reg);
                                          end;
                                     end;
                                 '7':
                                     begin
                                          gotoxy (x,y+15); writeln ('                                   ');
                                          gotoxy(x,y+15);textcolor (white);
                                          textbackground (black); writeln('H: ');
                                          validacion_fecha_2 (hora,4,x+3,y+15);
                                          gotoxy(x,y+17);writeln('M: ');
                                          validacion_fecha (minutos,5,x+3,y+17);
                                          repeat
                                          begin
                                               gotoxy (x,y+19);textcolor (white);
                                               textbackground (black); writeln ('Desea confirmar la operacion? s/n: ');
                                               gotoxy (x+34,y+19); cond:=readkey;
                                          end;
                                          until cond in ['S','N','s','n'];
                                          if (cond = 'S') or (cond = 's') then
                                          begin
                                               with reg do
                                               begin
                                                    fecha_llegada.hora:=hora;
                                                    fecha_llegada.minutos:=minutos;
                                               end;
                                               modificar_v(arch,pos,reg);
                                          end;
                                     end;
                                 '8':
                                     begin
                                          gotoxy (x,y+15); writeln ('                                              ');
                                          gotoxy (x,y+15);textcolor (white);
                                          textbackground (black); writeln ('Estado: '); validacion_string(estado,40,x+8,y+15);
                                          repeat
                                          begin
                                               gotoxy (x,y+17);textcolor (white);
                                               textbackground (black); writeln ('Desea confirmar la operacion? s/n: ');
                                               gotoxy (x+34,y+17); cond:=readkey;
                                          end;
                                          until cond in ['S','N','s','n'];
                                          if (cond = 'S') or (cond = 's') then
                                          begin
                                               reg.estado:=estado;
                                               modificar_v (arch,pos,reg);
                                          end;
                                     end;
                                 '9':
                                     begin
                                          gotoxy (x,y+15); writeln ('                                              ');
                                          gotoxy (x,y+15);textcolor (white);
                                          textbackground (black); writeln ('Escalas: ');
                                          inicializar (reg_2.escalas);
                                          leer_escalas (arch_a,reg_2,x+9,y+15);
                                          repeat
                                          begin
                                               gotoxy (x,y+17);textcolor (white);
                                               textbackground (black); writeln ('Desea confirmar la operacion? s/n: ');
                                               gotoxy (x+34,y+17); cond:=readkey;
                                          end;
                                          until cond in ['S','N','s','n'];
                                          if (cond = 'S') or (cond = 's') then
                                          begin
                                               reg.escalas:=reg_2.escalas;
                                               reg.cant_escalas:=reg_2.cant_escalas;
                                               modificar_v (arch,pos,reg);
                                          end;
                                     end;
                            end;
                       end;
                       until op = #27;
                  end
                  else
                      msj_baja (op,x,y);
             end;
        end;
        until op = #27;
    close (arch);
end;

procedure consulta_vuelo (var arch:vuelo);
var id:integer; pos:integer; reg:t_vuelo; op:char; x,y:integer;
begin
     x:=5;
     y:=7;
     textbackground (blue);clrscr;
     abrir_vuelo (arch);
     menu_confirmacion (op,58,12);
     if op ='1' then
        repeat
        begin
             textbackground (blue);clrscr;
             datos (x,y);
             validacion_entero (id,10,x+2,y+4);
             buscar_vuelo_id (arch,reg,pos,id);
             if pos = (-1) then
             begin
                  msj_inexistente(op,x,y);
             end
             else
             begin
                  if reg.activo then
                  begin
                       textbackground(blue);clrscr;
                       repeat
                       begin
                            gotoxy (x,y-2);textcolor (white);
                            textbackground (black); writeln ('Vuelo existente:');
                            mostrar_vuelo (reg,x,y);
                            gotoxy (x,y+13);textcolor (blue);
                            textbackground (white);  writeln ('|ESC| - Regresar al menu anterior'); gotoxy (x+33,y+13); op:=readkey;
                       end;
                       until op = #27;
                  end
                  else
                      msj_baja (op,x,y);
             end;
        end;
        until op = #27;
     close (arch);
end;

procedure listado_vuelos (var arch:vuelo);
var reg:t_vuelo; pos:integer; p,p_2:integer; x,y:integer; op:char;
begin
     abrir_vuelo (arch);
     ordenar_vuelo (arch);
     p:=1;
     p_2:=0;
     pos:=0;
     x:=7;
     seek (arch,0);
     repeat
     begin
          textbackground (blue);clrscr;
          textcolor (yellow);
          gotoxy(x,p+1); writeln ('------------------------------------------------------------------- Vuelos ---------------------------------------------------------------------');
          gotoxy(x,p+2); writeln('------------------------------------------------------------------------------------------------------------------------------------------------');
          gotoxy(x,p+3); writeln('| ID Vuelo | ID Origen  | ID Destino | ID Aerolinea | Fecha Partida | Hora P | Fecha Llegada | Hora L |   Estado   | Pasajeros |    Escalas    |');
          gotoxy(x,p+4); writeln('------------------------------------------------------------------------------------------------------------------------------------------------');
          if eof(arch) then
          begin
               gotoxy(x,p+5); writeln('                                                                                                                                                  ');
               gotoxy(x,p+5); writeln('|');gotoxy(x+60,p+5); writeln('No hay vuelos para mostrar');
               gotoxy(x+143,p+5); writeln('|');
               gotoxy(x,p+6); writeln('------------------------------------------------------------------------------------------------------------------------------------------------');;
               repeat
               begin
                    gotoxy (x,9);textcolor (blue);
                    textbackground (white); writeln ('|ESC| - Regresar al menu anterior'); gotoxy(x+33,9); op:=readkey;
               end;
               until op = #27;
          end
          else
          begin
               seek (arch,0);
               repeat
               begin
                    p:=1;
                    textbackground (blue);clrscr;
                    textcolor (yellow);
                    gotoxy(x,p+1); writeln  ('------------------------------------------------------------------- Vuelos ---------------------------------------------------------------------');
                    gotoxy(x,p+2); writeln('------------------------------------------------------------------------------------------------------------------------------------------------');
                    gotoxy(x,p+3); writeln('| ID Vuelo | ID Origen  | ID Destino | ID Aerolinea | Fecha Partida | Hora P | Fecha Llegada | Hora L |   Estado   | Pasajeros |    Escalas    |');
                    Gotoxy(x,p+4); writeln('------------------------------------------------------------------------------------------------------------------------------------------------');
                    while (not eof(arch)) and (p<=20) do
                    begin
                         leer_vuelo(arch,pos,reg);
                         inc(pos);
                         if not (reg.activo) then
                         begin
                            p:=p-4;
                         end
                         else
                             inc (p_2);
                         mostrar_vuelos_listado(reg,p,p_2);
                         p:=p+4;
                         y:=p;
                    end;
                    if eof (arch) then
                    begin
                         repeat
                         begin
                              gotoxy (x,y+9);textcolor (blue);
                              textbackground (white); writeln ('|ESC| - Regresar al menu anterior'); gotoxy(x+33,y+9); op:=readkey;
                         end;
                         until op = #27;
                    end
                    else
                    begin
                         repeat
                         begin
                              gotoxy(x,y+7);textcolor (white);
                              textbackground (black); writeln('|1| - Continuar con los 5 proximos registros');
                              gotoxy (x,y+9);textcolor (blue);
                              textbackground (white); writeln ('|ESC| - Regresar al menu anterior'); gotoxy(x+33,y+9); op:=readkey;
                         end;
                         until op in ['1',#27];
                    end;
               end;
               until op = #27;
           end;
      end;
      until op = #27;
      close (arch);
end;

procedure borrar_archivo(var arch:vuelo);
var op:char; x,y:integer;
begin
  x:=7;
  y:=19;
  op:=' ';
  clrscr;
  repeat
  begin
      gotoxy(x,y); writeln('AVISO: Si continua se perderan todos los datos almacenados en este Archivo!!');
      gotoxy(x,y+2); writeln('Enter - Confirmar');
      gotoxy(x,y+4); writeln('Esc - Regresar al menu anterior'); gotoxy(x+31,y+4); op:=readkey;
  end;    
  until op in [#13,#27];

  if op=#13 then
  begin
    op:=' ';
    repeat
    begin
      clrscr;
      gotoxy (x,y); writeln ('Desea confirmar la operacion? s/n:                         ');
      gotoxy (x+36,y); op:=readkey;
      op:=upcase(op);
    end;
    until op in ['S','N'];

    if op='S' then
    begin
      clrscr;
      gotoxy(x,y); writeln('Operacion realizada con exito.');
      assign(arch,'vuelos.dat');
      erase(arch);
      readkey;
    end
    else if op='N' then
    begin
      clrscr;
      gotoxy(x,y); writeln('Operacion cancelada.');
      readkey;
    end
  end;
end;

procedure menu_vuelo();
var op:char; arch:vuelo; x,y:integer;
begin
     x:=62;
     y:=8;
     clrscr;
     repeat
     begin
          repeat
          begin
            textbackground(blue);clrscr;
            textcolor (lightgreen);
            gotoxy (x,y);writeln('-------------------------------');
            gotoxy (x,y+1);writeln('|');
            gotoxy (x+30,y+1);writeln('|');
            gotoxy (x,y+2);writeln('|');
            gotoxy (x+10,y+2);writeln('Menu Vuelos');
            gotoxy (x+30,y+2);writeln('|');
            gotoxy (x,y+3);writeln('|');
            gotoxy (x+30,y+3);writeln('|');
            gotoxy (x+1,y+4);writeln('-----------------------------');
            gotoxy (x,y+5);writeln('|');
            gotoxy (x+30,y+5);writeln('|');
            gotoxy (x,y+6);writeln('|');
            gotoxy (x+2,y+6);writeln('1 - Alta');
            gotoxy (x+30,y+6);writeln('|');
            gotoxy (x,y+7);writeln('|');
            gotoxy (x+30,y+7);writeln('|');
            gotoxy (x+1,y+8);writeln('-----------------------------');
            gotoxy (x,y+9);writeln('|');
            gotoxy (x,y+9);writeln('|');
            gotoxy (x,y+10);writeln('|');
            gotoxy (x+2,y+10);writeln('2 - Baja');
            gotoxy (x+30,y+10);writeln('|');
            gotoxy (x,y+11);writeln('|');
            gotoxy (x+30,y+11);writeln('|');
            gotoxy (x+1,y+12);writeln('-----------------------------');
            gotoxy (x,y+13);writeln('|');
            gotoxy (x+30,y+13);writeln('|');
            gotoxy (x,y+14);writeln('|');
            gotoxy (x+2,y+14);writeln('3 - Modificacion');
            gotoxy (x+30,y+14);writeln('|');
            gotoxy (x,y+15);writeln('|');
            gotoxy (x+30,y+15);writeln('|');
            gotoxy (x+1,y+16);writeln('-----------------------------');
            gotoxy (x,y+17);writeln('|');
            gotoxy (x+30,y+17);writeln('|');
            gotoxy (x,y+18);writeln('|');
            gotoxy (x+2,y+18);writeln('4 - Consultas ');
            gotoxy (x+30,y+18);writeln('|');
            gotoxy (x,y+19);writeln('|');
            gotoxy (x+30,y+19);writeln('|');
            gotoxy (x+1,y+20);writeln('-----------------------------');
            gotoxy (x,y+21);writeln('|');
            gotoxy (x+30,y+21);writeln('|');
            gotoxy (x,y+22);writeln('|');
            gotoxy (x+2,y+22);writeln('5 - Listado');
            gotoxy (x+30,y+22);writeln('|');
            gotoxy (x,y+23);writeln('|');
            gotoxy (x+30,y+23);writeln('|');
            gotoxy (x+1,y+24);writeln('-----------------------------');
            gotoxy (x,y+25);writeln('|');
            gotoxy (x+30,y+25);writeln('|');
            gotoxy (x,y+26);writeln('|');
            gotoxy (x+2,y+26);textbackground (white);textcolor (blue);writeln('|ESC| - Salir del programa'); textcolor (lightgreen); textbackground (9);
            gotoxy (x+30,y+26);writeln('|');
            gotoxy (x,y+27);writeln('|');
            gotoxy (x+30,y+27);writeln('|');
            gotoxy (x,y+28);writeln('-------------------------------');
            gotoxy (x+28,y+26);op:=readkey;
          end;
          until op in ['1','2','3','4','5',#27];
          case op of
               '1':alta_vuelo(arch,arch_a,arch_aer);
               '2':baja_vuelo(arch);
               '3':modificar_vuelo(arch,arch_a,arch_aer);
               '4':consulta_vuelo(arch);
               '5':listado_vuelos(arch);
               '6':borrar_archivo(arch);
          end;
    end;
    until op = #27;
end;

begin

end.
