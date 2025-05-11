Program TP7_12;
uses crt;
const
     n=12;
type
    t_v=array [1..n] of real;
var
   v:t_v;
   mv:real;
   m:word;
procedure inicializar (var vector:t_v);
var i:1..n;
begin
     for i:=1 to n do
         vector[i]:=0;
end;
procedure cargar (var vector:t_v);
var i:1..n; aux:real;
begin
     for i:=1 to n do
     begin
         readln (aux);
         while aux<>0 do
         begin
              vector[i]:=vector[i]+aux;
              readln (aux);
         end;
     end;
end;
function total (var vector:t_v):real;
var i:1..n;
begin
     total:=0;
     for i:=1 to n do
         total:=total+vector[i];
end;
procedure mayorventa (var vector:t_v; var mayventa:real; var mes:word);
var i:1..n;
begin
     mayventa:=vector[1];
     mes:=1;
     for i:=1 to n do
     begin
          if vector[i]>mayventa then
          begin
               mayventa:=vector[i];
               mes:=i;
          end;
     end;
end;
function porventamayor (mayventa:real; total:real):real;
begin
     porventamayor:=(mayventa*100)/total;
end;
begin
     inicializar (v);
     cargar (v);
     writeln ('El promedio de ventas del anio es de ', total(v)/n:3:2, ' $');
     mayorventa (v,mv,m);
     writeln ('En el mes ', m, ' se produjo la mayor venta y la misma fue de ', mv:3:2, ' $');
     writeln ('La mayor venta representa un ', porventamayor(mv,total(v)):3:2, ' % del total anual');
     readkey;
end.
