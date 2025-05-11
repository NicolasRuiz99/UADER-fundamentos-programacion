unit Menu_informacion_adicional;
interface
uses crt,vuelos,ventas,aeropuertos,pasajeros,aerolineas,menu_vuelos,dos,validacion;

var arch:vuelo; arch_a:aeropuerto; arch_aer:aerolinea; arch_p:pasajero; arch_v:venta;

procedure menu_extra();

implementation

procedure datos (x,y:integer);
begin
      gotoxy(x,y-1); writeln('-----------------------------------------------------------');
      gotoxy(x,y); writeln  ('-------------- Ingrese los siguientes datos ---------------');
      gotoxy(x,y+1); writeln('-----------------------------------------------------------');
      gotoxy(x,y+2); writeln('|        ID Aeropuerto        |           Fecha           |');
      gotoxy(x,y+3); writeln('-----------------------------------------------------------');
end;  

procedure datos_2 (x,y:integer);
begin
      gotoxy(x,y-1); writeln('-------------------------------------------------------------------------------------');
      gotoxy(x,y); writeln  ('--------------------------- Ingrese los siguientes datos ----------------------------');
      gotoxy(x,y+1); writeln('-------------------------------------------------------------------------------------');
      gotoxy(x,y+2); writeln('|        ID Aerolinea         |       Fecha Inicial       |       Fecha Final       |');
      gotoxy(x,y+3); writeln('-------------------------------------------------------------------------------------');
end;

procedure datos_3 (x,y:integer);
begin
      gotoxy(x,y-1); writeln('----------------------------------------------------------------------');
      gotoxy(x,y); writeln  ('-------------------- Ingrese los siguientes datos --------------------');
      gotoxy(x,y+1); writeln('----------------------------------------------------------------------');
      gotoxy(x,y+2); writeln('|                            DNI Pasajero                            |');
      gotoxy(x,y+3); writeln('----------------------------------------------------------------------');
end;  

procedure si_existe_aeropuerto_origen (var arch_a:aeropuerto; var id_a:integer; x,y:integer);
var op:char; pos:integer; reg_a:t_aeropuerto; aux:integer;
begin
     op:=' ';
     abrir_aeropuerto (arch_a);
     repeat
     begin
          validacion_entero (aux,10,x,y);
          buscar_aeropuerto_id(arch_a,reg_a,pos,aux);
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
                    id_a:=aux;
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

procedure si_existe_aerolinea (var arch_aer:aerolinea; var id_aer:integer; x,y:integer);
var op:char; pos:integer; reg_a:t_aerolinea; aux:integer;
begin
     abrir_aerolinea (arch_aer);
     repeat
     begin
          validacion_entero (aux,10,x,y);
          buscar_aerolinea_id(arch_aer,reg_a,pos,aux);
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
                    id_aer:=aux;
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

procedure si_existe_pasajero(var arch_p:pasajero;var id_p:integer; x,y:integer);
var op:char; reg_p:t_pasajero; pos:integer; aux:integer;
begin
     abrir_pasajero(arch_p);
     repeat
     begin
          pos:=-1;
          validacion_dni(aux,x,y);
          buscar_pasajero_id(arch_p,reg_p,pos,aux);
          if pos = (-1) then
          begin
               gotoxy(x,y);writeln('                                               ');
               repeat
               begin
                    gotoxy(x,y);writeln('Error pasajero inexistente | ENTER - Continuar'); gotoxy (x+46,y); op:=readkey;
                    gotoxy (x,y);writeln('                                                        ');
               end;
               until op = #13;
          end
          else if (pos <> (-1)) then
          begin
               if  (reg_p.activo=true) then
               begin
                    id_p:=aux;
               end
               else
               begin
                    gotoxy(x,y);writeln('                                         ');
                    repeat
                    begin
                         gotoxy (x,y);writeln('Error pasajero en estado de baja | ENTER - Continuar'); gotoxy (x+46,y); op:=readkey;
                         gotoxy (x,y);writeln('                                                              ');
                    end;
                    until op = #13;
               end
          end;
     end;
     until ((pos<>-1) and (reg_p.activo=true));
     close (arch_p);
end;
                                            
procedure mostrar_vuelos_listado (reg:t_vuelo; p,p_2:integer);
var x:integer; i:1..m; cond:boolean;
begin
     x:=7;
     with reg do
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

