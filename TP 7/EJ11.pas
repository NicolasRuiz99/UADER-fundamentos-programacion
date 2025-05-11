Program TP7_11;
uses crt;
const
     n=12;
type
    t_vector= array [1..n] of real;
var
   v:t_vector;
   mayorv,menorv:real;
   mesmay,mesmen:word;
procedure inicializar (var vector:t_vector);
var i:1..n;
begin
     for i:=1 to n do
         vector[i]:=0;
end;
procedure cargar (var vector:t_vector);
var i:1..n;
begin
     for i:=1 to n do
         readln (vector[i]);
end;
function promedio (var vector:t_vector):real;
var i:1..n;
    res:real;
begin
     res:=0;
     for i:=1 to n do
         res:=(res+vector[i]);
     promedio:=res/n;
end;
procedure mayor (var vector:t_vector; var mayorventa:real; var mesmayor:word);
var i:1..n;
begin
     mayorventa:= vector[1];
     mesmayor:=1;
     for i:=1 to n do
     begin
          if vector[i] > mayorventa then
          begin
               mayorventa:=vector[i];
               mesmayor:=i;
          end;
     end;
end;
procedure menor (var vector:t_vector; var menorventa:real; var mesmenor:word);
var i:1..n;
begin
     menorventa:= vector[1];
     mesmenor:=1;
     for i:=1 to n do
     begin
          if vector[i] < menorventa then
          begin
               menorventa:=vector[i];
               mesmenor:=i;
          end;
     end;
end;
begin
     inicializar (v);
     cargar (v);
     mayor (v,mayorv,mesmay);
     menor (v,menorv,mesmen);
     writeln ('En el mes 10 la venta fue de ', v[10]:2:3, ' $');
     writeln ('El promedio de ventas del año es de ', promedio(v):3:2);
     writeln ('En el mes ', mesmay, ' se produjo la mayor venta y fue de ', mayorv:3:2, ' $');
     writeln ('En el mes ', mesmen, ' se produjo la menor venta y fue de ', menorv:3:2, ' $');
     readkey;
end.
