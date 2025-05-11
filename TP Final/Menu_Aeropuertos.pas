unit Menu_Aeropuertos;
interface
uses crt,aeropuertos,dos,validacion,mensajes;

var arch:aeropuerto;

procedure menu_aeropuerto ();

implementation

procedure datos (x,y:integer);
begin
     textcolor (yellow);
     textbackground (blue);
     gotoxy(x,y); writeln  ('----------------------------------------------------------------- Aeropuertos --------------------------------------------------------------------------');
     gotoxy(x,y+1); writeln('--------------------------------------------------------------------------------------------------------------------------------------------------------');
     gotoxy(x,y+2); writeln('|        ID Aeropuerto        |                 Nombre                 |                 Pais                 |                 Ciudad                 |');
     gotoxy(x,y+3); writeln('--------------------------------------------------------------------------------------------------------------------------------------------------------');
end;

procedure mostrar_aeropuerto (reg:t_aeropuerto; x,y:integer);
begin
     datos (x,y);
     with reg do
     begin
          datos (x,y);
          textcolor (yellow);
          textbackground (blue);
          gotoxy(x,y+4); writeln('|');gotoxy(x+2,y+4); writeln(id_aeropuerto);
          gotoxy(x+30,y+4); writeln('|');gotoxy(x+32,y+4); writeln(nombre);
          gotoxy(x+71,y+4); writeln('|');gotoxy(x+73,y+4); writeln(Pais);
          gotoxy(x+110,y+4); writeln('|');gotoxy(x+112,y+4); writeln(ciudad);
          gotoxy(x+151,y+4); writeln('|');
          gotoxy(x,y+5); writeln('--------------------------------------------------------------------------------------------------------------------------------------------------------');
     end;
end;

procedure mostrar_aeropuerto_listado (reg:t_aeropuerto; p,p_2:integer);
var x:integer;
begin
     x:=5;
     with reg do
     begin
          if reg.activo then
          begin
               textcolor (yellow);
               textbackground (blue);
               gotoxy(x-2,p+5); writeln(p_2);
               gotoxy(x+2,p+5); writeln('                                                                                                                                                        ');
               gotoxy(x+2,p+5); writeln('|');gotoxy(x+4,p+5); writeln(id_aeropuerto);
               gotoxy(x+32,p+5); writeln('|');gotoxy(x+34,p+5); writeln(nombre);
               gotoxy(x+73,p+5); writeln('|');gotoxy(x+75,p+5); writeln(Pais);
               gotoxy(x+112,p+5); writeln('|');gotoxy(x+114,p+5); writeln(ciudad);
               gotoxy(x+153,p+5); writeln('|');
               gotoxy(x+2,p+6); writeln('--------------------------------------------------------------------------------------------------------------------------------------------------------');
          end;
     end;
end;

procedure Listado_aeropuertos_5 (var arch:aeropuerto; var op:char);
var reg:t_aeropuerto; pos:integer; p,p_2:integer; x,y:integer;
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
          gotoxy(x,p+1); writeln('----------------------------------------------------------------- Aeropuertos --------------------------------------------------------------------------');
          gotoxy(x,p+2); writeln('--------------------------------------------------------------------------------------------------------------------------------------------------------');
          gotoxy(x,p+3); writeln('|        ID Aeropuerto        |                 Nombre                 |                 Pais                 |                 Ciudad                 |');
          gotoxy(x,p+4); writeln('--------------------------------------------------------------------------------------------------------------------------------------------------------');
          if eof(arch) then
          begin
               gotoxy(x,p+5); writeln('                                                                                                                                                        ');
               gotoxy(x,p+5); writeln('|');gotoxy(x+55,p+5);
               writeln('No hay aeropuertos para mostrar');
               gotoxy(x+151,p+5); writeln('|');
               gotoxy(x,p+6); writeln('--------------------------------------------------------------------------------------------------------------------------------------------------------');
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
                   textbackground (blue); clrscr;textcolor (yellow);
                    gotoxy(x,p+1); writeln('----------------------------------------------------------------- Aeropuertos --------------------------------------------------------------------------');
                    gotoxy(x,p+2); writeln('--------------------------------------------------------------------------------------------------------------------------------------------------------');
                    gotoxy(x,p+3); writeln('|        ID Aeropuerto        |                 Nombre                 |                 Pais                 |                 Ciudad                 |');
                    gotoxy(x,p+4); writeln('--------------------------------------------------------------------------------------------------------------------------------------------------------');
                    while (not eof(arch)) and (p<=5) do
                    begin
                         leer_aeropuerto(arch,pos,reg);
                         inc(pos);
                         if not (reg.activo) then
                         begin
                            dec (p);
                         end
                         else
                             inc (p_2);
                         mostrar_aeropuerto_listado(reg,p,p_2);
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

