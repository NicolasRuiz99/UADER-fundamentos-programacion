Program TP10_5;
uses crt;
const
     n=1000;
type
    t_r=record
              nombre:string[50];
              sexo:string[1];
              edad:word;
              peso:integer;
              altura:real;
        end;
    t_v= array [1..n] of t_r;
var
   v:t_v;
   l:word;
procedure inicializar (var vector:t_v; var lim:word);
var i:1..n;
begin
     lim:=0;
     for i:=1 to n do
         with vector[i] do
         begin
              nombre:=' ';
              sexo:=' ';
              edad:=0;
              peso:=0;
              altura:=0;
         end;
end;
procedure cargar (var vector:t_v; var lim:word);
var aux:string[50];
begin
     writeln ('Nombre');
     readln (aux);
     while (aux<>'z') and (lim<n) do
     begin
          inc (lim);
          with vector[lim] do
          begin
               nombre:=aux;
               writeln ('Sexo');
               readln (sexo);
               writeln ('Edad');
               readln (edad);
               writeln ('Peso');
               readln (peso);
               writeln ('Altura');
               readln (altura);
           end;
           writeln ('Nombre');
           readln (aux);
     end;
end;
function per60 (var vector:t_v; lim:word):word;
var i:1..n; aux:word;
begin
     aux:=0;
     for i:=1 to lim do
          if vector[i].edad > 60 then
             inc (aux);
     per60:=aux;
end;
function mujeres (var vector:t_v; lim:word):word;
var i:1..n; aux:word;
begin
     aux:=0;
     for i:=1 to lim do
          if (vector[i].sexo = 'm') and (vector[i].altura > 1.7) then
             inc (aux);
     mujeres:=aux;
end;
function peso (var vector:t_v; lim:word):real;
var i:1..n; aux:word;
begin
     aux:=0;
     for i:=1 to lim do
          if vector[i].peso < 50 then
             inc (aux);
     peso:=(aux*100)/lim;
end;
begin
     inicializar (v,l);
     cargar (v,l);
     if per60 (v,l) <> 0 then
     begin
          writeln ('Hay ', per60 (v,l), ' personas con mas de 60 anios');
     end
     else
         writeln ('No hay personas con mas de 60 anios');
     if mujeres (v,l) <> 0 then
     begin
          writeln ('Hay ', mujeres (v,l), ' mujeres de mas de 1,70 m');
     end
     else
         writeln ('No hay mujeres de mas de 1,70 m');
     if peso (v,l) <> 0 then
     begin
          writeln ('Hay un ', peso (v,l):2:2, ' % de personas con menos de 50 Kg de peso');
     end
     else
         writeln ('No hay personas con menos de 50 Kg de peso');
     readkey;
end.
