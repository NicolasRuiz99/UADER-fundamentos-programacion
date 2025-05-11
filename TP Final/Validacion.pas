unit Validacion;
interface
uses crt,dos;

var cd,cm,ca,condf:boolean; auxdia,auxmes,auxhora:integer;

procedure cambio_mayuscula (var cadena:string);
procedure validacion_entero (var variable:integer; lim:integer; x:integer; y:integer);
procedure validacion_entero_2 (var variable:integer; lim:integer; x:integer; y:integer);
procedure validacion_string (var variable:string; lim,x,y:integer );
procedure validacion_dni (var variable:integer; x:integer; y:integer);
procedure validacion_real (var variable:real; lim:integer; x:integer; y:integer);
procedure validacion_fecha_2 (var variable:integer; cod,x,y:integer);
procedure validacion_fecha (var variable:integer; cod,x,y:integer);

implementation

procedure cambio_mayuscula (var cadena:string);
var i:integer;
begin
     i:=0;
     for i:=1 to length(cadena) do
     begin
          if (cadena<>' ') or (cadena<>'') then
             cadena[i]:=upcase(cadena[i]);
     end;
end;


procedure validacion_entero (var variable:integer; lim:integer; x:integer; y:integer);
var codigo:integer; aux:boolean; op:char; var_aux:string;
begin
     var_aux:='';
     repeat
     begin
          aux:=false;
          gotoxy (x,y); writeln ('                                                       ');
          gotoxy (x,y); readln (var_aux);
          if (length(var_aux)) <= lim then
             aux:=true;
          val(var_aux,variable,codigo);
          if codigo<>0 then
          begin
               repeat
               begin
                    gotoxy (x,y); writeln ('                                                     ');
                    gotoxy (x,y); writeln('Error ingrese solo numeros enteros | ENTER - Continuar'); gotoxy (x+54,y); op:=readkey;
               end;
               until op=#13;
          end
          else
              if codigo=0 then
              begin
                   if (aux=false) or (variable = 0) then
                   begin
                        repeat
                        begin
                             gotoxy (x,y); writeln ('                                                                 ');
                             gotoxy (x,y); writeln('Error la cantidad de digitos no es la correcta | ENTER - Continuar'); gotoxy (x+67,y); op:=readkey;
                        end;
                        until op=#13;
                   end;
              end;
     end;
     until (codigo=0) and (aux=true) and (variable <> 0);
end;

procedure validacion_entero_2 (var variable:integer; lim:integer; x:integer; y:integer);
var codigo:integer; aux:boolean; op:char; var_aux:string;
begin
     var_aux:='';
     repeat
     begin
          aux:=false;
          gotoxy (x,y); writeln ('                                                                                      ');
          gotoxy (x,y); readln (var_aux);
          if (length(var_aux)) <= lim then
             aux:=true;
          val(var_aux,variable,codigo);
          if codigo<>0 then
          begin
               repeat
               begin
                    gotoxy (x,y); writeln ('                                                     ');
                    gotoxy (x,y); writeln('Error ingrese solo numeros enteros | ENTER - Continuar'); gotoxy (x+54,y); op:=readkey;
               end;
               until op=#13;
          end
          else
              if codigo=0 then
              begin
                   if (aux=false) then
                   begin
                        repeat
                        begin
                             gotoxy (x,y); writeln ('                                                                 ');
                             gotoxy (x,y); writeln('Error la cantidad de digitos no es la correcta | ENTER - Continuar'); gotoxy (x+67,y); op:=readkey;
                        end;
                        until op=#13;
                   end;
              end;
     end;
     until ((codigo=0) and (aux=true));
end;

