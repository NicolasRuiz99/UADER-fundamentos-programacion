Program TP9_4;
uses crt;
const
     n=1000;
     limA=10;
     limB=6;
     limC=16;
type
    t_v=array [1..n] of integer;
var
   A,B,C:t_v;
procedure inicializar (var vector:t_v);
var i:1..n;
begin
     for i:=1 to n do
         vector[i]:=0;
end;
procedure cargar (var vector:t_v; lim:word);
var i:integer;
begin
     for i:=1 to lim do
         readln (vector[i]);
end;
procedure ordenar (var vector:t_v; lim:word);
var i,j:word;
    aux:integer;
begin
     for i:=1 to (lim-1) do
     begin
          for j:=1 to (lim-i) do
          begin
               if vector[j] > vector[j+1] then
               begin
                    aux:=vector[j];
                    vector[j]:=vector[j+1];
                    vector[j+1]:=aux;
               end;
          end;
     end;
end;
procedure sumar (var vectorA:t_v; var vectorB:t_v; var vectorC:t_v);
var i:integer;
begin
     for i:=1 to limA do
         vectorC[i]:=vectorA[i];
     for i:=(limA+1) to limC do
         vectorC[i]:=vectorB[i-limA];
end;
function buscar (var vector:t_v; lim:word):word;
var pos:word;
begin
     pos:=0;
     buscar:=0;
     while (buscar = 0) and (pos<lim) do
     begin
          inc (pos);
          if vector[pos] = 255 then
             buscar:=pos;
     end;
end;
procedure mostrar (var vector:t_v; lim:word);
var i:1..n;
begin
     for i:=1 to lim do
         writeln (vector[i]);
end;
begin
     inicializar (A);
     inicializar (B);
     inicializar (C);
     writeln ('Lista A');
     cargar (A,limA);
     writeln ('Lista B');
     cargar (B,limB);
     ordenar (A,limA);
     ordenar (B,limB);
     writeln ('Lista A ordenada');
     mostrar (A,limA);
     writeln ('Lista B ordenada');
     mostrar (B,limB);
     sumar (A,B,C);
     writeln ('Lista C');
     mostrar (C,limC);
     if buscar (C,limC) <> 0 then
     begin
          writeln ('Existe el nro 255');
     end
     else
         writeln ('No existe el nro 255');
     readkey;
end.