procedure mostrar_ventas_listado (reg:t_venta; p,p_2:integer);
var x:integer;
begin
     textcolor (yellow);
     textbackground (blue);
     x:=5;
     with reg do
     begin
               gotoxy(x-2,p+5); writeln(p_2);
               gotoxy(x+2,p+5); writeln('                                                                                                                                                                                                                                                            ');
               gotoxy(x+2,p+5); writeln('|');gotoxy(x+4,p+5); writeln(id_venta);
               gotoxy(x+33,p+5); writeln('|');gotoxy(x+35,p+5); writeln(id_pasajero);
               gotoxy(x+53,p+5); writeln('|');gotoxy(x+55,p+5); writeln(id_vuelo);
               gotoxy(x+84,p+5); writeln('|');
               if fecha.dia in [1,2,3,4,5,6,7,8,9] then
               begin
                    gotoxy(x+86,p+5); writeln('0');
                    gotoxy(x+87,p+5); writeln(fecha.dia);
               end
               else
                   gotoxy(x+86,p+5); writeln(fecha.dia);
               gotoxy(x+88,p+5); writeln('/');
               if fecha.mes in [1,2,3,4,5,6,7,8,9] then
               begin
                    gotoxy(x+89,p+5); writeln('0');
                    gotoxy(x+90,p+5); writeln(fecha.mes);
               end
               else
                   gotoxy(x+89,p+5); writeln(fecha.mes);
               gotoxy(x+91,p+5); writeln('/');gotoxy(x+92,p+5); writeln(fecha.anio);
               gotoxy(x+104,p+5); writeln('|');
               if fecha.hora in [0,1,2,3,4,5,6,7,8,9] then
               begin
                    gotoxy(x+106,p+5); writeln('0');
                    gotoxy(x+107,p+5); writeln(fecha.hora);
               end
               else
                   gotoxy(x+106,p+5); writeln(fecha.hora);
               gotoxy(x+108,p+5); writeln(':');
               if fecha.minutos in [0,1,2,3,4,5,6,7,8,9] then
               begin
                    gotoxy(x+109,p+5); writeln('0');
                    gotoxy(x+110,p+5); writeln(fecha.minutos);
               end
               else
                   gotoxy(x+109,p+5); writeln(fecha.minutos);
               gotoxy(x+119,p+5); writeln('|');gotoxy(x+121,p+5); writeln('$ ',costo:2:2);
               gotoxy(x+147,p+5); writeln('|');
               gotoxy(x+2,p+6); writeln('--------------------------------------------------------------------------------------------------------------------------------------------------');
     end;
end;


