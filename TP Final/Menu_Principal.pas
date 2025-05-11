unit Menu_Principal;
interface
uses crt,dos,menu_ventas,menu_pasajeros,menu_aeropuertos,menu_vuelos,menu_reservas,menu_aerolineas,Menu_informacion_adicional;

procedure menu_princip();

implementation

procedure menu_princip();
var op:char; x,y:integer;
begin
     x:=62;
     y:=8;
     textbackground (blue);
     clrscr;
     repeat
     begin
          repeat
          begin
          textbackground (blue);
          clrscr;
          textcolor (lightgreen);
          textbackground (9);
          gotoxy (x,y);writeln('----------------------------------------');
          gotoxy (x,y+1);writeln('|');
          gotoxy (x+39,y+1);writeln('|');
          gotoxy (x,y+2);writeln('|');
          gotoxy (x+2,y+2);writeln('Bienvenido al Sistema de Informacion');
          gotoxy (x+39,y+2);writeln('|');
          gotoxy (x,y+3);writeln('|');
          gotoxy (x+39,y+3);writeln('|');
          gotoxy (x,y+4);writeln('----------------------------------------');
          gotoxy (x,y+5);writeln('|');
          gotoxy (x+39,y+5);writeln('|');
          gotoxy (x,y+6);writeln('|');
          gotoxy (x+2,y+6);writeln('1 - Aerolineas');
          gotoxy (x+39,y+6);writeln('|');
          gotoxy (x,y+7);writeln('|');
          gotoxy (x+39,y+7);writeln('|');
          gotoxy (x+1,y+8);writeln('--------------------------------------');           //MENU DEL ARCHIVO
          gotoxy (x,y+9);writeln('|');
          gotoxy (x+39,y+9);writeln('|');
          gotoxy (x,y+10);writeln('|');
          gotoxy (x+2,y+10);writeln('2 - Aeropuertos');
          gotoxy (x+39,y+10);writeln('|');
          gotoxy (x,y+11);writeln('|');
          gotoxy (x+39,y+11);writeln('|');
          gotoxy (x+1,y+12);writeln('--------------------------------------');
          gotoxy (x,y+13);writeln('|');
          gotoxy (x+39,y+13);writeln('|');
          gotoxy (x,y+14);writeln('|');
          gotoxy (x+2,y+14);writeln('3 - Pasajeros');
          gotoxy (x+39,y+14);writeln('|');
          gotoxy (x,y+15);writeln('|');
          gotoxy (x+39,y+15);writeln('|');
          gotoxy (x+1,y+16);writeln('--------------------------------------');
          gotoxy (x,y+17);writeln('|');
          gotoxy (x+39,y+17);writeln('|');
          gotoxy (x,y+18);writeln('|');
          gotoxy (x+2,y+18);writeln('4 - Reservas ');
          gotoxy (x+39,y+18);writeln('|');
          gotoxy (x,y+19);writeln('|');
          gotoxy (x+39,y+19);writeln('|');
          gotoxy (x+1,y+20);writeln('--------------------------------------');
          gotoxy (x,y+21);writeln('|');
          gotoxy (x+39,y+21);writeln('|');
          gotoxy (x,y+22);writeln('|');
          gotoxy (x+2,y+22);writeln('5 - Ventas');
          gotoxy (x+39,y+22);writeln('|');
          gotoxy (x,y+23);writeln('|');
          gotoxy (x+39,y+23);writeln('|');
          gotoxy (x+1,y+24);writeln('--------------------------------------');
          gotoxy (x,y+25);writeln('|');
          gotoxy (x+39,y+25);writeln('|');
          gotoxy (x,y+26);writeln('|');
          gotoxy (x+2,y+26);writeln('6 - Vuelos');
          gotoxy (x+39,y+26);writeln('|');
          gotoxy (x,y+27);writeln('|');
          gotoxy (x+39,y+27);writeln('|');
          gotoxy (x+1,y+28);writeln('--------------------------------------');
          gotoxy (x,y+29);writeln('|');
          gotoxy (x+39,y+29);writeln('|');
          gotoxy (x,y+30);writeln('|');
          gotoxy (x+2,y+30);writeln('7 - Informacion Adicional');
          gotoxy (x+39,y+30);writeln('|');
          gotoxy (x,y+31);writeln('|');
          gotoxy (x+39,y+31);writeln('|');
          gotoxy (x+1,y+32);writeln('--------------------------------------');
          gotoxy (x,y+33);writeln('|');
          gotoxy (x+39,y+33);writeln('|');
          gotoxy (x,y+34);writeln('|');
          gotoxy (x+7,y+34);textbackground (white);textcolor (blue);writeln('|ESC| - Salir del programa'); textcolor (lightgreen); textbackground (9);
          gotoxy (x+39,y+34);writeln('|');
          gotoxy (x,y+35);writeln('|');
          gotoxy (x+39,y+35);writeln('|');
          gotoxy (x,y+36);writeln('----------------------------------------');

          gotoxy (x+33,y+34);op:=readkey;
          end;
          until op in ['1','2','3','4','5','6','7',#27];
          case op of
               '1':menu_aerolinea();
               '2':menu_aeropuerto();
               '3':menu_pasajero();
               '4':menu_reserva();
               '5':menu_venta();
               '6':menu_vuelo();
               '7':menu_extra();
          end;
    end;
    until op = #27;
end;

begin




end.
