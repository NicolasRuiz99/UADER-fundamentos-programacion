Program TP11_5;
uses crt;
const
     n=1000;
type
    t_r=record
              codigo:string[20];
              stock:word;
    end;
    t_v=array [1..n] of t_r;
var
   v:t_v;
   l:word;
procedure inicializar (var vector:t_v; var lim:word);
var i:1..n;
begin
     for i:=1 to n do
         with vector[i] do
         begin
              codigo:=' ';
              stock:=0;
         end;
     lim:=0;
end;
procedure cargar (var vector:t_v; var lim:word);
var aux:string[20];
begin
     writeln ('Codigo del libro');
     readln (aux);
     while (lim<=n) and (aux<>'0') do
     begin
          inc (lim);
          with vector[lim] do
          begin
               codigo:=aux;
               writeln ('Stock');
               readln (stock);
          end;
          writeln ('Codigo del libro');
          readln (aux);
     end;
end;
procedure ordenar (var vector:t_v; lim:word);
var i,j:1..n; aux:t_r;
begin
     for i:=1 to lim-1 do
         for j:=1 to lim-i do
             if vector[j].stock > vector[j+1].stock then
             begin
                  aux:=vector[j];
                  vector[j]:=vector[j+1];
                  vector[j+1]:=aux;
             end;
end;
procedure reposicion (var vector:t_v; lim:word);
var aux,pos:word;
begin
     pos:=0;
     writeln ('Necesitan reposicion');
     aux:=vector[1].stock;
     while (pos<=lim) and (aux < 3) do
     begin
           inc (pos);
           with vector[pos] do
                if codigo <> ' ' then
                   writeln ('Codigo: ', codigo, '; Stock: ', stock);
           aux:=vector[pos+1].stock;
     end;
     if pos = 0 then
        writeln ('Ninguno de los articulos');
end;
begin
     inicializar (v,l);
     cargar (v,l);
     ordenar (v,l);
     reposicion (v,l);
     readkey;
end.
