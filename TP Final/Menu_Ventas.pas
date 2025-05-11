unit Menu_Ventas;
interface
uses crt,ventas,pasajeros,dos,validacion,vuelos,mensajes;

var arch:venta;arch_p:pasajero; arch_v:vuelo;

procedure menu_venta ();

implementation

procedure si_existe_vuelo(var arch_v:vuelo; var reg:t_venta; var pos2:integer; x,y:integer);
var op:char; id_v:integer; reg_v:t_vuelo;  pos:integer;
begin
     abrir_vuelo (arch_v);
     repeat
     begin
          validacion_entero (id_v,10,x,y);
          buscar_vuelo_id(arch_v,reg_v,pos,id_v);
          if (pos = (-1)) then  
          begin
               gotoxy (x,y);writeln('                               ');
               repeat
               begin
                    gotoxy (x,y);writeln('Error vuelo inexistente | ENTER - Continuar'); gotoxy (x+44,y); op:=readkey;
                    gotoxy (x,y);writeln('                                           ');
               end;
               until op = #13;
               end
          else if (pos <> (-1)) then
          begin
               if reg_v.activo then
               begin
                    reg.id_vuelo:=id_v;
               end
               else
               begin

                    gotoxy (x,y);writeln('                                                    ');
                    repeat
                    begin
                         gotoxy (x,y);writeln('Error vuelo en estado de baja | ENTER - Continuar'); gotoxy (x+49,y); op:=readkey;
                         gotoxy (x,y);writeln('                                                        ');
                    end;
                    until op = #13;
               end
          end;
     end;
     until ((pos<>-1) and (reg_v.activo=true));
     pos2:=pos;
     close (arch_v);
end;

procedure si_existe_pasajero(var arch_p:pasajero; var reg:t_venta; x,y:integer);
var op:char; id:integer; reg_p:t_pasajero; pos:integer;
begin
     abrir_pasajero(arch_p);
     repeat
     begin
          pos:=-1;
          validacion_dni(id,x,y);
          buscar_pasajero_id(arch_p,reg_p,pos,id);
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
                    reg.id_pasajero:=id;
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

procedure datos(x,y:integer);
begin
     textcolor (yellow);
     textbackground (blue);
     gotoxy(x,y); writeln  ('--------------------------------------------------------------------- Ventas ---------------------------------------------------------------------');
     gotoxy(x,y+1); writeln('--------------------------------------------------------------------------------------------------------------------------------------------------');
     gotoxy(x,y+2); writeln('|           ID Venta           |    ID Pasajero    |           ID Vuelo           |       Fecha       |     Hora     |           Costo           |');
     gotoxy(x,y+3); writeln('--------------------------------------------------------------------------------------------------------------------------------------------------');
end;

Procedure mostrar_Ventas(reg:t_Venta; x,y:integer);
begin
     datos (x,y);
     with reg do
     begin
          datos (x,y);
          gotoxy(x,y+4); writeln('|');gotoxy(x+2,y+4); writeln(id_venta);
          gotoxy(x+31,y+4); writeln('|');gotoxy(x+33,y+4); writeln(id_pasajero);
          gotoxy(x+51,y+4); writeln('|');gotoxy(x+53,y+4); writeln(id_vuelo);
          gotoxy(x+82,y+4); writeln('|');
          if fecha.dia in [1,2,3,4,5,6,7,8,9] then
          begin
               gotoxy(x+86,y+4); writeln('0');
               gotoxy(x+87,y+4); writeln(fecha.dia);
          end
          else
              gotoxy(x+86,y+4); writeln(fecha.dia);
          gotoxy(x+88,y+4); writeln('/');
          if fecha.mes in [1,2,3,4,5,6,7,8,9] then
          begin
               gotoxy(x+89,y+4); writeln('0');
               gotoxy(x+90,y+4); writeln(fecha.mes);
          end
          else
              gotoxy(x+89,y+4); writeln(fecha.mes);
          gotoxy(x+91,y+4); writeln('/');gotoxy(x+92,y+4); writeln(fecha.anio);
          gotoxy(x+102,y+4); writeln('|');
          if fecha.hora in [0,1,2,3,4,5,6,7,8,9] then
          begin
               gotoxy(x+106,y+4); writeln('0');
               gotoxy(x+107,y+4); writeln(fecha.hora);
          end
          else
              gotoxy(x+106,y+4); writeln(fecha.hora);
          gotoxy(x+108,y+4); writeln(':');
          if fecha.minutos in [0,1,2,3,4,5,6,7,8,9] then
          begin
               gotoxy(x+109,y+4); writeln('0');
               gotoxy(x+110,y+4); writeln(fecha.minutos);
          end
          else
              gotoxy(x+109,y+4); writeln(fecha.minutos);
          gotoxy(x+117,y+4); writeln('|');gotoxy(x+119,y+4); writeln('$ ',costo:2:2);
          gotoxy(x+145,y+4); writeln('|');
          gotoxy(x,y+5); writeln('--------------------------------------------------------------------------------------------------------------------------------------------------');
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
          if reg.activo then
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
end;

