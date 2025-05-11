Program TP11_11;
uses crt;
const
     n=1000;
type
    t_r=record
              cod:word;
              descripcion:string[50];
              precio:real;
     end;
     t_v=array [1..n] of t_r;
var
   v:t_v;
   l,p,busc:word;
   art:t_r;
procedure inicializar (var vector:t_v; var lim:word);
var i:1..n;
begin
     lim:=0;
     for i:=1 to n do
         with vector[i] do
         begin
              cod:=0;
              descripcion:=' ';
              precio:=0;
         end;
end;
procedure cargar (var vector:t_v; var lim:word);
var aux:word;
begin
     writeln ('Codigo del articulo');
     readln (aux);
     while (aux<>0) and (lim<=n) do
     begin
          inc (lim);
          with vector[lim] do
          begin
               cod:=aux;
               writeln ('Descripcion');
               readln (descripcion);
               writeln ('Precio');
               readln (precio);
          end;
          writeln ('Codigo del articulo');
          readln (aux);
      end;
end;
procedure lista_completa (var vector:t_v; lim:word);
var i:1..n;
begin
     for i:=1 to lim do
         with vector[i] do
              writeln ('Codigo del articulo: ', cod, '; Descripcion: ', descripcion, '; Precio: ', precio:2:2, ' $');
end;
procedure lista_b (var vector:t_v; lim:word);
var i:1..n;
begin
     for i:=1 to lim do
         with vector[i] do
              if (descripcion[1] = 'b') or (descripcion[1] = 'B') then
                 writeln (descripcion, '; Codigo de articulo: ', cod, '; Precio: ', precio:2:2, ' $');
end;
procedure ordenar (var vector:t_v; lim:word);
var i,j:1..n; aux:t_r;
begin
     for i:=1 to lim-1 do
         for j:=1 to lim-i do
             if vector[j].cod > vector[j+1].cod then
             begin
                  aux:=vector[j];
                  vector[j]:=vector[j+1];
                  vector[j+1]:=aux;
             end;
end;
procedure bbin (var vector:t_v; lim:word; buscado:word; var pos:word);
var pri,ult,med:word;
begin
     pri:=1;
     ult:=lim;
     while (pos=0) and (pri<=ult) do
     begin
          med:= (pri+ult) div 2;
          if vector[med].cod = buscado then
          begin
               pos:=med;
          end
          else
              if vector[med].cod < buscado then
              begin
                   pri:=med+1;
              end
              else
                  ult:=med-1;
      end;
end;
procedure articulo_caro (var vector:t_v; lim:word; var articulo:t_r);
var i:1..n; max:real;
begin
     max:=vector[1].precio;
     art:=vector[1];
     for i:=2 to lim do
         if vector[i].precio > max then
         begin
            max:=vector[i].precio;
            articulo:=vector[i];
         end;
end;
begin
     inicializar (v,l);
     cargar (v,l);
     clrscr;
     lista_completa (v,l);
     writeln ('Lista de articulos que empiezan por b');
     lista_b (v,l);
     ordenar (v,l);
     p:=0;
     while (p=0) do
     begin
          writeln ('Ingrese el codigo del articulo para averiguar su precio');
          readln (busc);
          bbin (v,l,busc,p);
     end;
     with v[p] do
          writeln ('El articulo con el codigo ', cod, ' cuesta ', precio:2:2, ' $');
     articulo_caro (v,l,art);
     with art do
     begin
          writeln ('El articulo mas caro es el siguiente:');
          writeln ('Codigo: ', cod, '; Descripcion: ', descripcion, '; Precio: ', precio:2:2, ' $');
     end;
     readkey;
end.
