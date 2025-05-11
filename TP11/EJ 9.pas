Program TP11_9;
uses crt;
const
     n=1000;
type
    t_r=record
              codigo:word;
              cant_vendida:word;
              costo_fabricacion:real;
              precio_unitario:real;
    end;
    t_v=array [1..n] of t_r;
var
   v:t_v;
   l:word;
   prod:t_r;
procedure inicializar (var vector:t_v; var lim:word);
var i:1..n;
begin
     lim:=0;
     for i:=1 to n do
         with vector[i] do
         begin
              codigo:=0;
              cant_vendida:=0;
              costo_fabricacion:=0;
              precio_unitario:=0;
         end;
end;
procedure cargar (var vector:t_v; var lim:word);
var aux:word;
begin
     writeln ('Codigo');
     readln (aux);
     while (lim<=n) and (aux<>0) do
     begin
          inc (lim);
          with vector[lim] do
          begin
               codigo:=aux;
               writeln ('Cantidad vendida');
               readln (cant_vendida);
               writeln ('Costo de fabricacion');
               readln (costo_fabricacion);
               writeln ('Precio unitario');
               readln (precio_unitario);
          end;
          writeln ('Codigo');
          readln (aux);
      end;
end;
procedure prod_vendido (var vector:t_v; lim:word; var producto:t_r);
var i:1..n; max:word;
begin
     max:=vector[1].cant_vendida;
     producto:=vector[1];
     for i:=1 to lim do
         if vector[i].cant_vendida > max then
         begin
              max:=vector[i].cant_vendida;
              producto:=vector[i];
         end;
end;
function prod_caro (var vector:t_v; lim:word):real;
var i:1..n; max:real;
begin
     max:=vector[1].precio_unitario;
     for i:=1 to lim do
         if vector[i].precio_unitario > max then
            max:=vector[i].precio_unitario;
     prod_caro:=max;
end;
begin
     inicializar (v,l);
     cargar (v,l);
     prod_vendido (v,l,prod);
     with prod do
     begin
          writeln ('El producto mas vendido es el siguiente:');
          writeln ('Codigo: ', codigo, '; Cantidad vendida: ', cant_vendida, '; Costo de fabricacion: ', costo_fabricacion:2:2, ' $; Precio unitario: ', precio_unitario:2:2, ' $');
          writeln ('La ganancia al vender este producto fue de ', (precio_unitario-costo_fabricacion)*cant_vendida:2:2, ' $');
     end;
     writeln ('El costo unitario del producto mas caro es de ', prod_caro (v,l):2:2, ' $');
     readkey;
end.
