//Se tienen las peliculas candidatas en distintos rubros al oscar, de c/u se tiene: titulo, genero, protagonistas, origen, duracion en segundos. Se pide:
//A. Cant de peliculas argentinas
//B. Mostrar los protagonistas de la pelicula 'El Ciudadano Ilustre'
//C. Titulo de la pelicula con menor duracion
Program EJ_Peliculas;
uses crt;
const
     n=100000;
type
    t_p= record
           titulo:string[30];
           genero:string[30];
           prota:string[200];
           origen:string[30];
           duracion:word;
    end;
    t_v= array [1..n] of t_p;
var
   v:t_v;
   l:byte;
procedure inicializar (var vector:t_v; var lim:byte);
var i:1..n;
begin
     lim:=0;
     for i:=1 to n do
     begin
          with vector[i] do
          begin
               titulo:=' ';
               genero:=' ';
               prota:=' ';
               origen:=' ';
               duracion:=0;
          end;
     end;
end;
procedure cargar (var vector:t_v; var lim:byte);
var aux:string[30];
begin
     writeln ('Titulo');
     readln (aux);
     while (lim<n) and (aux<>'z') do
     begin
          inc (lim);
          with vector[lim] do
          begin
               titulo:=aux;
               writeln ('Genero');
               readln (genero);
               writeln ('Protagonistas');
               readln (prota);
               writeln ('Origen');
               readln (origen);
               writeln ('Duracion');
               readln (duracion);
          end;
          writeln ('Titulo');
          readln (aux);
     end;
end;
function arg (var vector:t_v; lim:byte):word;
var i:1..n; aux:word;
begin
     aux:=0;
     for i:=1 to lim do
         if (vector[i].origen = 'Argentina') or (vector[i].origen = 'argentina') then
            inc (aux);
     arg:=aux;
end;
function pro (var vector:t_v; lim:byte):string[200];
var i:1..n; aux:string[200];
begin
     for i:=1 to lim do
         if (vector[i].titulo = 'el ciudadano ilustre') then
            aux:=vector[i].prota;
     pro:=aux;
end;
function menor (var vector:t_v; lim:byte):string[30];
var i:1..n; aux:string[30]; men:word;
begin
     men:=vector[1].duracion;
     for i:=1 to lim do
         if (vector[i].duracion) < men then
         begin
              men:=vector[i].duracion;
              aux:=vector[i].titulo;
         end;
     menor:=aux;
end;
begin
     inicializar (v,l);
     cargar (v,l);
     if arg (v,l) <> 0 then
     begin
          writeln ('Hay ', arg (v,l), ' peliculas argentinas');
     end
     else
         writeln ('No hay peliculas argentinas');
     if pro (v,l) <> ' ' then
          writeln ('Los protagonistas de la pelicula El Ciudadano Ilustre son: ', pro (v,l));
     writeln ('La pelicula con menor duracion es ', menor (v,l));
     readkey;
end.