procedure Listado_ventas_5 (var arch:venta; var op:char );
var reg:t_venta; pos:integer; p,p_2:integer; x,y:integer;
begin
     p:=1;
     p_2:=0;
     pos:=0;
     x:=7;
     seek (arch,0);
     repeat
     begin
          textcolor (yellow);
          textbackground (blue);
          gotoxy(x,p+1); writeln('--------------------------------------------------------------------- Ventas ---------------------------------------------------------------------');
          gotoxy(x,p+2); writeln('--------------------------------------------------------------------------------------------------------------------------------------------------');
          gotoxy(x,p+3); writeln('|           ID Venta           |    ID Pasajero    |           ID Vuelo           |       Fecha       |     Hora     |           Costo           |');
          gotoxy(x,p+4); writeln('--------------------------------------------------------------------------------------------------------------------------------------------------');
          if eof(arch) then
          begin
               gotoxy(x,p+5); writeln('                                                                                                                                                  ');
               gotoxy(x,p+5); writeln('|');gotoxy(x+60,p+5); writeln('No hay ventas para mostrar');
               gotoxy(x+145,p+5); writeln('|');
               gotoxy(x,p+6); writeln('--------------------------------------------------------------------------------------------------------------------------------------------------');
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
                    gotoxy(x,p+1); writeln('--------------------------------------------------------------------- Ventas ---------------------------------------------------------------------');
                    gotoxy(x,p+2); writeln('--------------------------------------------------------------------------------------------------------------------------------------------------');
                    gotoxy(x,p+3); writeln('|           ID Venta           |    ID Pasajero    |           ID Vuelo           |       Fecha       |     Hora     |           Costo           |');
                    gotoxy(x,p+4); writeln('--------------------------------------------------------------------------------------------------------------------------------------------------');
                    while (not eof(arch)) and (p<=5) do
                    begin
                         leer_venta(arch,pos,reg);
                         inc(pos);
                         if not (reg.activo) then
                         begin
                            dec (p);
                         end
                         else
                             inc (p_2);
                         mostrar_ventas_listado(reg,p,p_2);
                         inc(p);
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