procedure listado_vuelos (var arch:vuelo; dia,mes,anio:integer; id_a:integer);
var reg:t_vuelo; pos:integer; a,p,p_2:integer; x,y:integer; op:char;
begin
     abrir_vuelo (arch);
     ordenar_vuelo (arch);
     seek (arch,0);
     p:=1;
     a:=0;
     p_2:=0;
     pos:=0;
     x:=7;
     repeat
     begin
          gotoxy(x,p+1); writeln ('------------------------------------------------------------------- Vuelos ---------------------------------------------------------------------');
          gotoxy(x,p+2); writeln('------------------------------------------------------------------------------------------------------------------------------------------------');
          gotoxy(x,p+3); writeln('| ID Vuelo | ID Origen  | ID Destino | ID Aerolinea | Fecha Partida | Hora P | Fecha Llegada | Hora L |   Estado   | Pasajeros |    Escalas    |');
          gotoxy(x,p+4); writeln('------------------------------------------------------------------------------------------------------------------------------------------------');
          if eof(arch) then
          begin
               gotoxy(x,p+5); writeln('                                                                                                                                                  ');
               gotoxy(x,p+5); writeln('|');gotoxy(x+60,p+5); writeln('No hay vuelos para mostrar');
               gotoxy(x+143,p+5); writeln('|');
               gotoxy(x,p+6); writeln('------------------------------------------------------------------------------------------------------------------------------------------------');
               repeat
               begin
                    gotoxy (x,11); writeln ('|ESC| - Regresar al menu anterior'); gotoxy(x+33,11); op:=readkey;
               end;
               until op = #27;
          end
          else
          begin
               seek (arch,0);
               repeat
               begin
                    p:=1;
                    clrscr;
                    gotoxy(x,p+1); writeln ('------------------------------------------------------------------- Vuelos ---------------------------------------------------------------------');
                    gotoxy(x,p+2); writeln('------------------------------------------------------------------------------------------------------------------------------------------------');
                    gotoxy(x,p+3); writeln('| ID Vuelo | ID Origen  | ID Destino | ID Aerolinea | Fecha Partida | Hora P | Fecha Llegada | Hora L |   Estado   | Pasajeros |    Escalas    |');
                    Gotoxy(x,p+4); writeln('------------------------------------------------------------------------------------------------------------------------------------------------');
                    while (not eof(arch)) and (p<=20) do
                    begin
                        leer_vuelo(arch,pos,reg);
                        inc(pos);
                        if (id_a=reg.aeropuerto_origen) and (dia=reg.fecha_partida.dia) and (mes=reg.fecha_partida.mes) and (anio=reg.fecha_partida.anio) and (reg.activo) then
                        begin                           
                            inc (p_2);
                            mostrar_vuelos_listado(reg,p,p_2);
                            inc(a);   
                        end
                        else
                        	p:=p-4;

                        if eof(arch) and (a=0) then
                        begin
                            p:=1;
                            gotoxy(x,p+5); writeln('                                                                                                                                                  ');
                            gotoxy(x,p+5); writeln('|');gotoxy(x+60,p+5); writeln('No hay vuelos para mostrar');
                            gotoxy(x+143,p+5); writeln('|');
                            gotoxy(x,p+6); writeln('------------------------------------------------------------------------------------------------------------------------------------------------');
                        end;

                         p:=p+4;
                         y:=p;
                    end;

                    if eof (arch) then
                    begin
                         repeat
                         begin
                              gotoxy (x,y+7); writeln ('|ESC| - Regresar al menu anterior'); gotoxy(x+33,y+7); op:=readkey;
                         end;
                         until op = #27;
                    end
                    else
                    begin
                         repeat
                         begin
                              gotoxy(x,y+7); writeln('|1| - Continuar con los 5 proximos registros');
                              gotoxy (x,y+9); writeln ('|ESC| - Regresar al menu anterior'); gotoxy(x+33,y+9); op:=readkey;
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

procedure listado_vuelos_rango (var arch:vuelo; dia_i,mes_i,anio_i,dia_f,mes_f,anio_f:integer; id_aer:integer);
var reg:t_vuelo; pos:integer; a,p,p_2:integer; x,y:integer; op:char;
begin
     abrir_vuelo (arch);
     ordenar_vuelo (arch);
     seek (arch,0);
     p:=1;
     a:=0;
     p_2:=0;
     pos:=0;
     x:=7;
     repeat
     begin
          gotoxy(x,p+1); writeln ('------------------------------------------------------------------- Vuelos ---------------------------------------------------------------------');
          gotoxy(x,p+2); writeln('------------------------------------------------------------------------------------------------------------------------------------------------');
          gotoxy(x,p+3); writeln('| ID Vuelo | ID Origen  | ID Destino | ID Aerolinea | Fecha Partida | Hora P | Fecha Llegada | Hora L |   Estado   | Pasajeros |    Escalas    |');
          gotoxy(x,p+4); writeln('------------------------------------------------------------------------------------------------------------------------------------------------');
          if eof(arch) then
          begin
               gotoxy(x,p+5); writeln('                                                                                                                                                  ');
               gotoxy(x,p+5); writeln('|');gotoxy(x+60,p+5); writeln('No hay vuelos para mostrar');
               gotoxy(x+143,p+5); writeln('|');
               gotoxy(x,p+6); writeln('------------------------------------------------------------------------------------------------------------------------------------------------');
               repeat
               begin
                    gotoxy (x,11); writeln ('|ESC| - Regresar al menu anterior'); gotoxy(x+33,11); op:=readkey;
               end;
               until op = #27;
          end
          else
          begin
               seek (arch,0);
               repeat
               begin
                    p:=1;
                    clrscr;
                    gotoxy(x,p+1); writeln ('------------------------------------------------------------------- Vuelos ---------------------------------------------------------------------');
                    gotoxy(x,p+2); writeln('------------------------------------------------------------------------------------------------------------------------------------------------');
                    gotoxy(x,p+3); writeln('| ID Vuelo | ID Origen  | ID Destino | ID Aerolinea | Fecha Partida | Hora P | Fecha Llegada | Hora L |   Estado   | Pasajeros |    Escalas    |');
                    Gotoxy(x,p+4); writeln('------------------------------------------------------------------------------------------------------------------------------------------------');
                    while (not eof(arch)) and (p<=20) do
                    begin
                        leer_vuelo(arch,pos,reg);
                        inc(pos);
                        if (id_aer=reg.id_aerolinea) and (dia_i<=reg.fecha_partida.dia) and (dia_f>=reg.fecha_partida.dia) and (mes_i<=reg.fecha_partida.mes) and (mes_f>=reg.fecha_partida.mes) and (anio_i<=reg.fecha_partida.anio) and (anio_f>=reg.fecha_partida.anio) and (reg.activo) then
                        begin                           
                            inc (p_2);
                            mostrar_vuelos_listado(reg,p,p_2);
                            inc(a);
                        end
                        else
                        	p:=p-4;

                        if eof(arch) and (a=0) then
                        begin
                            p:=1;
                            gotoxy(x,p+5); writeln('                                                                                                                                                  ');
                            gotoxy(x,p+5); writeln('|');gotoxy(x+60,p+5); writeln('No hay vuelos para mostrar');
                            gotoxy(x+143,p+5); writeln('|');
                            gotoxy(x,p+6); writeln('------------------------------------------------------------------------------------------------------------------------------------------------');
                        end;

                         p:=p+4;
                         y:=p;
                    end;

                    if eof (arch) then
                    begin
                         repeat
                         begin
                            gotoxy (x,y+7); writeln ('|ESC| - Regresar al menu anterior'); gotoxy(x+33,y+7); op:=readkey;
                         end;
                         until op = #27;
                    end
                    else
                    begin
                         repeat
                         begin
                            gotoxy(x,y+7); writeln('|1| - Continuar con los 5 proximos registros');
                            gotoxy (x,y+9); writeln ('|ESC| - Regresar al menu anterior'); gotoxy(x+33,y+9); op:=readkey;
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

