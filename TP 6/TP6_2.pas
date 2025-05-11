   Program TP6_2;
uses crt;
var an,al,p:integer;
procedure perimetro (alto:integer;ancho:integer; var per:integer);
begin
     per:= (alto+ancho)*2;
end;
begin
     readln (an,al);
     perimetro (al,an,p);
     writeln ('El perimetro es de ', p);
     readkey;
end.

