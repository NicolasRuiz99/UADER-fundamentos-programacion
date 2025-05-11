Program TP9_10;
uses crt;
const
     n=25;
type
    t_estudiante= record
                   n_est:word;
                   nombre:string[30];
                   nota:0..10;
    end;
    t_vector= array [1..n] of t_estudiante;
var
   v:t_vector;
   l,p:byte;
   busc:string [30];
   max:0..10;
procedure inicializar (var vector:t_vector; var lim:byte);
var i:byte;
begin
     for i:=1 to n do
         with vector[i] do
         begin
              n_est:=0;
              nombre:=' ';
              nota:=0;
         end;
     lim:=0;
end;
procedure cargar (var vector:t_vector; var lim:byte);
var aux:string[30];
begin
     readln (aux);
     while (lim<n) and (aux<>' ') do
     begin
          inc (lim);
          with vector[lim] do
          begin
               readln (n_est);
               nombre:=aux;
               readln (nota);
          end;
          readln (aux);
     end;
end;
procedure ordenar (var vector:t_vector; lim:byte);
var i,j:byte; aux:t_estudiante;
begin
     for i:=1 to (lim-1) do
         for j:=1 to (lim-i) do
             if vector[j].nombre > v[j+1].nombre then
             begin
                  aux:=v[j];
                  v[j]:=v[j+1];
                  v[j+1]:=aux;
             end;
end;
procedure bbin (var vector:t_vector; lim:byte; buscado:t_cad; var pos:byte);
var med,pri,ult:byte;
begin
     pos:=0;
     pri:=1;
     ult:=lim;
     while (pri<=ult) and (pos<>0) do
     begin
          med:=(pri+ult) div 2;
          if vector[med].nombre = buscado then
          begin
             pos:=med;
          end
          else
          begin
               if vector[med].nombre > buscado then
               begin
                    ult:=med-1;
               end
               else
                   pri:=med+1;
          end;
    end;
end;
begin
     inicializar (v,l);
     cargar (v,l);
     ordenar (v,l);
     maximo (v,l,max);
     readln (buscado);
     bbin (v,l,busc,p);
     if p <> 0 then
     begin
          writeln ('Existe');
     end
     else
         writeln ('No existe');
end.
