Program TP9_3;
uses crt;
const
     n=100000;
type
    t_v=array [1..n] of char;
var
   v:t_v;
   l:word;
procedure inicializar (var vector:t_v);
var i:1..n;
begin
     for i:=1 to n do
         vector[i]:=' ';
end;
procedure cargar (var vector:t_v; var lim:word);
var aux:char;
begin
     readln (aux);
     while (aux<>'0') and (lim<n) do
     begin
          inc (lim);
          vector[lim]:=aux;
          readln (aux);
     end;
end;
procedure ordenar (var vector:t_v; lim:word);
var i,j:word;
    aux:char;
begin
     for i:=1 to (lim-1) do
     begin
          for j:=1 to (lim-i) do
          begin
               if vector[j] < vector[j+1] then
               begin
                    aux:=vector[j];
                    vector[j]:=vector[j+1];
                    vector[j+1]:=aux;
               end;
          end;
     end;
end;
procedure mostrar (var vector:t_v; lim:word);
var i:integer;
begin
     for i:=1 to lim do
         writeln (vector[i]);
end;
function buscar (var vector:t_v; lim:word):word;
var pos:word;
begin
     buscar:=0;
     pos:=0;
     while (buscar=0) and (pos<lim) do
     begin
          inc (pos);
          if vector[pos] = 'z' then
             buscar:=pos;
     end;
end;
begin
     inicializar (v);
     cargar (v,l);
     clrscr;
     writeln ('Lista desordenada');
     mostrar (v,l);
     ordenar (v,l);
     writeln ('Listra ordenada');
     mostrar (v,l);
     if (buscar (v,l) <> 0) then
     begin
          writeln ('La letra z existe y se encuentra en la posicion ', buscar (v,l));
     end
     else
         writeln ('La letra z no se encuentra en la lista');
     readkey;
end.