procedure Listado_vuelos_pasajero (var arch_v:venta; id_p:integer);
var reg:t_venta; pos:integer; a,p,p_2:integer; x,y:integer; op:char;
begin
     clrscr;
     abrir_venta (arch_v);
     ordenar_venta (arch_v);
     seek (arch_v,0);
     p:=1;
     p_2:=0;
     a:=0;
     pos:=0;
     op:=' ';
     x:=7;
     repeat
     begin
          textcolor (yellow);
          textbackground (blue);
          gotoxy(x,p+1); writeln('--------------------------------------------------------------------- Ventas ---------------------------------------------------------------------');
          gotoxy(x,p+2); writeln('--------------------------------------------------------------------------------------------------------------------------------------------------');
          gotoxy(x,p+3); writeln('|           ID Venta           |    DNI Pasajero   |           ID Vuelo           |       Fecha       |     Hora     |           Costo           |');
          gotoxy(x,p+4); writeln('--------------------------------------------------------------------------------------------------------------------------------------------------');
          if eof(arch_v) then
          begin
               gotoxy(x,p+5); writeln('                                                                                                                                                  ');
               gotoxy(x,p+5); writeln('|');gotoxy(x+60,p+5); writeln('No hay ventas para mostrar');
               gotoxy(x+145,p+5); writeln('|');
               gotoxy(x,p+6); writeln('--------------------------------------------------------------------------------------------------------------------------------------------------');
               repeat
               begin
                    gotoxy (x,8);textcolor (blue);
                    textbackground (white); writeln ('|ESC| - Regresar al menu anterior'); gotoxy(x+33,8); op:=readkey;
               end;
               until op = #27;
          end
          else
          begin
               seek (arch_v,0);
               repeat
               begin
                    p:=1;
                    textbackground (blue);clrscr;
                    textcolor (yellow);
                    gotoxy(x,p+1); writeln('--------------------------------------------------------------------- Ventas ---------------------------------------------------------------------');
                    gotoxy(x,p+2); writeln('--------------------------------------------------------------------------------------------------------------------------------------------------');
                    gotoxy(x,p+3); writeln('|           ID Venta           |    DNI Pasajero   |           ID Vuelo           |       Fecha       |     Hora     |           Costo           |');
                    gotoxy(x,p+4); writeln('--------------------------------------------------------------------------------------------------------------------------------------------------');
                    while (not eof(arch_v)) and (p<=5) do
                    begin
                         leer_venta(arch_v,pos,reg);
                         inc(pos);
                         if not (reg.activo) or (id_p<>reg.id_pasajero) then
                         begin
                            dec (p);
                         end
                         else
                             inc (p_2);

                         if (id_p=reg.id_pasajero) and (reg.activo) then
                         begin
                            mostrar_ventas_listado(reg,p,p_2);
                            inc(a);   
                         end;

                        if eof(arch_v) and (a=0) then
                        begin
                            p:=1;
                            gotoxy(x,p+5); writeln('                                                                                                                                                  ');
                            gotoxy(x,p+5); writeln('|');gotoxy(x+60,p+5); writeln('No hay vuelos para mostrar');
                            gotoxy(x+143,p+5); writeln('|');
                            gotoxy(x,p+6); writeln('------------------------------------------------------------------------------------------------------------------------------------------------');
                        end;

                         inc(p);
                         y:=p;
                    end;
                    if eof (arch_v) then
                    begin
                         repeat
                         begin
                              gotoxy (x,y+8);textcolor (blue);
                              textbackground (white); writeln ('|ESC| - Regresar al menu anterior'); gotoxy(x+33,y+8); op:=readkey;
                         end;
                         until op in ['2','3',#27];
                    end
                    else
                    begin
                         repeat
                         begin
                              gotoxy(x,y+7); writeln('|1| - Continuar con los 5 proximos registros');
                              gotoxy (x,y+9); writeln ('|ESC| - Regresar al menu anterior'); gotoxy(x+33,y+9); op:=readkey;
                         end;
                         until op in ['1',#27];
                    end;
               end;
               until op = #27;
           end;
      end;
      until op = #27;
      close (arch_v);
end;

procedure vuelos_despegan_aeropuerto(var arch:vuelo; var arch_a:aeropuerto);
var x,y:integer; dia,mes,anio,id_a:integer; op:char;
begin
     clrscr;
     x:=50;
     y:=14;
     dia:=0;mes:=0;anio:=0;
     op:=' ';
     repeat
     begin
          datos (x,y);
          si_existe_aeropuerto_origen(arch_a,id_a,x+2,y+4);
          gotoxy(x+32,y+4); writeln('D: ');
          validacion_fecha (dia,1,x+35,y+4);
          gotoxy(x+32,y+6); writeln('M: ');
          validacion_fecha (mes,2,x+35,y+6);
          gotoxy(x+32,y+8); writeln('A: ');
          validacion_fecha (anio,3,x+35,y+8);
          repeat
          begin
               gotoxy (x,y+13); writeln ('|ENTER| - continuar');
               gotoxy (x,y+15); writeln ('|ESC| - Regresar al menu anterior'); gotoxy(x+33,y+15); op:=readkey;
          end;
          until op in [#13,#27];
          if op = #13 then
             listado_vuelos(arch,dia,mes,anio,id_a);
     end;
     until op in [#13,#27];
end;


Procedure Rango_de_fechas(var arch:vuelo; var arch_aer:aerolinea);
var x,y:integer; id_aer,dia_i,mes_i,anio_i,dia_f,mes_f,anio_f:integer; op:char;
begin
     clrscr;
     x:=44;
     y:=14;
     dia_i:=0;mes_i:=0;anio_i:=0;
     dia_f:=0;mes_f:=0;anio_f:=0;
     op:=' ';
     repeat
     begin
          datos_2 (x,y);
          si_existe_aerolinea(arch_aer,id_aer,x+2,y+4);
          gotoxy(x+32,y+4); writeln('D: ');
          validacion_fecha (dia_i,1,x+35,y+4);
          gotoxy(x+32,y+6); writeln('M: ');
          validacion_fecha (mes_i,2,x+35,y+6);
          gotoxy(x+32,y+8); writeln('A: ');
          validacion_fecha (anio_i,3,x+35,y+8);
          gotoxy(x+60,y+4); writeln('D: ');
          validacion_fecha (dia_f,1,x+63,y+4);
          gotoxy(x+60,y+6); writeln('M: ');
          validacion_fecha (mes_f,2,x+63,y+6);
          gotoxy(x+60,y+8); writeln('A: ');
          validacion_fecha (anio_f,3,x+63,y+8);
          repeat
          begin
               gotoxy (x,y+13); writeln ('|ENTER| - continuar');
               gotoxy (x,y+15); writeln ('|ESC| - Regresar al menu anterior'); gotoxy(x+33,y+15); op:=readkey;
          end;
          until op in [#13,#27];
          if op = #13 then
             listado_vuelos_rango(arch,dia_i,mes_i,anio_i,dia_f,mes_f,anio_f,id_aer);
     end;
     until op in [#13,#27];
end; 

Procedure Vuelos_pasajero (var arch_v:venta; var arch_p:pasajero);
var x,y:integer; id_p:integer; op:char;
begin
     clrscr;
     x:=46;
     y:=14;
     op:=' ';
     repeat
     begin
          datos_3 (x,y);
          si_existe_pasajero(arch_p,id_p,x+2,y+4);
          gotoxy(x+69,y+4); writeln('|');
          repeat
          begin
               gotoxy (x,y+7); writeln ('|ENTER| - continuar');
               gotoxy (x,y+9); writeln ('|ESC| - Regresar al menu anterior'); gotoxy(x+33,y+9); op:=readkey;
          end;
          until op in [#13,#27];
          if op = #13 then
             Listado_vuelos_pasajero(arch_v,id_p);
     end;
     until op in [#13,#27];
end; 

procedure menu_extra();
var op:char; x,y:integer;
begin
     x:=42;
     y:=12;
     clrscr;
     repeat
     begin
          repeat
          begin
               textbackground(blue);clrscr;
               textcolor (lightgreen);
               gotoxy (x,y);writeln('-----------------------------------------------------------------------------------');
               gotoxy (x,y+1);writeln('|');
               gotoxy (x+82,y+1);writeln('|');
               gotoxy (x,y+2);writeln('|');
               gotoxy (x+30,y+2);writeln('Informacion Adicional');
               gotoxy (x+82,y+2);writeln('|');
               gotoxy (x,y+3);writeln('|');
               gotoxy (x+82,y+3);writeln('|');
               gotoxy (x,y+4);writeln('-----------------------------------------------------------------------------------');
               gotoxy (x,y+5);writeln('|');
               gotoxy (x+82,y+5);writeln('|');
               gotoxy (x,y+6);writeln('|');
               gotoxy (x+2,y+6);writeln('1 - Dada una fecha, listado de vuelos que despegan de un determinado aeropuerto');
               gotoxy (x+82,y+6);writeln('|');
               gotoxy (x,y+7);writeln('|');
               gotoxy (x+82,y+7);writeln('|');
               gotoxy (x+1,y+8);writeln('---------------------------------------------------------------------------------');
               gotoxy (x,y+9);writeln('|');
               gotoxy (x+82,y+9);writeln('|');
               gotoxy (x,y+10);writeln('|');
               gotoxy (x+2,y+10);writeln('2 - Dado un rango de fechas, vuelos realizados por una aerolinea');
               gotoxy (x+82,y+10);writeln('|');
               gotoxy (x,y+11);writeln('|');
               gotoxy (x+82,y+11);writeln('|');
               gotoxy (x+1,y+12);writeln('--------------------------------------------------------------------------------');
               gotoxy (x,y+13);writeln('|');
               gotoxy (x+82,y+13);writeln('|');
               gotoxy (x,y+14);writeln('|');
               gotoxy (x+2,y+14);writeln('3 - Dado un pasajero determinar todos los vuelos que ha realizado');
               gotoxy (x+82,y+14);writeln('|');
               gotoxy (x,y+15);writeln('|');
               gotoxy (x+82,y+15);writeln('|');
               gotoxy (x+1,y+16);writeln('---------------------------------------------------------------------------------');
               gotoxy (x,y+17);writeln('|');
               gotoxy (x+82,y+17);writeln('|');
               gotoxy (x,y+18);writeln('|');
               gotoxy (x+24,y+18);textbackground (white);textcolor (blue);writeln('|ESC| - Regresar al menu anterior'); textcolor (lightgreen); textbackground (9);
               gotoxy (x+82,y+18);writeln('|');
               gotoxy (x,y+19);writeln('|');
               gotoxy (x+82,y+19);writeln('|');
               gotoxy (x,y+20);writeln('-----------------------------------------------------------------------------------');
               gotoxy (x+57,y+18);op:=readkey;
          end;
          until op in ['1','2','3',#27];
          case op of
               '1':vuelos_despegan_aeropuerto(arch,arch_a);
               '2':Rango_de_fechas(arch,arch_aer);
               '3':Vuelos_pasajero(arch_v,arch_p);
          end;
    end;
    until op = #27;
end;
begin

end.
