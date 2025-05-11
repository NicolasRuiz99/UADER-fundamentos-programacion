unit Menu_Pasajeros;
interface
uses crt,pasajeros,dos,validacion,mensajes;

var arch:pasajero;

procedure menu_pasajero ();

implementation

procedure datos (x,y:integer);
begin
     textcolor (yellow);
     textbackground (blue);
     gotoxy(x,y); writeln  ('------------------------------------------- Pasajeros ----------------------------------------------------');
     gotoxy(x,y+1); writeln('----------------------------------------------------------------------------------------------------------');
     gotoxy(x,y+2); writeln('|         DNI Pasajero         |          Nombre y Apellido          |           Nacionalidad            |');
     gotoxy(x,y+3); writeln('----------------------------------------------------------------------------------------------------------');
end;

procedure mostrar_pasajero (reg:t_pasajero; x,y:integer);
begin
    datos (x,y);
    with reg do
    begin
         datos(x,y);
         gotoxy(x+2,y+4);textcolor (yellow);
         textbackground (blue); writeln('                                                                                                          ');
         gotoxy(x,y+4); writeln('|');gotoxy(x+2,y+4); writeln(id_pasajero);
         gotoxy(x+31,y+4); writeln('|');gotoxy(x+33,y+4); writeln(nomyap);
         gotoxy(x+69,y+4); writeln('|');gotoxy(x+71,y+4); writeln(nacionalidad);
         gotoxy(x+105,y+4); writeln('|');
         gotoxy(x,y+5); writeln('----------------------------------------------------------------------------------------------------------')
    end;
end;

procedure mostrar_pasajero_listado (var reg:t_pasajero; p,p_2:integer);
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
               gotoxy(x+2,p+5); writeln('                                                                                                          ');
               gotoxy(x+2,p+5); writeln('|');gotoxy(x+4,p+5); writeln(id_pasajero);
               gotoxy(x+33,p+5); writeln('|');gotoxy(x+35,p+5); writeln(nomyap);
               gotoxy(x+71,p+5); writeln('|');gotoxy(x+73,p+5); writeln(nacionalidad);
               gotoxy(x+107,p+5); writeln('|');
               gotoxy(x+2,p+6); writeln('----------------------------------------------------------------------------------------------------------');
          end;
     end;
end;