procedure alta_venta (var arch:venta; var arch_p:pasajero; var arch_v:vuelo);
var id:integer; pos,pos2:integer; op:char; reg:t_venta; cond:char; x,y:integer; reg_v:t_vuelo;
begin
     op:=' ';
     x:=5;
     y:=7;
     textbackground (blue);clrscr;
     abrir_venta (arch);
     ordenar_venta (arch);
     listado_ventas_5(arch,op);
     if op = '2' then
     begin
          repeat
          begin
               textbackground (blue);clrscr;
               datos (x,y);
               with reg do
               begin
                    id_venta:= filesize (arch)+1;
                    activo:=true;
                    si_existe_pasajero (arch_p,reg,x+33,y+4);
                    si_existe_vuelo (arch_v,reg,pos2,x+53,y+4);
                    gotoxy(x+84,y+4); writeln('D: ');
                    validacion_fecha_2 (fecha.dia,1,x+87,y+4);
                    gotoxy(x+84,y+6); writeln('M: ');
                    validacion_fecha_2 (fecha.mes,2,x+87,y+6);
                    gotoxy(x+84,y+8); writeln('A: ');
                    validacion_fecha_2 (fecha.anio,3,x+87,y+8);
                    gotoxy(x+104,y+4); writeln('H: ');
                    validacion_fecha_2 (fecha.hora,4,x+107,y+4);
                    gotoxy(x+104,y+6);writeln('M: ');
                    validacion_fecha (fecha.minutos,5,x+107,y+6);
                    validacion_real (costo,10,x+119,y+4);
               end;
               repeat
               begin
                    textbackground (blue);clrscr;
                    mostrar_ventas (reg,x,y);
                    gotoxy (x,y+10);textcolor (white);
                    textbackground (black); writeln ('Desea confirmar la operacion? s/n: ');
                    gotoxy (x+34,y+10); cond:=readkey;
               end;
               until cond in ['S','s','N','n'];
               if (cond = 'S') or (cond = 's') then
               begin
                    guardar_venta (arch,reg);
                    abrir_vuelo (arch_v);
                    aumentar_pasajeros_vuelos(arch_v,pos2);
                    close (arch_v);
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
                 buscar_venta_id (arch,reg,pos,id);
                 if pos = (-1) then
                 begin
                      msj_inexistente (op,x,y);
                 end
                 else
                 begin
                      leer_venta (arch,pos,reg);
                      if reg.activo then
                      begin
                           repeat
                           begin
                                textbackground(blue);clrscr;
                                gotoxy (x,y-2);textcolor (white);
                                textbackground (black); writeln ('Venta existente:');
                                mostrar_ventas(reg,x,y);
                                gotoxy (x,y+7); textbackground(white);textcolor(blue);writeln ('|ESC| - Regresar al menu anterior'); gotoxy (x+33,y+7); op:=readkey;
                           end;
                           until op = #27;
                      end
                      else
                      begin
                           repeat
                           begin
                                textbackground (blue);clrscr;
                                gotoxy (x,y-2);textcolor (white);
                                textbackground (black); writeln ('Venta dada de baja:');
                                mostrar_Ventas(reg,x,y);
                                gotoxy (x,y+7); writeln ('|1| - Reactivar');
                                gotoxy (x,y+9);textcolor (blue);
                                textbackground (white); writeln ('|ESC| - Regresar al menu anterior'); gotoxy (x+33,y+9); op:=readkey;
                           end;
                           until op in ['1',#27];
                           if op = '1' then
                           begin
                                reg.activo:=true;
                                repeat
                                begin
                                     textbackground (blue);clrscr;
                                     mostrar_ventas (reg,x,y);
                                     gotoxy (x,y+7);textcolor (white);
                                     textbackground (black); writeln ('Desea confirmar la operacion? s/n: ');
                                     gotoxy (x+31,y+7); cond:=readkey;
                                end;
                                until cond in ['S','N','s','n'];
                                if (cond = 'S') or (cond = 's') then
                                begin
                                     abrir_vuelo (arch_v);
                                     buscar_vuelo_id(arch_v,reg_v,pos2,reg.id_vuelo);
                                     aumentar_pasajeros_vuelos(arch_v,pos2);
                                     close (arch_v);
                                     modificar_ven (arch,pos,reg);
                                     msj_exitoso(op,x,y);
                                end
                                else
                                    msj_cancelado(op,x,y);
                           end;
                      end;
                 end;
            end;
            until op=#27;
      close (arch);
end;

procedure baja_Venta(var arch:Venta);
var id:integer; pos,pos2:integer; op:char; reg:t_Venta; cond:char; x,y:integer; reg_v:t_vuelo;
begin
     x:=5;
     y:=7;
     abrir_Venta (arch);
     textbackground (blue);clrscr;
     menu_confirmacion (op,58,12);
     if op = '1' then
        repeat
        begin
             textbackground (blue);clrscr;
             datos (x,y);
             validacion_entero (id,10,x+2,y+4);
             buscar_Venta_id (arch,reg,pos,id);
             if pos = (-1) then
             begin
                  msj_inexistente(op,x,y);
             end
             else
             begin
                  leer_venta (arch,pos,reg);
                  if reg.activo then
                  begin
                       repeat
                       begin
                            textbackground(blue);clrscr;
                            gotoxy (x,y-2);textcolor (white);
                            textbackground (black); writeln ('Venta existente:');
                            mostrar_ventas(reg,x,y);
                            gotoxy (x,y+7);textcolor (white);
                            textbackground (black); writeln ('|1| - Dar de baja');
                            gotoxy (x,y+9);textcolor (blue);
                            textbackground (white); writeln ('|ESC| - Regresar al menu anterior'); gotoxy (x+33,y+9); op:=readkey;
                       end;
                       until op in ['1',#27];
                       if op = '1' then
                       begin
                            reg.activo:=false;
                            repeat
                            begin
                                 textbackground (blue);clrscr;
                                 mostrar_ventas (reg,x,y);
                                 gotoxy (x,y);textbackground(black);textcolor(white); writeln ('Desea confirmar la operacion? s/n: ');
                                 gotoxy (x+34,y); cond:=readkey;
                            end;
                            until cond in ['N','S','n','s'];
                            if (cond = 'S') or (cond = 's') then
                            begin
                                 abrir_vuelo (arch_v);
                                 buscar_vuelo_id(arch_v,reg_v,pos2,reg.id_vuelo);
                                 reducir_pasajeros_vuelos(arch_v,pos2);
                                 close (arch_v);
                                 modificar_ven (arch,pos,reg);
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

procedure modificar_venta(var arch:venta;var arch_p:pasajero; var arch_v:vuelo);
var id:integer; pos,pos2,pos3:integer; op:char; reg,reg_2:t_venta; cond:char; minutos,dia,mes,anio,hora:integer; costo:real; x,y:integer; reg_v:t_vuelo;
begin     
     x:=5;
     y:=7;
     abrir_venta(arch);
     textbackground (blue);clrscr;
     menu_confirmacion (op,58,12);
     if op = '1' then
        repeat
        begin
             textbackground (blue);clrscr;
             datos	(x,y);
             validacion_entero (id,10,x+2,y+4);
             buscar_venta_id (arch,reg,pos,id);
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
                            textbackground (blue);clrscr;
                            repeat
                            begin
                                 gotoxy (x,y-2);textcolor (white);
                                 textbackground (black); writeln ('Venta existente:');
                                 mostrar_ventas(reg,x,y); textcolor (white);
                                 textbackground (black); gotoxy (x+33,y+2); writeln ('1');
                                 gotoxy (x+53,y+2); writeln ('2');
                                 gotoxy (x+84,y+2); writeln ('3');
                                 gotoxy (x+104,y+2); writeln ('4');
                                 gotoxy (x+119,y+2); writeln ('5');
                                 gotoxy (x,y+7); writeln ('Ingrese el numero para modificar dicho campo');
                                 gotoxy (x,y+9);textcolor (blue);
                                 textbackground (white); writeln ('|ESC| - Regresar al menu anterior'); gotoxy (x+33,y+9); op:=readkey;
                            end;
                            until op in ['1','2','3','4','5',#27];
                            case op of
                                 '1':
                                     begin
                                          gotoxy (x,y+11); writeln ('                                              ');
                                          gotoxy (x,y+11);textcolor (white);
                                          textbackground (black); writeln ('ID Pasajero: '); si_existe_pasajero (arch_p,reg_2,x+13,y+11);
                                          repeat
                                          begin
                                               gotoxy (x,y+13);textcolor (white);
                                               textbackground (black); writeln ('Desea confirmar la operacion? s/n:                         ');
                                               gotoxy (x+36,y+13); cond:=readkey;
                                          end;
                                          until cond in ['S','N','s','n'];
                                          if (cond = 'S') or (cond = 's') then
                                          begin
                                               reg.id_pasajero:=reg_2.id_pasajero;
                                               modificar_ven (arch,pos,reg);
                                          end;
                                     end;
                                 '2':
                                     begin
                                          gotoxy (x,y+11); writeln ('                                              ');
                                          gotoxy (x,y+11);textcolor (white);
                                          textbackground (black); writeln ('ID Vuelo: '); si_existe_vuelo (arch_v,reg_2,pos2,x+10,y+11);
                                          repeat
                                          begin
                                               gotoxy (x,y+13);textcolor (white);
                                               textbackground (black); writeln ('Desea confirmar la operacion? s/n:                         ');
                                               gotoxy (x+36,y+13); cond:=readkey;
                                          end;
                                          until cond in ['S','N','s','n'];
                                          if (cond = 'S') or (cond = 's') then
                                          begin
                                               abrir_vuelo (arch_v);
                                               buscar_vuelo_id (arch_v,reg_v,pos3,reg.id_vuelo);
                                               reducir_pasajeros_vuelos(arch_v,pos3);
                                               reg.id_vuelo:=reg_2.id_vuelo;
                                               aumentar_pasajeros_vuelos(arch_v,pos2);
                                               close (arch_v);
                                               modificar_ven (arch,pos,reg);
                                          end;
                                     end;
                                 '3':
                                     begin
                                          gotoxy (x,y+11); writeln ('                                   ');
                                          gotoxy (x,y+11); writeln('D: ');
                                          validacion_fecha_2 (dia,1,x+3,y+11);
                                          gotoxy(x,y+13); writeln('M: ');
                                          validacion_fecha_2 (mes,2,x+3,y+13);
                                          gotoxy(x,y+15); writeln('A: ');
                                          validacion_fecha_2 (anio,3,x+3,y+15);
                                          repeat
                                          begin
                                               gotoxy (x,y+17);textcolor (white);
                                               textbackground (black); writeln ('Desea confirmar la operacion? s/n: ');
                                               gotoxy (x+34,y+17); cond:=readkey;
                                          end;
                                          until cond in ['S','N','s','n'];
                                          if (cond = 'S') or (cond = 's') then
                                          begin
                                               with reg do
                                               begin
                                                    fecha.dia:=dia;
                                                    fecha.mes:=mes;
                                                    fecha.anio:=anio;
                                               end;
                                               modificar_ven(arch,pos,reg);
                                          end;
                                     end;
                                 '4':
                                     begin
                                          gotoxy (x,y+11); writeln ('                                   ');
                                          gotoxy(x,y+11);textcolor (white);
                                          textbackground (black); writeln('H: ');
                                          validacion_fecha_2 (hora,4,x+3,y+11);
                                          gotoxy(x,y+13);writeln('M: ');
                                          validacion_fecha (minutos,5,x+3,y+13);
                                          repeat
                                          begin
                                               gotoxy (x,y+15);textcolor (white);
                                               textbackground (black); writeln ('Desea confirmar la operacion? s/n: ');
                                               gotoxy (x+34,y+15); cond:=readkey;
                                          end;
                                          until cond in ['S','N','s','n'];
                                          if (cond = 'S') or (cond = 's') then
                                          begin
                                               with reg do
                                               begin
                                                    fecha.hora:=hora;
                                                    fecha.minutos:=minutos;
                                               end;
                                               modificar_ven(arch,pos,reg);
                                          end;
                                     end;
                                 '5':
                                     begin
                                          gotoxy (x,y+11); writeln ('                                              ');
                                          gotoxy (x,y+11);textcolor (white);
                                          textbackground (black); writeln ('Costo:'); validacion_real (costo,10,x+119,y+11);
                                          repeat
                                          begin
                                               gotoxy (x,y+13);textcolor (white);
                                               textbackground (black); writeln ('Desea confirmar la operacion? s/n: ');
                                               gotoxy (x+34,y+13); cond:=readkey;
                                          end;
                                          until cond in ['S','N','s','n'];
                                          if (cond = 'S') or (cond = 's') then
                                          begin
                                               reg.costo:=costo;
                                               modificar_ven (arch,pos,reg);
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

procedure consulta_Venta(var arch:Venta);
var op:char; reg:t_venta; pos:integer; id:integer; x,y:integer;
begin
     x:=5;
     y:=7;
     abrir_Venta (arch);
     textbackground (blue);clrscr;
     menu_confirmacion (op,58,12);
     if op = '1' then
        repeat
        begin
             textbackground (blue);clrscr;
             datos	(x,y);
             validacion_entero (id,10,x+2,y+4);
             buscar_Venta_id (arch,reg,pos,id);
             if pos = (-1) then
             begin
                  msj_inexistente(op,x,y);
             end
             else
             begin
                  if reg.activo then
                  begin
                       repeat
                       begin
                            textbackground(blue);clrscr;
                            gotoxy (x,y-2);textcolor (white);
                            textbackground (black); writeln ('Venta existente:');
                            mostrar_ventas(reg,x,y);
                            gotoxy (x,y+7);textcolor (blue);
                            textbackground (white); writeln ('|ESC| - Regresar al menu anterior'); gotoxy (x+33,y+7);op:=readkey;
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

procedure listado_venta (var arch:venta );
var reg:t_venta; pos:integer; p,p_2:integer; x,y:integer; op:char;
begin
     abrir_venta (arch);
     ordenar_venta (arch);
     seek (arch,0);
     repeat
     begin
          x:=7;
          p:=1;
          p_2:=0;
          pos:=0;
          clrscr;
          textcolor (yellow);
          textbackground (blue);
          gotoxy(x,p+1); writeln('--------------------------------------------------------------------- Ventas ---------------------------------------------------------------------');
          gotoxy(x,p+2); writeln('--------------------------------------------------------------------------------------------------------------------------------------------------');
          gotoxy(x,p+3); writeln('|           ID Venta           |    ID Pasajero    |           ID Vuelo           |       Fecha       |     Hora     |           Costo           |');
          gotoxy(x,p+4); writeln('--------------------------------------------------------------------------------------------------------------------------------------------------');
          if eof(arch) then
          begin
               gotoxy(x,p+5); writeln('                                                                                                                                                  ');
               gotoxy(x,p+5); writeln('|');gotoxy(x+60,p+5); writeln('No hay ventas para mostrar');
               gotoxy(x+145,p+5); writeln('|');
               gotoxy(x,p+6); writeln('--------------------------------------------------------------------------------------------------------------------------------------------------');
               repeat
               begin
                    gotoxy (x,9);textcolor (blue);
                    textbackground (white); writeln ('|ESC| - Regresar al menu anterior');; gotoxy(x+33,9); op:=readkey;
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
                    gotoxy(x,p+1); writeln('--------------------------------------------------------------------- Ventas ---------------------------------------------------------------------');
                    gotoxy(x,p+2); writeln('--------------------------------------------------------------------------------------------------------------------------------------------------');
                    gotoxy(x,p+3); writeln('|           ID Venta           |    ID Pasajero    |           ID Vuelo           |       Fecha       |     Hora     |           Costo           |');
                    gotoxy(x,p+4); writeln('--------------------------------------------------------------------------------------------------------------------------------------------------');
                    while (not eof(arch)) and (p<=5) do
                    begin
                         leer_venta(arch,pos,reg);
                         inc(pos);
                         if not (reg.activo) then
                         begin
                              dec (p);
                         end
                         else
                             inc (p_2);
                         mostrar_ventas_listado(reg,p,p_2);
                         inc(p);
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
                        repeat
                        begin
                             gotoxy(x,y+7);textcolor (white);
                             textbackground (black); writeln('|1| - Continuar con los 5 proximos registros');
                             gotoxy (x,y+9);textcolor (blue);
                             textbackground (white); writeln ('|ESC| - Regresar al menu anterior'); gotoxy(x+33,y+9); op:=readkey;
                        end;
                        until op in ['1',#27];
               end;
               until op = #27;
           end;
      end;
      until op = #27;
     close (arch_v);
end;

procedure borrar_archivo(var arch:venta);
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
      assign(arch,'ventas.dat');
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

procedure menu_venta();
var op:char; arch:venta; arch_p:pasajero; x,y:integer;
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
            gotoxy (x+10,y+2);writeln('Menu Ventas');
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
               '1':alta_venta(arch,arch_p,arch_v);
               '2':baja_venta(arch);
               '3':modificar_venta(arch,arch_p,arch_v);
               '4':consulta_venta(arch);
               '5':listado_venta (arch);
               '6':borrar_archivo(arch);
          end;
    end;
    until op = #27;
end;

begin

end.