procedure alta_aeropuerto (var arch:aeropuerto);
var id:integer; pos:integer; op:char; reg:t_aeropuerto; cond:char; x,y:integer;
begin
     op:=' ';
     x:=5;
     y:=7;
     textbackground (blue);clrscr;
     abrir_aeropuerto (arch);
     ordenar_aeropuerto (arch);
     listado_aeropuertos_5(arch,op);
     if op = '2' then
     begin
          repeat
          begin
               textbackground (blue);clrscr;
               datos (x,y);
                with reg do
                begin
                     id_aeropuerto:= filesize (arch)+1;
                     validacion_string (nombre,40,x+32,y+4);
                     activo:=true;
                     validacion_string (pais,30,x+73,y+4);
                     validacion_string (ciudad,30,x+112,y+4);
                end;
                repeat
                begin
                     textbackground (blue);clrscr;
                     mostrar_aeropuerto (reg,x,y);
                     gotoxy (x,y+7);textcolor (white);
                     textbackground (black); writeln ('Desea confirmar la operacion? s/n: ');
                     gotoxy (x+34,y+7); cond:=readkey;
                end;
                until cond in ['S','s','N','n'];
                if (cond = 'S') or (cond = 's') then
                begin
                     guardar_aeropuerto (arch,reg);
                     msj_exitoso (op,x,y);
                end
                else
                     msj_cancelado (op,x,y);

          end;
          until op = #27;
     end
     else
     if op = '3' then
        repeat
        begin
             textbackground (blue);clrscr;
             datos (x,y);
             validacion_entero (id,20,x+2,y+4);
             buscar_aeropuerto_id (arch,reg,pos,id);
             if pos = (-1) then
             begin
                  msj_inexistente (op,5,7);
             end
             else
             begin
                  leer_aeropuerto (arch,pos,reg);
                  if reg.activo then
                  begin
                       textbackground (blue); clrscr;
                       repeat
                       begin
                            gotoxy (x,y-2);textcolor (white);
                            textbackground (black); writeln ('Aeropuerto existente:');
                            mostrar_aeropuerto (reg,x,y);
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
                            textbackground (black); writeln ('Aeropuerto dado de baja:');
                            mostrar_aeropuerto (reg,x,y);
                            gotoxy (x,y+7);textcolor (white);
                            textbackground (black); writeln ('|1| - Reactivar');
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
                                  mostrar_aeropuerto (reg,x,y);
                                  gotoxy (x,y+7);textcolor (white);
                                  textbackground (black); writeln ('Desea confirmar la operacion? s/n: ');
                                  gotoxy (x+36,y+7); cond:=readkey;
                             end;
                             until cond in ['S','N','s','n'];
                             if (cond = 'S') or (cond = 's') then
                             begin
                                  modificar_aero (arch,pos,reg);
                                  msj_exitoso (op,x,y);
                             end
                             else
                                  msj_cancelado (op,x,y);
                        end;
                  end;
             end;
        end;
        until op=#27;
        close (arch);
end;

procedure baja_aeropuerto(var arch:aeropuerto);
var id:integer; pos:integer; op:char; reg:t_aeropuerto; cond:char; x,y:integer;
begin
     x:=5;
     y:=7;
     textbackground (blue);clrscr;
     abrir_aeropuerto (arch);
     menu_confirmacion (op,58,12);
     if op = '1' then
        repeat
        begin
             textbackground (blue);clrscr;
             datos (x,y);
             validacion_entero (id,40,x+2,y+4);
             buscar_aeropuerto_id (arch,reg,pos,id);
             if pos = (-1) then
             begin
                  msj_inexistente (op,x,y);
             end
             else
             begin
                  leer_aeropuerto (arch,pos,reg);
                  if reg.activo then
                  begin
                       textbackground (blue);clrscr;
                       repeat
                       begin
                            gotoxy (x,y-2);textcolor (white);
                            textbackground (black); writeln ('Aeropuerto existente:');
                            mostrar_aeropuerto (reg,x,y);
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
                                 mostrar_aeropuerto (reg,x,y);
                                 gotoxy (x,y+7);textcolor (white);
                                 textbackground (black); writeln ('Desea confirmar la operacion? s/n: ');
                                 gotoxy (x+34,y+7); cond:=readkey;
                            end;
                            until cond in ['N','S','n','s'];
                            if (cond = 'S') or (cond = 's') then
                            begin
                                 modificar_aero (arch,pos,reg);
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

