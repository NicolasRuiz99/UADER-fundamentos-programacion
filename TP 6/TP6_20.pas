Program TP6_20;
uses crt;
var n1,n2,r:integer;
procedure por (num1:integer; num2:integer ; var res:integer);
begin
     res:= (num1*100) div num2;
end;
begin
     writeln ('Ingrese el 1er numero');
     readln (n1);
     writeln ('Ingrese el 2do numero');
     readln (n2);
     por (n1,n2,r);
     clrscr;
     writeln (n1, ' representa un ', r, ' % de ', n2);
     readkey;
end.
