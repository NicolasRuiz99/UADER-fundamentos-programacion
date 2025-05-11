Program TP6_1;
uses crt;
var an,al,ar:integer;
procedure geometria (alto:integer;ancho:integer; var area:integer);
begin
     area:=alto*ancho;
end;
begin
     readln (an,al);
     geometria (al,an,ar);
     writeln ('El area es de ', ar);
     readkey;
end.
