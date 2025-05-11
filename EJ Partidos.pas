//Se tienen los resultados de 10 partidos de futbol de 3 equipos (A,B,C) de c/partido se registran:
//A. equipo contrario B. cantidad de goles C. cant. de penales D. cantidad de faltas realizadas E. cantidad de goles de equipo contrario
//Se pide: A. Listado de partidos con sus respectivos datos (diseñarlo en forma de menu) TEXTCOLOR, TEXTBACKGROUND, GOTOXY
//B. Mostrar equipo con > cant de goles y cant de faltas realizadas
//C. Indicar en caso de que el equipo posea < de 'x' faltas en c/partido 'equipo con fair play'
//D. Equipo con > cant de diferencia de goles

Program EJPartidos;
uses crt;
var equipo_contrario:char;
    golesA,golesB,golesC,goles_contA,goles_contB,goles_contC,faltasA,faltasB,faltasC,goles_local,penales,faltas_local,faltas_contrario,goles_contrario:word;
    dif_golesA,dif_golesB,dif_golesC,i,p,x,y:integer;
begin
golesA:=0;
golesB:=0;
golesC:=0;
goles_contA:=0;
goles_contB:=0;
goles_contC:=0;
faltasA:=0;
faltasB:=0;
faltasC:=0;
goles_local:=0;
penales:=0;
faltas_local:=0;
faltas_contrario:=0;
goles_contrario:=0;
dif_golesA:=0;
dif_golesB:=0;
dif_golesC:=0;
textbackground (blue);
textcolor (yellow);
clrscr;
     for i:=1 to 3 do
     begin
          case i of
               1: writeln ('Equipo local: A');    //Muestra el equipo local en cuestion
               2: writeln ('Equipo local: B');
               3: writeln ('Equipo local: C');
          end;
          for p:=1 to 2 do
          begin
               writeln ('Ingrese equipo contrario');
               readln (equipo_contrario);
               clrscr;
               writeln ('Ingrese cantidad de goles del equipo contrario');
               readln (goles_contrario);
               clrscr;
               writeln ('Ingrese cantidad de faltas realizadas del equipo contrario');
               readln (faltas_contrario);
               clrscr;
               writeln ('Ingrese cantidad de goles del equipo local');
               readln (goles_local);
               clrscr;
               writeln ('Ingrese cantidad de faltas realizadas del equipo local');
               readln (faltas_local);
               clrscr;
               writeln ('Ingrese cantidad de penales');
               readln (penales);
               clrscr;
               case i of
                    1:goles_contA:=goles_contA+goles_contrario;  //Agrupamos los goles que le hicieron al equipo A,B y C respectivamente (teniendo en cuenta el equipo local)
                    2:goles_contB:=goles_contB+goles_contrario;
                    3:goles_contC:=goles_contC+goles_contrario;
               end;
               case equipo_contrario of
                    'A':goles_contA:=goles_contA+goles_local;  //Agrupamos los goles que le hicieron al equipo A,B y C respectivamente (teniendo en cuenta el equipo contrario)
                    'B':goles_contB:=goles_contB+goles_local;
                    'C':goles_contC:=goles_contC+goles_local;
               end;
               for x:=20 to 59 do
               begin                     //Creamos el cuadro para los datos del partido
                    gotoxy (x,9);        //Creamos la linea del cuadro horizontal
                    writeln ('=');
                    gotoxy (x,15);
                    writeln ('=');
               end;
               for y:=9 to 15 do
               begin
                    gotoxy (19,y);    //Creamos la linea del cuadro vertical
                    writeln ('[');
                    gotoxy (60,y);
                    writeln (']');
               end;
               gotoxy (20,10);
               case i of
                    1: writeln ('Equipos: A      ',equipo_contrario);      //A continuacion juntamos los datos del partido en cuestion en el cuadro
                    2: writeln ('Equipos: B      ',equipo_contrario);
                    3: writeln ('Equipos: C      ',equipo_contrario);
               end;
               gotoxy (20,11);
               writeln ('Goles:   ', goles_local, '      ', goles_contrario);
               gotoxy (20,12);
               writeln ('Faltas:  ', faltas_local, '      ', faltas_contrario);
               gotoxy (20,13);
               writeln ('Penales:    ', penales);
               if faltas_local=faltas_contrario then
               begin                                                      //Verificamos las faltas del partido y mostramos si hubo o no fair play en el mismo (dentro del cuadro)
                    if (faltas_local=0) and (faltas_contrario=0) then
                    begin
                       gotoxy (20,14);
                       writeln ('Ambos equipos jugaron con fair play');
                    end
                    else
                        if (faltas_local>0) and (faltas_contrario>0) then
                        begin
                           gotoxy (20,14);
                           writeln ('Ningun equipo jugo con fair play');
                        end;
               end
               else
                   if faltas_local<faltas_contrario then
                   begin
                        gotoxy (20,14);
                        writeln ('El equipo local jugo con fair play');
                   end
                   else
                   begin
                       gotoxy (20,14);
                       writeln ('El equipo contrario jugo con fair play');
                   end;
               gotoxy (1,16);
               writeln ('Presione una tecla para continuar');          //Presionamos tecla para ingresar los datos del partido siguiente
               readkey;
               clrscr;
               case i of
                    1:golesA:=goles_local+golesA;       //Agrupamos los goles de los dif equipos
                    2:golesB:=goles_local+golesB;
                    3:golesC:=goles_local+golesC;
               end;
               case equipo_contrario of
                    'A':golesA:=goles_contrario+golesA;      //Idem
                    'B':golesB:=goles_contrario+golesB;
                    'C':golesC:=goles_contrario+golesC;
               end;
               case i of
                    1:faltasA:=faltas_local+faltasA;       //Agrupamos las faltas de cada equipo
                    2:faltasB:=faltas_local+faltasB;
                    3:faltasC:=faltas_local+faltasC;
               end;
               case equipo_contrario of
                    'A':faltasA:=faltas_contrario+faltasA;    //Idem
                    'B':faltasB:=faltas_contrario+faltasB;
                    'C':faltasC:=faltas_contrario+faltasC;
               end;
          end;
    end;
    for x:=20 to 88 do     //Creamos el cuadro final para mostrar los ultimos datos (idem al anterior cuadro)
    begin
         gotoxy (x,9);
         writeln ('=');
         gotoxy (x,13);
         writeln ('=');
    end;
    for y:=9 to 13 do
    begin
         gotoxy (19,y);
         writeln ('[');
         gotoxy (89,y);
         writeln (']');
    end;
    if (golesA>golesB) and (golesA>golesC) then        //Calculamos que equipo hizo mas goles y lo mostramos dentro del cuadro
    begin
         gotoxy (20,10);
         writeln ('El equipo con mas goles es el A');
    end
    else
    begin
         if golesB > golesC then
         begin
              gotoxy (20,10);
              writeln ('El equipo con mas goles es el B');
         end
         else
         begin
             gotoxy (20,10);
             writeln ('El equipo con mas goles es el C');
         end;
    end;
    gotoxy (20,11);
    writeln ('El total de faltas es de ', (faltasA+faltasB+faltasC));    //Mostramos el total de faltas dentro del cuadro
    dif_golesA:=golesA-goles_contA;
    dif_golesB:=golesB-goles_contB;
    dif_golesC:=golesC-goles_contC;
    if (dif_golesA > dif_golesB) and (dif_golesA>dif_golesC) then
    begin
         gotoxy (20,12);                                                                                 //Calculamos que equipo tuvo mayor dif de goles y lo moestramos en el cuadro
         writeln ('El equipo con mayor diferencia de goles es el equipo A con ', dif_golesA, ' gol/es');
    end
    else
    begin
         if dif_golesB > dif_golesC then
         begin
              gotoxy (20,12);
              writeln ('El equipo con mayor diferencia de goles es el equipo B con ', dif_golesB, ' gol/es');
         end
         else
             gotoxy (20,12);
             writeln ('El equipo con mayor diferencia de goles es el equipo C con ', dif_golesC, ' gol/es');
    end;
    readkey;
end.