procedure Listado_pasajeros_5 (var arch:pasajero; var op:char);
var reg:t_pasajero; pos:integer; p,p_2:integer; x,y:integer;
begin
     textbackground (blue);
     p:=1;
     p_2:=0;
     pos:=0;
     x:=7;
     seek (arch,0);
     repeat
     begin
          textcolor (yellow);
          textbackground (blue);
          gotoxy(x,p+1); writeln('------------------------------------------- Pasajeros ----------------------------------------------------');
          gotoxy(x,p+2); writeln('----------------------------------------------------------------------------------------------------------');
    	  gotoxy(x,p+3); writeln('|         DNI Pasajero         |          Nombre y Apellido          |           Nacionalidad            |');
    	  gotoxy(x,p+4); writeln('----------------------------------------------------------------------------------------------------------');
          if eof(arch) then
          begin
               gotoxy(x,p+5);textcolor (yellow);
               textbackground (blue); writeln('                                                                   ');
               gotoxy(x,p+5); writeln('|');gotoxy(x+35,p+5); writeln('No hay pasajeros para mostrar');
               gotoxy(x+99,p+5); writeln('|');
               gotoxy(x,p+6); writeln('----------------------------------------------------------------------------------------------------------');
               repeat
               begin
                    gotoxy(x,9);textcolor (white);
                    textbackground (black); writeln('|2| - Alta ');
                    gotoxy (x,11);textbackground (white);textcolor (blue); writeln ('|ESC| - Regresar al menu anterior'); gotoxy(x+33,11); op:=readkey;clrscr;
               end;
               until op in ['2',#27];
          end
          else
          begin
               seek (arch,0);
               repeat
               begin
                    p:=1;
                    textbackground (blue);clrscr;
                    gotoxy(x,p+1);textcolor (yellow);
                    writeln('------------------------------------------- Pasajeros ----------------------------------------------------');
                    gotoxy(x,p+2); writeln('----------------------------------------------------------------------------------------------------------');
                    gotoxy(x,p+3); writeln('|         DNI Pasajero         |          Nombre y Apellido          |           Nacionalidad            |');
                    gotoxy(x,p+4); writeln('----------------------------------------------------------------------------------------------------------');
                    while (not eof(arch)) and (p<=5) do
                    begin
                         leer_pasajero(arch,pos,reg);
                         inc(pos);
                         if not (reg.activo) then
                         begin
                            dec (p);
                         end
                         else
                             inc (p_2);
                         mostrar_pasajero_listado(reg,p,p_2);
                         inc(p);
                         y:=p;
                    end;
                    if eof (arch) then
                    begin
                         repeat
                         begin
                              gotoxy(x,y+9);textcolor (white);
                              textbackground (black); writeln('|2| - Alta ');
                              gotoxy (x,y+11);textcolor (blue);
                              textbackground (white); writeln ('|ESC| - Regresar al menu anterior'); gotoxy(x+33,y+11); op:=readkey;
                         end;
                         until op in ['2',#27];
                    end
                    else
                    begin
                         repeat
                         begin
                              gotoxy(x,y+7);textcolor (white);
                              textbackground (black); writeln('|1| - Continuar con los 5 proximos registros');
                              gotoxy(x,y+9); writeln('|2| - Alta ');
                              gotoxy (x,y+11);textcolor (blue);
                              textbackground (white); writeln ('|ESC| - Regresar al menu anterior'); gotoxy(x+33,y+11); op:=readkey;
                         end;
                         until op in ['1','2',#27];
                    end;
               end;
               until op in ['2',#27];
           end;
      end;
      until op in ['2',#27];
end;

procedure listado_pasajeros_nombre (var arch:pasajero; buscado:string);
var reg:t_pasajero; pos:integer; p,p_2:integer; x,y:integer; op:char;
begin
     p:=1;
     p_2:=0;
     pos:=0;
     x:=7;
     seek (arch,0);
     repeat
     begin
          gotoxy(x,p+1);textcolor (yellow);
          textbackground (blue); writeln('------------------------------------------- Pasajeros ----------------------------------------------------');
          gotoxy(x,p+2); writeln('----------------------------------------------------------------------------------------------------------');
          gotoxy(x,p+3); writeln('|         DNI Pasajero         |          Nombre y Apellido          |           Nacionalidad            |');
    	  gotoxy(x,p+4); writeln('----------------------------------------------------------------------------------------------------------');
          if eof(arch) then
          begin
               gotoxy(x,p+5);textcolor (yellow);
               textbackground (blue); writeln('                                                                   ');
               gotoxy(x,p+5); writeln('|');gotoxy(x+35,p+5); writeln('No hay pasajeros para mostrar');
               gotoxy(x+99,p+5); writeln('|');
               gotoxy(x,p+6); writeln('----------------------------------------------------------------------------------------------------------');
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
                    gotoxy(x,p+1);textcolor (yellow);
                    writeln('------------------------------------------- Pasajeros ----------------------------------------------------');
                    gotoxy(x,p+2); writeln('----------------------------------------------------------------------------------------------------------');
                    gotoxy(x,p+3); writeln('|         DNI Pasajero         |          Nombre y Apellido          |           Nacionalidad            |');
                    gotoxy(x,p+4); writeln('----------------------------------------------------------------------------------------------------------');
                    while (not eof(arch)) and (p<=5) do
                    begin
                         leer_pasajero(arch,pos,reg);
                         inc(pos);
                         if not (reg.activo) then
                         begin
                            dec (p);
                         end
                         else
                             inc (p_2);
                         if reg.nomyap = buscado then
                            mostrar_pasajero_listado(reg,p,p_2);
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
end;

procedure alta_pasajero(var arch:pasajero);
var dni:integer; pos:integer; op:char; reg:t_pasajero; cond:char; x,y:integer;
begin
     op:=' ';
     x:=5;
     y:=7;
     textbackground (blue);clrscr;
     abrir_pasajero (arch);
     listado_pasajeros_5 (arch,op);
     if op <> #27 then
     repeat
     begin
          textbackground (blue);clrscr;
          datos (x,y);
          validacion_dni (dni,x+2,y+4);
          buscar_pasajero_id (arch,reg,pos,dni);
          if pos = (-1) then
          begin
              with reg do
              begin
                  id_pasajero:=dni;
                  validacion_string (nomyap,38,x+33,y+4);
                  validacion_string (nacionalidad,38,x+71,y+4);
                  activo:=true;   
              end;
              repeat
              begin
                  textbackground (blue);clrscr;
                  mostrar_pasajero (reg,x,y);
                  gotoxy (x,y+7);textcolor (white);
                  textbackground (black); writeln ('Desea confirmar la operacion? s/n: ');
                  gotoxy (x+34,y+7); cond:=readkey;
              end;
              until cond in ['S','s','N','n'];
              
              if (cond = 'S') or (cond = 's') then
              begin
                  Guardar_pasajero (arch,reg);
                  msj_exitoso (op,x,y);
              end
              else
              begin
                  msj_cancelado (op,x,y);
              end;
          end
          else
          begin
              leer_pasajero (arch,pos,reg);
              if reg.activo then
              begin

                  repeat
                  begin
                      gotoxy (x,y-2);textcolor (white);
                      textbackground (black); writeln ('Pasajero existente:');
                      mostrar_pasajero (reg,x,y);
                      gotoxy (x,y+7);textcolor (blue);
                      textbackground (white); writeln ('|ESC| - Regresar al menu anterior'); gotoxy (x+33,y+7); op:=readkey;
                  end;
                  until op = #27;
              end
              else
              begin
                  textbackground (blue);clrscr;
                  repeat
                  begin
                      gotoxy (x,y-2);textcolor (white);
                      textbackground (black); writeln ('Pasajero dado de baja:');;
                      mostrar_pasajero (reg,x,y);
                      gotoxy (x,y+7);textcolor (white);
                      textbackground (black); writeln ('|1| - Reactivar');
                      gotoxy (x,y+9);textbackground (white);textcolor (blue); writeln ('|ESC| - Regresar al menu anterior'); gotoxy (x+33,y+9); op:=readkey;
                  end;
                  until op in ['1',#27];
                  if op = '1' then
                  begin
                      reg.activo:=true;
                      repeat
                      begin
                          textbackground (blue);clrscr;
                          mostrar_pasajero (reg,x,y);
                          gotoxy (x,y+7);textcolor (white);
                          textbackground (black); writeln ('Desea confirmar la operacion? s/n: ');
                          gotoxy (x+34,y+7); cond:=readkey;
                      end;
                      until cond in ['S','N','s','n'];
                      if (cond = 'S') or (cond = 's') then
                      begin
                          modificar_pas (arch,pos,reg);
                          msj_exitoso (op,x,y);
                      end
                      else
                      begin
                          msj_cancelado (op,x,y);
                      end;
                  end
                  else
              end;
          end;
      end;
      until op=#27;
      close (arch);
end;

procedure baja_pasajero(var arch:pasajero);
var dni:integer; pos:integer; op:char; reg:t_pasajero; cond:char; x,y:integer;
begin
     x:=5;
     y:=7;
     textbackground (blue);clrscr;
     abrir_pasajero(arch);
     menu_confirmacion (op,58,12);
     if op = '1' then
        repeat
        begin
             textbackground (blue);clrscr;
             datos (x,y);
             validacion_dni (dni,x+2,y+4);
             buscar_pasajero_id (arch,reg,pos,dni);
             if pos = (-1) then
             begin
                  msj_inexistente (op,x,y);
             end
             else
             begin
                  leer_pasajero (arch,pos,reg);
                  if reg.activo then
                  begin
                       repeat
                       begin
                            gotoxy (x,y-2);textcolor (white);
                            textbackground (black); writeln ('Pasajero existente:');
                            mostrar_pasajero (reg,x,y);
                            gotoxy (x,y+7);textcolor (white);
                            textbackground (black); writeln ('|1| - Dar de baja');
                            gotoxy (x,y+9);textcolor (blue);
                            textbackground (white); writeln ('|ESC| - Regresar al menu anterior'); gotoxy (x+33,y+9); op:=readkey;
                            textbackground (blue);
                       end;
                       until op in ['1',#27];
                       if op = '1' then
                       begin
                            reg.activo:=false;
                            repeat
                            begin
                                 textbackground (blue);clrscr;
                                 mostrar_pasajero (reg,x,y);
                                 gotoxy (x,y+7);textcolor (white);
                                 textbackground (black); writeln ('Desea confirmar la operacion? s/n: ');
                                 gotoxy (x+34,y+7); cond:=readkey;
                            end;
                            until cond in ['N','S','n','s'];
                            if (cond = 'S') or (cond = 's') then
                            begin
                                 modificar_pas (arch,pos,reg);
                                 msj_exitoso (op,x,y);
                            end
                            else
                                msj_cancelado (op,x,y);
                       end;
                  end
                  else
                      msj_baja (op,x,y);
             end;
        end;
        until op=#27;
        close (arch);
end;

procedure modificar_pasajero(var arch:pasajero);
var dni:integer; pos:integer; op:char; reg:t_pasajero; cond:char; nomyap:string [40]; nacionalidad:string [60]; x,y:integer;
begin
     x:=5;
     y:=7;
     textbackground (blue);clrscr;
     abrir_pasajero (arch);
     menu_confirmacion (op,58,12);
     if op = '1' then
        repeat
        begin
             textbackground (blue);clrscr;
             datos (x,y);
             validacion_dni (dni,x+2,y+4);
             buscar_pasajero_id (arch,reg,pos,dni);
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
                                 gotoxy (x,y-2);textcolor (white);
                                 textbackground (black); writeln ('Pasajero existente:');
                                 mostrar_pasajero (reg,x,y);
                                 gotoxy (x+33,y+2);textcolor (white);
                                 textbackground (black); writeln ('1');
                                 gotoxy (x+71,y+2); writeln ('2');
                                 gotoxy (x,y+7); writeln ('Ingrese el numero para modificar dicho campo');
                                 gotoxy (x,y+9);textbackground (white);textcolor (blue); writeln ('|ESC| - Regresar al menu anterior'); gotoxy (x+33,y+9); op:=readkey;textbackground (blUE);
                            end;
                            until op in ['1','2',#27];
                            case op of
                                 '1':
                                     begin
                                          gotoxy (x,y+11); writeln ('                                              ');
                                          gotoxy (x,y+11);textcolor (white);
                                          textbackground (black); writeln ('Nombre y Apellido: '); validacion_string (nomyap,38,x+19,y+11);
                                          repeat
                                          begin
                                               gotoxy (x,y+13);textcolor (white);
                                               textbackground (black); writeln ('Desea confirmar la operacion? s/n: ');
                                               gotoxy (x+34,y+13); cond:=readkey;textbackground (blUE);clrscr;
                                          end;
                                          until cond in ['S','N','s','n'];
                                          if (cond = 'S') or (cond = 's') then
                                          begin
                                               reg.nomyap:=nomyap;
                                               modificar_pas (arch,pos,reg);
                                          end;
                                     end;
                                 '2':
                                     begin
                                          gotoxy (x,y+11); writeln ('                                              ');
                                          gotoxy (x,y+11);textcolor (white);
                                          textbackground (black); writeln ('Nacionalidad: '); validacion_string (nacionalidad,38,x+14,y+11);
                                          repeat
                                          begin
                                               gotoxy (x,y+13);textcolor (white);
                                               textbackground (black); writeln ('Desea confirmar la operacion? s/n: ');
                                               gotoxy (x+36,y+13); cond:=readkey; textbackground (blue);clrscr;
                                          end;
                                          until cond in ['S','N','s','n'];
                                          if (cond = 'S') or (cond = 's') then
                                          begin
                                               reg.nacionalidad:=nacionalidad;
                                               modificar_pas (arch,pos,reg);
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

procedure menu_busqueda (var arch:pasajero; op:char; x,y:integer);
var nom:string[60]; pos:integer; reg:t_pasajero; id:integer;
begin
     repeat
     begin
          case op of
               '1':
                   begin
                        textbackground (blue);clrscr;
                        datos (x,y);
                        validacion_string (nom,40,x+33,y+4);
                        textbackground (blue);clrscr;
                        listado_pasajeros_nombre (arch,nom);
                   end;
               '2':
                   begin
                        textbackground (blue);clrscr;
                        datos (x,y);
                        validacion_entero (id,40,x+2,y+4);
                        buscar_pasajero_id (arch,reg,pos,id);
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
                                       gotoxy (x,y-2);textcolor (white);
                                       textbackground (black); writeln ('Pasajero existente:');
                                       datos(x,y);
                                       mostrar_pasajero (reg,x,y);
                                       gotoxy (x,y+7);textcolor (blue);
                                       textbackground (white); writeln ('|ESC| - Regresar al menu anterior'); gotoxy (x+33,y+7); op:=readkey;
                                  end;
                                  until op = #27;
                             end
                             else
                                 msj_baja (op,x,y);
                        end;
                   end;
          end;
          op:= #27;
     end;
     until op = #27;
end;

procedure consulta_pasajero(var arch:pasajero);
var op:char; x,y:integer;
begin
     x:=5;
     y:=7;
     abrir_pasajero (arch);
     repeat
     begin
          menu_consulta (op,58,12);
          if (op = '1') or (op = '2') then
             menu_busqueda (arch,op,x,y);
     end;
     until op = #27;
     close (arch);
end;

procedure Listado_pasajero (var arch:pasajero);
var reg:t_pasajero; pos:integer; p,p_2:integer; x,y:integer; op:char;
begin
     textbackground (blue);clrscr;
     abrir_pasajero (arch);
     p:=1;
     p_2:=0;
     pos:=0;
     x:=7;
     seek (arch,0);
     repeat
     begin
          gotoxy(x,p+1);textcolor (yellow);
          textbackground (blue); writeln('------------------------------------------- Pasajeros ----------------------------------------------------');
          gotoxy(x,p+2); writeln('----------------------------------------------------------------------------------------------------------');
          gotoxy(x,p+3); writeln('|         DNI Pasajero         |          Nombre y Apellido          |            Nacionalidad           |');
          gotoxy(x,p+4); writeln('----------------------------------------------------------------------------------------------------------');
          if eof(arch) then
          begin
               gotoxy(x,p+5);textcolor (yellow);
               textbackground (blue); writeln('                                                                   ');
               gotoxy(x,p+5); writeln('|');gotoxy(x+35,p+5); writeln('No hay pasajeros para mostrar');
               gotoxy(x+99,p+5); writeln('|');
               gotoxy(x,p+6); writeln('----------------------------------------------------------------------------------------------------------');
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
                    gotoxy(x,p+1);textcolor (yellow);
                    textbackground (blue); writeln('------------------------------------------- Pasajeros ----------------------------------------------------');
                    gotoxy(x,p+2); writeln('----------------------------------------------------------------------------------------------------------');
                    gotoxy(x,p+3); writeln('|         DNI Pasajero         |          Nombre y Apellido          |            Nacionalidad           |');
                    gotoxy(x,p+4); writeln('----------------------------------------------------------------------------------------------------------');
                    while (not eof(arch)) and (p<=5) do
                    begin
                         leer_pasajero(arch,pos,reg);
                         inc(pos);
                         if not (reg.activo) then
                         begin
                            dec (p);
                         end
                         else
                             inc (p_2);
                         mostrar_pasajero_listado(reg,p,p_2);
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
                    begin
                         repeat
                         begin
                              gotoxy(x,y+7);textcolor (white);
                              textbackground (black); writeln('|1| - Continuar con los 5 proximos registros');
                              gotoxy (x,y+9);textcolor (blue);
                              textbackground (white); writeln ('|ESC| - Regresar al menu anterior'); gotoxy(x+33,y+9); op:=readkey;textbackground (blue);clrscr;
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

procedure borrar_archivo(var arch:pasajero);
var op:char; x,y:integer;
begin
  x:=7;
  y:=19;
  op:=' ';
  clrscr;
  repeat
  begin
      gotoxy(x,y);textcolor (red);
     textbackground (black); writeln('|AVISO|: Si continua se perderan todos los datos almacenados en este Archivo!!');textcolor (black);
     textbackground (lightgray);clreol;
      gotoxy(x,y+2);textcolor (white);
     textbackground (black); writeln('|ENTER| - Confirmar');
      gotoxy(x,y+4); writeln('|ESC| - Regresar al menu anterior');textcolor (black);
     textbackground (lightgray);clreol; gotoxy(x+33,y+4); op:=readkey;
  end;    
  until op in [#13,#27];

  if op=#13 then
  begin
    op:=' ';
    repeat
    begin
      clrscr;
      gotoxy (x,y);textcolor (white);
     textbackground (black); writeln ('Desea confirmar la operacion? s/n:                         ');textcolor (black);
     textbackground (lightgray);clreol;
      gotoxy (x+36,y); op:=readkey;
      op:=upcase(op);
    end;
    until op in ['S','N'];

    if op='S' then
    begin
      clrscr;
      gotoxy(x,y);textcolor (green);
     textbackground (black); writeln('Operacion realizada con exito!');textcolor (black);
     textbackground (lightgray);clreol;
      assign(arch,'pasajeros.dat');
      erase(arch);
      readkey;
    end
    else if op='N' then
    begin
      clrscr;
      gotoxy(x,y);textcolor (red);
     textbackground (black); writeln('Operacion cancelada.');textcolor (black);
     textbackground (lightgray);clreol;
      readkey;
    end
  end;
end;

procedure menu_pasajero();
var op:char; arch:pasajero; x,y:integer;
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
            gotoxy (x+9,y+2);writeln('Menu Pasajeros');
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
               '1':alta_pasajero(arch);
               '2':baja_pasajero(arch);
               '3':modificar_pasajero(arch);
               '4':consulta_pasajero(arch);
               '5':listado_pasajero(arch);
               '6':borrar_archivo(arch);
          end;
    end;
    until op = #27;
end;

begin

end.