procedure modificar_aeropuerto(var arch:aeropuerto);
var id:integer; pos:integer; op:char; reg:t_aeropuerto; cond:char; nombre:string [40]; pais,ciudad:string [30]; x,y:integer;
begin
     x:=5;
     y:=7;
     textbackground (blue);clrscr;
     abrir_aeropuerto (arch);
     menu_confirmacion (op,58,12);
     if op = '1' then
        repeat
        begin
             textbackground (blue);clrscr;
             datos (x,y);
             validacion_entero (id,40,x+2,y+4);
             buscar_aeropuerto_id (arch,reg,pos,id);
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
                                 textbackground (black); writeln ('Aeropuerto existente:');
                                 mostrar_aeropuerto (reg,x,y);
                                 gotoxy (x+32,y+2);textcolor (white);
                                 textbackground (black); writeln ('1');
                                 gotoxy (x+73,y+2);textcolor (white);
                                 textbackground (black); writeln ('2');
                                 gotoxy (x+112,y+2);textcolor (white);
                                 textbackground (black); writeln ('3');
                                 gotoxy (x,y+7);textcolor (white);
                                 textbackground (black); writeln ('Ingrese el numero para modificar dicho campo.');
                                 gotoxy (x,y+9);textcolor (blue);
                                 textbackground (white); writeln ('|ESC| - Regresar al menu anterior'); gotoxy (x+33,y+9); op:=readkey;
                            end;
                            until op in ['1','2','3',#27];
                            case op of
                                 '1':
                                     begin
                                          gotoxy (x,y+11); writeln ('                                              ');
                                          gotoxy (x,y+11);textcolor (white);
                                          textbackground (black); writeln ('Nombre: '); validacion_string (nombre,30,x+8,y+11);
                                          repeat
                                          begin
                                               gotoxy (x,y+13);textcolor (white);
                                               textbackground (black); writeln ('Desea confirmar la operacion? s/n: ');
                                               gotoxy (x+34,y+13); cond:=readkey;
                                          end;
                                          until cond in ['S','N','s','n'];
                                          if (cond = 'S') or (cond = 's') then
                                          begin
                                               reg.nombre:=nombre;
                                               modificar_aero (arch,pos,reg);
                                          end;
                                     end;
                                 '2':
                                     begin
                                          gotoxy (x,y+11); writeln ('                                              ');
                                          gotoxy (x,y+11);textcolor (white);
                                          textbackground (black); writeln ('Pais:  ');validacion_string (pais,30,x+6,y+11);
                                          repeat
                                          begin
                                               gotoxy (x,y+13);textcolor (white);
                                               textbackground (black); writeln ('Desea confirmar la operacion? s/n: ');
                                               gotoxy (x+34,y+13); cond:=readkey;
                                          end;
                                          until cond in ['S','N','s','n'];
                                          if (cond = 'S') or (cond = 's') then
                                          begin
                                               reg.pais:=pais;
                                               modificar_aero (arch,pos,reg);
                                          end;
                                     end;
                                 '3':
                                     begin
                                          gotoxy (x,y+11); writeln ('                                              ');
                                          gotoxy (x,y+11);textcolor (white);
                                          textbackground (black); writeln ('Ciudad: '); validacion_string (ciudad,30,x+8,y+11);
                                          repeat
                                          begin
                                               gotoxy (x,y+13);textcolor (white);
                                               textbackground (black); writeln ('Desea confirmar la operacion? s/n: ');;
                                               gotoxy (x+34,y+13); cond:=readkey;
                                          end;
                                          until cond in ['S','N','s','n'];
                                          if (cond = 'S') or (cond = 's') then
                                          begin
                                               reg.ciudad:=ciudad;
                                               modificar_aero (arch,pos,reg);
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

procedure menu_busqueda (var arch:aeropuerto; op:char; x,y:integer);
var nom:string[60]; pos:integer; reg:t_aeropuerto; id:integer;
begin
     repeat
     begin
          case op of
               '1':
                   begin
                        textbackground (blue);clrscr;
                        datos (x,y);
                        validacion_string (nom,40,x+32,y+4);
                        buscar_aeropuerto_nombre (arch,reg,pos,nom);
                        if pos = (-1) then
                        begin
                             msj_inexistente (op,x,y);
                        end
                        else
                        begin
                             if reg.activo then
                             begin
                                  textbackground (blue);clrscr;
                                  repeat
                                  begin
                                       gotoxy (x,y-2);textcolor (white);
                                       textbackground (black); writeln ('Aeropuerto existente:');
                                       mostrar_aeropuerto (reg,x,y);
                                       gotoxy (x,y+7);textcolor (blue);
                                       textbackground (white); writeln ('|ESC| - Regresar al menu anterior'); gotoxy (x+33,y+7); op:=readkey;
                                  end;
                                  until op = #27;
                             end
                             else
                                 msj_baja (op,x,y);
                        end;
                   end;
               '2':
                   begin
                        textbackground (blue);clrscr;
                        datos (x,y);
                        validacion_entero (id,40,x+2,y+4);
                        buscar_aeropuerto_id (arch,reg,pos,id);
                        if pos = (-1) then
                        begin
                             msj_inexistente (op,x,y);
                        end
                        else
                        begin
                             if reg.activo then
                             begin
                                  textbackground (blue);clrscr;
                                  repeat
                                  begin
                                       gotoxy (x,y-2);textcolor (white);
                                       textbackground (black); writeln ('Aeropuerto existente:');
                                       mostrar_aeropuerto (reg,x,y);
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
     end;
     until op = #27;
end;

procedure consulta_aeropuerto(var arch:aeropuerto);
var op:char; x,y:integer;
begin
     x:=5;
     y:=7;
     abrir_aeropuerto (arch);
     repeat
     begin
          textbackground (blue);clrscr;
          menu_consulta (op,58,12);
          if (op = '1') or (op = '2') then
             menu_busqueda (arch,op,x,y);
     end;
     until op = #27;
     close (arch);
end;

procedure Listado_aeropuerto (var arch:aeropuerto);
var reg:t_aeropuerto; pos:integer; p,p_2:integer; x,y:integer; op:char;
begin
     abrir_aeropuerto (arch);
     ordenar_aeropuerto (arch);
     seek (arch,0);
     p:=1;
     p_2:=0;
     pos:=0;
     x:=7;
     repeat
     begin
          textbackground(blue);textcolor(yellow);clrscr;
          gotoxy(x,p+1); writeln('----------------------------------------------------------------- Aeropuertos --------------------------------------------------------------------------');
          gotoxy(x,p+2); writeln('--------------------------------------------------------------------------------------------------------------------------------------------------------');
          gotoxy(x,p+3); writeln('|        ID Aeropuerto        |                 Nombre                 |                 Pais                 |                 Ciudad                 |');
          gotoxy(x,p+4); writeln('--------------------------------------------------------------------------------------------------------------------------------------------------------');
          if eof(arch) then
          begin
               gotoxy(x,p+5); writeln('                                                                                                                                                        ');
               gotoxy(x,p+5); writeln('|');gotoxy(x+35,p+5);
               writeln('No hay aeropuertos para mostrar');
               gotoxy(x+99,p+5); writeln('|');
               gotoxy(x,p+6); writeln('--------------------------------------------------------------------------------------------------------------------------------------------------------');
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
                    textbackground (blue);clrscr;textcolor(yellow);
                    gotoxy(x,p+1); writeln('----------------------------------------------------------------- Aeropuertos --------------------------------------------------------------------------');
                    gotoxy(x,p+2); writeln('--------------------------------------------------------------------------------------------------------------------------------------------------------');
                    gotoxy(x,p+3); writeln('|        ID Aeropuerto        |                 Nombre                 |                 Pais                 |                 Ciudad                 |');
                    gotoxy(x,p+4); writeln('--------------------------------------------------------------------------------------------------------------------------------------------------------');
                    while (not eof(arch)) and (p<=5) do
                    begin
                         leer_aeropuerto(arch,pos,reg);
                         inc(pos);
                         if not (reg.activo) then
                         begin
                            dec (p);
                         end
                         else
                             inc (p_2);
                         mostrar_aeropuerto_listado(reg,p,p_2);
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
      close (arch);
end;

procedure borrar_archivo(var arch:aeropuerto);
var op:char; x,y:integer;
begin
  x:=7;
  y:=19;
  op:=' ';
  clrscr;
  repeat
  begin
      gotoxy(x,y);textcolor (red);
     textbackground (black); writeln('|AVISO| Si continua se perderan todos los datos almacenados en este Archivo!!');textcolor (black);
     textbackground (lightgray);clreol;
      gotoxy(x,y+2);textcolor (white);
     textbackground (black); writeln('|Enter| - Confirmar');textcolor (black);
     textbackground (lightgray);clreol;
      gotoxy(x,y+4);textcolor (white);
     textbackground (black); writeln('|Esc| - Regresar al menu anterior');textcolor (black);
     textbackground (lightgray);clreol; gotoxy(x+31,y+4); op:=readkey;
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
      assign(arch,'aeropuertos.dat');
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

procedure menu_aeropuerto();
var op:char; arch:aeropuerto; x,y:integer;
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
            gotoxy (x+7,y+2);writeln('Menu Aeropuertos');
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
               '1':alta_aeropuerto(arch);
               '2':baja_aeropuerto(arch);
               '3':modificar_aeropuerto(arch);
               '4':consulta_aeropuerto(arch);
               '5':listado_aeropuerto(arch);
               '6':borrar_archivo (arch);
          end;
    end;
    until op = #27;
end;

begin

end.
