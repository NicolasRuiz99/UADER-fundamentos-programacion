`//Se tienen los datos de X jugadores de futbol: club, apynom, cant.goles.
//A. Maximo goleador y mostrar todos sus datos
//B. Listado ordenado de jugadores x club
//C. Dado un club mostrar todos sus jugadores
//D. y promedio de goles del club de futbol
Program EJFutbol;
uses crt;
const
     n=1000;
type
    t_club=record
                 club:string[50];
                 apynom:string[50];
                 cant_goles:word;
    end;
    t_v=array [1..n] of t_club;
var
   v:t_v;
   l:1..n;
   jugador_max:t_club;
   buscado:string[50];
   cont,acu,pos,pos1,pos2,i:word;
procedure inicializar (var vector:t_v; var lim:word);
var i:1..n;
begin
     lim:=0;
     for i:=1 to n do
         with vector[i] do
         begin
              club:=' ';
              apynom:=' ';
              cant_goles:=0;
         end;
end;
procedure cargar (var vector:t_v; var lim:word);
var aux:string[50];
begin
     writeln ('Club');
     readln (aux);
     while (lim<n) and (aux<>'z') do
     begin
          inc (lim);
          with vector[lim] do
          begin
               club:=aux;
               writeln ('Apellido y Nombre');
               readln (apynom);
               writeln ('Cantidad de goles');
               readln (cant_goles);
          end;
          writeln ('Club');
          readln (aux);
      end;
end;
procedure max_goleador (var vector:t_v; lim:word; var x:t_club);
var i:1..n; max:word;
begin
     max:=vector[1].cant_goles;
     x:=vector[1];
     for i:=1 to lim do
         if max < vector[i].cant_goles then
         begin
              max:=vector[i].cant_goles;
              x:=vector[i];
         end;
end;
procedure ordenar (var vector:t_v; lim:word);
var i,j:word; aux:t_club;
begin
     for i:=1 to lim-1 do
         for j:=1 to lim-i do
             if (vector[j].club+vector[j].apynom) > (vector[j+1].club+vector[j+1].apynom) then
             begin
                  aux:=vector[j];
                  vector[j]:=vector[j+1];
                  vector[j+1]:=aux;
             end;
end;
procedure listar (var vector:t_v; lim:word);
var i:word;
begin
     for i:=1 to lim do
         with vector[i] do
              writeln (apynom, ', ', club, ', ', cant_goles, ', ');
end;
procedure bbin (var vector:t_v; lim:word; busc:string[50]; var pos:word);
var pri,ult,med:word;
begin
     pri:=1;
     ult:=lim;
     while (pri<=ult) and (pos=0) do
     begin
          med:=(pri+ult) div 2;
          if vector[med].club = busc then
          begin
               pos:=med;
          end
          else
          begin
               if vector[med].club < busc then
               begin
                    pri:=med+1;
               end
               else
                   ult:=med-1;
          end;
      end;
end;
procedure jugadoresxclub (var vector:t_v; lim:word; pos:word; var pos1:word; var pos2:word; var ac:word; var c:word);
var buscado:string[50];
begin
     buscado:=vector[pos].club;
     while (pos>1) and (vector[pos-1].club = buscado) do
           dec (pos);
     pos1:=pos;
     while (pos<=lim) and (vector[pos].club = buscado) do
     begin
          ac:=ac+vector[pos].cant_goles;
          c:=c+1;
          inc (pos);
     end;
     pos2:=pos-1;
end;
begin
     inicializar (v,l);
     cargar (v,l);
     max_goleador (v,l,jugador_max);
     with jugador_max do
          writeln ('El jugador con mayor cantidad de goles es: ', apynom, ' y pertenece al club: ', club, ' y realizo: ', cant_goles, ' goles');
     writeln ('Pulse una tecla para ordenar la lista por club y jugador alfabeticamente');
     readkey;
     clrscr;
     ordenar (v,l);
     listar (v,l);
     writeln ('Ingrese un club');
     readln (buscado);
     pos:=0;
     bbin (v,l,buscado,pos);
     if pos = 0 then
     begin
          writeln ('No existe el club buscado');
     end
     else
     begin
          cont:=0;
          acu:=0;
          jugadoresxclub (v,l,pos,pos1,pos2,acu,cont);
     end;
     writeln ('Jugadores del club ', v[pos1].club, ': ');
     for i:=pos1 to pos2 do
         with v[i] do
         begin
              writeln ('Nombre: ', apynom);
              writeln ('Cantidad de goles: ', cant_goles);
         end;
     writeln ('El promedio de goles del club es de ', acu/cont:2:2);
     readkey;
end.