procedure validacion_fecha (var variable:integer; cod,x,y:integer);         //COD. 1 - Dia, 2 - Mes, 3 - Anio, 4 - Hora, 5 - Minutos
var condf:boolean; op:char;
begin
     condf:=false;
     case cod of
          1:
          begin
               repeat
               begin
                    validacion_entero_2 (variable,2,x,y);
                    if ((variable>=1) and (variable<=31)) then
                    begin
                         condf:=true;
                    end
                    else
                    begin
                         repeat
                         begin
                              gotoxy(x,y); writeln('                                          ');
                              gotoxy(x,y); writeln('Ingrese un dia valido | ENTER - Continuar'); gotoxy (x+41,y); op:=readkey;
                         end;
                         until op in [#13];
                    end;
               end;
               until condf;
           end;
          2:
          begin
               repeat
               begin
                    validacion_entero_2 (variable,2,x,y);
                    if ((variable>=1) and (variable<=12)) then
                    begin
                         condf:=true;
                    end
                    else
                    begin
                         repeat
                         begin
                              gotoxy(x,y); writeln('                                          ');
                              gotoxy(x,y); writeln('Ingrese un mes valido | ENTER - Continuar'); gotoxy (x+42,y); op:=readkey;
                         end;
                         until op in [#13];
                    end;
               end;
               until condf;
           end;
          3:
          begin
               repeat
               begin
                    validacion_entero_2 (variable,4,x,y);
                    if ((variable>=2017) and (variable<=2019)) then
                    begin
                         condf:=true;
                    end
                    else
                    begin
                         repeat
                         begin
                              gotoxy(x,y); writeln('                                          ');
                              gotoxy(x,y); writeln('Ingrese un anio valido | ENTER - Continuar'); gotoxy (x+43,y); op:=readkey;
                         end;
                         until op in [#13];
                    end;
               end;
               until condf;
           end;
          4:
          begin
               repeat
               begin
                    validacion_entero_2 (variable,2,x,y);
                    if ((variable>=0) and (variable<=24)) then
                    begin
                         condf:=true;
                    end
                    else
                    begin
                         repeat
                         begin
                              gotoxy(x,y); writeln('                                          ');
                              gotoxy(x,y); writeln('Ingrese una hora valida | ENTER - Continuar'); gotoxy (x+44,y); op:=readkey;
                         end;
                         until op in [#13];
                    end;
               end;
               until condf;
           end;
          5:
          begin
               repeat
               begin
                    validacion_entero_2 (variable,2,x,y);
                    if ((variable>=0) and (variable<=60)) then
                    begin
                         condf:=true;
                    end
                    else
                    begin
                         repeat
                         begin
                              gotoxy(x,y); writeln('                                          ');
                              gotoxy(x,y); writeln('Ingrese minutos validos | ENTER - Continuar'); gotoxy (x+44,y); op:=readkey;
                         end;
                         until op in [#13];
                    end;
               end;
               until condf;
           end;
     end;
end;

procedure validacion_fecha_2 (var variable:integer; cod,x,y:integer);         //COD. 1 - Dia, 2 - Mes, 3 - Anio, 4 - Hora, 5 - Minutos
var dia,mes,anio,date:word; hora,minutos,segundos,centesimas:word; op:char;
begin
     anio:=0;
     mes:=0;
     dia:=0;
     hora:=0;
     minutos:=0;
     segundos:=0;
     centesimas:=0;
     variable:=0;
     getdate(anio,mes,dia,date);
     gettime(hora,minutos,segundos,centesimas);
     condf:=false;
     case cod of
          1:
          begin
              repeat
              begin
                  if mes in[2] then
                  begin
                      auxdia:=0;
                      cd:=false;
                      validacion_entero_2 (variable,2,x,y);  
                      
                      if variable=dia then
                      begin
                           cd:=true;
                           condf:=true;
                      end     
                      else if ((variable<dia) and (variable>=1)) then
                      begin
                           auxdia:=variable;
                           condf:=true;
                           cd:=false;
                      end   
                      else if ((variable>dia) and (variable<=28)) then
                      begin
                           condf:=true;
                           cd:=false;
                           auxdia:=0;
                      end         
                      else    
                      begin
                          repeat
                          begin
                              gotoxy(x,y); writeln('                                          ');
                              gotoxy(x,y); writeln('Ingrese un dia valido | ENTER - Continuar'); gotoxy (x+41,y); op:=readkey;
                          end;
                          until op in [#13];
                      end;
                  end;

                  if mes in[4,6,9,11] then
                  begin
                      auxdia:=0;
                      cd:=false;
                      validacion_entero_2 (variable,2,x,y);  
                      
                      if variable=dia then
                      begin
                           cd:=true;
                           condf:=true;
                      end     
                      else if ((variable<dia) and (variable>=1)) then
                      begin
                           auxdia:=variable;
                           condf:=true;
                           cd:=false;
                      end   
                      else if ((variable>dia) and (variable<=30)) then
                      begin
                           condf:=true;
                           cd:=false;
                           auxdia:=0;
                      end         
                      else    
                      begin
                          repeat
                          begin
                              gotoxy(x,y); writeln('                                          ');
                              gotoxy(x,y); writeln('Ingrese un dia valido | ENTER - Continuar'); gotoxy (x+41,y); op:=readkey;
                          end;
                          until op in [#13];
                      end;
                  end;    

                  if mes in[4,6,9,11] then
                  begin
                      auxdia:=0;
                      cd:=false;
                      validacion_entero_2 (variable,2,x,y);  
                      
                      if variable=dia then
                      begin
                           cd:=true;
                           condf:=true;
                      end     
                      else if ((variable<dia) and (variable>=1)) then
                      begin
                           auxdia:=variable;
                           condf:=true;
                           cd:=false;
                      end   
                      else if ((variable>dia) and (variable<=31)) then
                      begin
                           condf:=true;
                           cd:=false;
                           auxdia:=0;
                      end         
                      else    
                      begin
                          repeat
                          begin
                              gotoxy(x,y); writeln('                                          ');
                              gotoxy(x,y); writeln('Ingrese un dia valido | ENTER - Continuar'); gotoxy (x+41,y); op:=readkey;
                          end;
                          until op in [#13];
                      end;
                  end;    
              end;
              until condf;
          end;
          2:
          begin
              repeat
              begin
                  if mes in[1,2,3,4,5,6,7,8,9,10,11,12] then
                  begin
                      cm:=false;
                      auxmes:=0;

                      if (auxdia<>0) then
                      begin
                          validacion_entero_2 (variable,2,x,y);  

                          if ((mes=12) and (variable=1)) then
                          begin
                              auxmes:=variable;
                              condf:=true;

                          end
                          else if variable=mes+1 then
                          begin
                              condf:=true;
                              auxmes:=0;
                              cm:=false;
                          end
                          else
                          begin
                              repeat
                              begin
                                  gotoxy(x,y); writeln('                                          ');
                                  gotoxy(x,y); writeln('Ingrese un mes valido | ENTER - Continuar'); gotoxy (x+41,y); op:=readkey;
                              end;
                              until op in [#13];
                          end
                      end    
                      else
                      begin
                          validacion_entero_2 (variable,2,x,y);

                          if ((mes=12) and (variable=1)) then
                          begin
                              auxmes:=variable;
                              condf:=true;
                          end
                          else  if (variable=mes) then
                          begin
                              cm:=true;
                              condf:=true;
                          end         
                          else if (variable=mes+1) then    
                          begin
                              condf:=true;
                              cm:=false;
                          end
                          else
                          begin    
                              repeat
                              begin
                                  gotoxy(x,y); writeln('                                          ');
                                  gotoxy(x,y); writeln('Ingrese un mes valido | ENTER - Continuar'); gotoxy (x+41,y); op:=readkey;
                              end;
                              until op in [#13];
                          end
                      end;
                  end;
              end;    
              until condf;
          end;                               
          3:
          begin
              repeat
              begin
                  ca:=false;
                  if ((auxdia<>0) and (auxmes<>0)) then
                  begin
                      validacion_entero_2 (variable,4,x,y);  
                      if ((mes=12) and (variable=anio+1)) then
                      begin
                          condf:=true;
                      end
                      else if (variable=anio) then
                      begin
                          ca:=true;
                          condf:=true;
                      end
                      else
                      begin
                          repeat
                          begin
                              gotoxy(x,y); writeln('                                          ');
                              gotoxy(x,y); writeln('Ingrese un anio valido | ENTER - Continuar'); gotoxy (x+41,y); op:=readkey;
                          end;
                          until op in [#13];
                      end
                  end    
                  else
                  begin
                      validacion_entero_2 (variable,4,x,y);

                      if ((mes=12) and (variable=anio+1)) then
                      begin
                          condf:=true;
                          ca:=false;
                      end
                      else if (variable=anio) then
                      begin
                          ca:=true;
                          condf:=true;
                      end
                      else
                      begin
                          repeat
                          begin
                              gotoxy(x,y); writeln('                                          ');
                              gotoxy(x,y); writeln('Ingrese un anio valido | ENTER - Continuar'); gotoxy (x+41,y); op:=readkey;
                          end;
                          until op in [#13];
                      end
                  end;    
              end;
              until condf;
          end;
          4:
          begin
              repeat
              begin
                  auxhora:=0;
                  if ((cd=true) and (cm=true) and (ca=true)) then
                  begin
						validacion_entero_2 (variable,4,x,y);  
                      	if ((variable>=hora) and (variable<=24)) then
                      	begin  
                      		auxhora:=variable;
                            condf:=true;
                      	end                
                      	else
                      	begin
                           	repeat
                           	begin
                                gotoxy(x,y); writeln('                                          ');
                                gotoxy(x,y); writeln('Ingrese un horario valido | ENTER - Continuar'); gotoxy (x+41,y); op:=readkey;
                            end;
                            until op in [#13];
                      	end
                  end    
                  else
                  begin
                      validacion_entero_2 (variable,4,x,y);
                      if ((variable>=0) and (variable<=24)) then
                      begin
                          condf:=true;
                      end
                      else
                      begin
                          repeat
                          begin
                              gotoxy(x,y); writeln('                                          ');
                              gotoxy(x,y); writeln('Ingrese un mes valido | ENTER - Continuar'); gotoxy (x+41,y); op:=readkey;
                          end;
                          until op in [#13];
                      end
                  end;    
              end;
              until condf;
          end;
          5:
          begin
              repeat
              begin
                  if auxhora<>0 then
                  begin
                      validacion_entero_2 (variable,4,x,y);    
                      if ((variable>=minutos) and (variable<=60)) then                        
                      begin
                           condf:=true;
                      end                
                      else
                      begin
                           repeat
                           begin
                                gotoxy(x,y); writeln('                                          ');
                                gotoxy(x,y); writeln('Ingrese un horario valido | ENTER - Continuar'); gotoxy (x+41,y); op:=readkey;
                            end;
                            until op in [#13];
                      end   
                  end    
                  else
                  begin
                      validacion_entero_2 (variable,4,x,y);
                      if ((variable>=0) and (variable<=60)) then
                      begin
                          condf:=true;
                      end
                      else
                      begin
                          repeat
                          begin
                              gotoxy(x,y); writeln('                                          ');
                              gotoxy(x,y); writeln('Ingrese un mes valido | ENTER - Continuar'); gotoxy (x+41,y); op:=readkey;
                          end;
                          until op in [#13];
                      end
                  end;    
              end;
              until condf;
          end;
     end;
end;

procedure validacion_dni (var variable:integer; x:integer; y:integer);
var codigo:integer; aux:boolean; op:char; var_aux:string;
begin
     var_aux:='';
     repeat
     begin
          aux:=false;
          gotoxy (x,y); writeln ('                                                                                                           ');
          gotoxy (x,y); readln (var_aux);
          if (length(var_aux)) = 8 then
             aux:=true;
          val(var_aux,variable,codigo);
          if codigo<>0 then
          begin
               repeat
               begin
                    gotoxy (x,y); writeln ('                                                       ');
                    gotoxy (x,y); writeln('Error ingrese solo numeros enteros | ENTER - Continuar'); gotoxy (x+54,y); op:=readkey;
               end;
               until op=#13;
          end
          else
              if codigo=0 then
              begin
                   if aux=false then
                   begin
                        repeat
                        begin
                             gotoxy (x,y); writeln ('                                                                   ');
                             gotoxy (x,y); writeln('Error la cantidad de digitos no es la correcta | ENTER - Continuar'); gotoxy (x+67,y); op:=readkey;
                        end;
                        until op=#13;
                   end;
              end;
     end;
     until ((codigo=0) and (aux=true));
end;                                 

procedure validacion_string (var variable:string; lim,x,y:integer );
var i:integer; aux,aux_2:boolean; op:char;
begin
     repeat
     begin
          aux:=false;
          gotoxy (x,y); writeln ('                                                                                    ');
          gotoxy (x,y); readln (variable);
          if (length(variable)) >= lim then
          begin
               repeat
               begin
                    gotoxy (x,y); writeln ('                                                                    ');
                    gotoxy (x,y); writeln('Error la cantidad de digitos no es la correcta | ENTER - Continuar'); gotoxy (x+67,y); op:=readkey;
               end;
               until op=#13;
          end
          else
          begin
               if (variable[1] = ' ') or (variable = '') then
               begin
               repeat
                     begin
                          gotoxy (x,y); writeln ('                                                ');
                          gotoxy (x,y); writeln('Error, hay espacios de mas | ENTER - Continuar'); gotoxy (x+46,y); op:=readkey;
                     end;
               until op = #13;
               end
               else
               begin
                    aux_2:=true;
                    for i:=1 to length (variable) do
                    begin
                        if (variable[i] = ' ') and (variable[i+1] = ' ') then
                              aux_2:=false;
                        if variable[i] in ['0','1','2','3','4','5','6','7','8','9'] then
                              aux_2:=false;
                    end;
                    if aux_2 = false then
                    begin
                         repeat
                         begin
                         gotoxy (x,y); writeln ('                                                ');
                         gotoxy (x,y); writeln('Error, caracteres invalidos | ENTER - Continuar'); gotoxy (x+47,y); op:=readkey;
                         end;
                         until op = #13;
                    end
                    else
                    begin
                         if variable[length (variable)] = ' ' then
                         begin
                         repeat
                         begin
                              gotoxy (x,y); writeln ('                                               ');
                              gotoxy (x,y); writeln('Error, hay espacios de mas | ENTER - Continuar'); gotoxy (x+46,y); op:=readkey;
                         end;
                         until op = #13;
                         end
                         else
                             aux:=true
                    end;
               end;
          end;
     end;
     until (aux=true);
     cambio_mayuscula (variable);
end;                                 

procedure validacion_real (var variable:real; lim:integer; x:integer; y:integer);
var codigo:integer; aux:boolean; op:char; var_aux:string;
begin
     var_aux:='';
     repeat
     begin
          aux:=false;
          gotoxy (x,y); writeln ('                                                                                              ');
          gotoxy (x,y); readln (var_aux);
          if (length(var_aux)) <= lim then
             aux:=true;
          val(var_aux,variable,codigo);
          if codigo<>0 then
          begin
               repeat
               begin
                    gotoxy (x,y); writeln ('                                                      ');
                    gotoxy (x,y); writeln('Error ingrese solo numeros reales | ENTER - Continuar'); gotoxy (x+54,y); op:=readkey;
               end;
               until op=#13;
          end
          else
              if codigo=0 then
              begin
                   if aux=false then
                   begin
                        repeat
                        begin
                             gotoxy (x,y); writeln ('                                                                  ');
                             gotoxy (x,y); writeln('Error la cantidad de digitos no es la correcta | ENTER - Continuar'); gotoxy (x+67,y); op:=readkey;
                        end;
                        until op=#13;
                   end;
              end;
     end;
     until ((codigo=0) and (aux=true));
end;

begin

end.
