//Se tienen los datos de los vuelos de un aeropuerto para un deteminado dia. De c/u se lee: nro de vuelo, destino, hora de salida, duracion, linea aerea y costo del pasaje. Se pide:
//A. Todos los vuelos cuyo destino es Amsterdam e indicar si Aerolineas Argentinas de dirige hacia ese destino
//B. Listado ordenado por linea aerea y por destino
//C. Determinar si el vuelo AA900 tiene como destino a Roma y mostrar todos sus datos
//D. Dado el incremento del combustible en Espania se debe actualizar en un 10% todos los pasajes de la linea aerea Iberia
Program EJAerolineas;
uses crt;
const
     n=10000;
type
    t_r=record
              nrovuelo:string[5];
              destino:string[100];
              horasalida:string[5];
              duracion:word;
              linea:string[50];
              costo:real;
    end;
    t_v= array [1..n] of t_r;
var
   v:t_v;
   l,c:word;
   ar:boolean;
procedure inicializar (var vector:t_v; var lim:word);
var i:1..n;
begin
     for i:=1 to n do
         with vector[i] do
         begin
              nrovuelo:=' ';
              destino:=' ';
              horasalida:=' ';
              duracion:=0;
              linea:=' ';
              costo:=0;
         end;
         lim:=0;
end;
procedure cargar (var vector:t_v; var lim:word);
var aux:string[5];
begin
         writeln ('Nro de vuelo');
         readln (aux);
         while (aux<>'0') and (lim<n) do
         begin
               inc (lim);
               with vector[lim] do
               begin
                    nrovuelo:=aux;
                    writeln ('Destino');
                    readln (destino);
                    writeln ('Hora de la salida');
                    readln (horasalida);
                    writeln ('Duracion');
                    readln (duracion);
                    writeln ('Linea');
                    readln (linea);
                    writeln ('Costo');
                    readln (costo);
               end;
               writeln ('Nro de vuelo');
               readln (aux);
         end;
end;
procedure ams (var vector:t_v; lim:word; var cant:word; var arg:boolean);
var i:1..n;
begin
     cant:=0;
     arg:=false;
     for i:=1 to lim do
          if vector[i].destino = 'amsterdam' then
          begin
             inc (cant);
             if vector[i].linea = 'aerolineas argentinas' then
                arg:=true;
          end;
end;
procedure ordenar (var vector:t_v; lim:word);
var i,j:byte; aux1,aux2:string;
begin
     for i:=1 to lim-1 do
         for j:=1 to lim-i do
             if (vector[j].linea + vector[j].destino) > (vector[j+1].linea + vector[j+1].destino) then
             begin
                  aux1:=vector[j].linea;
                  aux2:=vector[j].destino;
                  vector[j].linea:=vector[j+1].linea;
                  vector[j].destino:=vector[j+1].destino;
                  vector[j+1].linea:=aux1;
                  vector[j+1].destino:=aux2;
             end;
end;
procedure rom (var vector:t_v; lim:word);
var i:1..n;
begin
     for i:=1 to lim do
         if (vector[i].nrovuelo = 'AA900') and (vector[i].destino = 'roma') then
         begin
              with vector[i] do
              begin
                   writeln ('Nro del vuelo: ', nrovuelo);
                   writeln ('Destino: ', destino);
                   writeln ('Hora de salida: ', horasalida);
                   writeln ('Duracion: ', duracion);
                   writeln ('Linea: ', linea);
                   writeln ('Costo: ', costo:2:2);
              end;
         end;
end;
procedure aumento (var vector:t_v; lim:word);
var i:1..n; aux:real;
begin
     for i:=1 to lim do
         if vector[i].linea = 'iberia' then
         begin
            aux:= (10*vector[i].costo)/100;
            vector[i].costo:=vector[i].costo+aux;
         end;
end;
procedure mostrar (var vector:t_v; var lim:word);
var i:1..n;
begin
     for i:=1 to lim do
         with vector[i] do
         begin
              writeln ('Nro de vuelo: ', nrovuelo);
              writeln ('Destino: ', destino);
              writeln ('Hora de salida: ', horasalida);
              writeln ('Duracion: ', duracion);
              writeln ('Linea: ', linea);
              writeln ('Costo: ', costo:2:2, ' $');
         end;
end;
begin
     inicializar (v,l);
     cargar (v,l);
     ams (v,l,c,ar);
     writeln ('Hay ', c, ' vuelos que se dirigen a Amsterdam');
     if ar = true then
     begin
        writeln ('Aerolineas Argentinas se dirige a dicho destino');
     end
     else
         writeln ('Aerolineas Argentinas no se dirige a dicho destino');
     writeln ('Para ordenar los vuelos presione una tecla');
     readkey;
     clrscr;
     ordenar (v,l);
     mostrar (v,l);
     rom (v,l);
     aumento (v,l);
     readkey;
end.
