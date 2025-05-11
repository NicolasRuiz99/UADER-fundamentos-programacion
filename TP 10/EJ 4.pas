Program TP10_4;
uses crt;
const
     n=2;
type
    t_r=record
              energia:real;
              gas:real;
              guardias:real;
              lavanderia:real;
              consejeria:real;
         end;
    t_v= array [1..n] of t_r;
    t_v2= array [1..n] of real;
var
   v1:t_v;
   v2:t_v2;
procedure inicializar1 (var vector:t_v);
var i:1..n;
begin
     for i:=1 to n do
     with vector[i] do
     begin
          energia:=0;
          gas:=0;
          guardias:=0;
          lavanderia:=0;
          consejeria:=0;
     end;
end;
procedure inicializar2 (var vector:t_v2);
var i:1..n;
begin
     for i:=1 to n do
         vector[i]:=0;
end;
procedure cargar (var vector:t_v);
var i:1..n;
begin
     for i:=1 to n do
     begin
          writeln ('Departamento ', i);
          with vector[i] do
          begin
               writeln ('Energia');
               readln (energia);
               writeln ('Gas');
               readln (gas);
               writeln ('Guardias');
               readln (guardias);
               writeln ('Lavanderia');
               readln (lavanderia);
               writeln ('Consejeria');
               readln (consejeria);
          end;
     end;
end;
procedure total (var vector1:t_v; var vector2:t_v2);
var i:1..n;
begin
     for i:=1 to n do
         vector2[i]:=vector1[i].energia+vector1[i].gas+vector1[i].guardias+vector1[i].lavanderia+vector1[i].consejeria;
end;
procedure mostrar1 (var vector:t_v);
var i:1..n;
begin
     for i:=1 to n do
     begin
          writeln ('Costos Departamento ', i);
          with vector[i] do
          begin
               writeln ('Energia: ', energia:2:2, ' $');
               writeln ('Gas: ', gas:2:2, ' $');
               writeln ('Guardias: ', guardias:2:2, ' $');
               writeln ('Lavanderia: ', lavanderia:2:2, ' $');
               writeln ('Consejeria: ', consejeria:2:2, ' $');
          end;
     end;
end;
procedure mostrar2 (var vector:t_v2);
var i:1..n;
begin
     for i:=1 to n do
         writeln ('Costos totales Deparatamento ', i, ': ', vector[i]:2:2, ' $');
end;
begin
     inicializar1 (v1);
     inicializar2 (v2);
     cargar (v1);
     total (v1,v2);
     clrscr;
     mostrar1 (v1);
     mostrar2 (v2);
     readkey;
end.
