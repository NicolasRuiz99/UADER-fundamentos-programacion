Program TP11_4;
uses crt;
const
     n=1000;
type
    t_r=record
              cod_art:integer;
              descripcion:string[30];
              cantidad:word;
              precio_unitario:real;
    end;
    t_v=array [1..n] of t_r;
var
   v:t_v;
   l,p:word;
   art:t_r;
   busc:integer;
procedure inicializar (var vector:t_v; var lim:word);
var i:1..n;
begin
     lim:=0;
     for i:=1 to n do
         with vector[i] do
         begin
              cod_art:=0;
              descripcion:=' ';
              cantidad:=0;
              precio_unitario:=0;
         end;
end;
procedure cargar (var vector:t_v; var lim:word);
var aux:integer;
begin
     writeln ('Codigo del articulo');
     readln (aux);
     while (lim<=n) and (aux<>0) do
     begin
          inc (lim);
          with vector[lim] do
          begin
               cod_art:=aux;
               writeln ('Descripcion');
               readln (descripcion);
               writeln ('Cantidad');
               readln (cantidad);
               writeln ('Precio unitario');
               readln (precio_unitario);
          end;
          writeln ('Codigo del articulo');
          readln (aux);
     end;
end;
procedure art_caro (var vector:t_v; lim:word; var articulo:t_r);
var i:1..n; max:real;
begin
     max:=vector[1].precio_unitario;
     articulo:=vector[1];
     for i:=1 to lim do
         if vector[i].precio_unitario > max then
         begin
            max:=vector[i].precio_unitario;
            articulo:=vector[i];
         end;
end;
procedure ordenar_cod (var vector:t_v; lim:word);
var i,j:word; aux:t_r;
begin
     for i:=1 to lim-1 do
         for j:=1 to lim-i do
             if vector[j].cod_art > vector[j+1].cod_art then
             begin
                  aux:=vector[j];
                  vector[j]:=vector[j+1];
                  vector[j+1]:=aux;
             end;
end;
procedure ordenar_des (var vector:t_v; lim:word);
var i,j:word; aux:t_r;
begin
     for i:=1 to lim-1 do
         for j:=1 to lim-i do
             if vector[j].descripcion > vector[j+1].descripcion then
             begin
                  aux:=vector[j];
                  vector[j]:=vector[j+1];
                  vector[j+1]:=aux;
             end;
end;
procedure bbin1 (var vector:t_v; lim:word; buscado:integer; var pos:word);
var pri,ult,med:word;
begin
     pri:=1;
     ult:=lim;
     while (pos = 0) and (pri<=ult) do
     begin
          med:= (pri+ult) div 2;
          if vector[med].cod_art = buscado then
          begin
               pos:=med;
          end
          else
              if vector[med].cod_art < buscado then
              begin
                   pri:=med+1;
              end
              else
                  ult:=med-1;
      end;
end;
procedure bbin2 (var vector:t_v; lim:word; var pos:word);
var pri,ult,med:word;
begin
     pri:=1;
     ult:=lim;
     while (pos = 0) and (pri<=ult) do
     begin
          med:= (pri+ult) div 2;
          if vector[med].descripcion = 'queso Don Bautista' then
          begin
               pos:=med;
          end
          else
              if vector[med].descripcion < 'queso Don Bautista' then
              begin
                   pri:=med+1;
              end
              else
                  ult:=med-1;
      end;
end;
procedure art_menor_cant (var vector:t_v; lim:word; var articulo:t_r);
var i:1..n; min:word;
begin
     min:=vector[1].cantidad;
     articulo:=vector[1];
     for i:=1 to lim do
         if vector[i].cantidad < min then
         begin
              min:=vector[i].cantidad;
              articulo:=vector[i];
         end;
end;
procedure art_barato (var vector:t_v; lim:word; var articulo:t_r);
var i:1..n; min:real;
begin
     min:=vector[1].precio_unitario;
     articulo:=vector[1];
     for i:=1 to lim do
         if vector[i].precio_unitario < min then
         begin
            min:=vector[i].precio_unitario;
            articulo:=vector[i];
         end;
end;
begin
     inicializar (v,l);
     cargar (v,l);
     art_caro (v,l,art);
     with art do
          writeln ('El articulo mas caro tiene la cantidad de ', cantidad, ' unidades en existencia');
     ordenar_cod (v,l);
     writeln ('Ingrese un articulo para buscar');
     readln (busc);
     bbin1 (v,l,busc,p);
     if p <> 0 then
     begin
          writeln ('El articulo buscado existe');
     end
     else
         writeln ('El articulo buscado no existe');
     ordenar_des (v,l);
     bbin2 (v,l,p);
     if p <> 0 then
     begin
          writeln ('Este almacen vende queso ''Don Bautista''');
     end
     else
         writeln ('Este almacen no vende queso ''Don Bautista''');
     art_menor_cant (v,l,art);
     writeln ('El articulo con menor existencia es el siguiente:');
     with art do
          writeln ('Codigo: ', cod_art, '; Descripcion: ', descripcion, '; Cantidad: ', cantidad, '; Precio unitario: ', precio_unitario:2:2, ' $');
     art_barato (v,l,art);
     writeln ('El articulo mas barato es el siguiente:');
     with art do
          writeln ('Codigo: ', cod_art, '; Descripcion: ', descripcion, '; Cantidad: ', cantidad, '; Precio unitario: ', precio_unitario:2:2, ' $');
     readkey;
end.
