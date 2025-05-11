Program EJ10;
uses crt;
var n,i:integer;
    suma:real;
begin
     writeln ('Ingrese n');
     read (n);
     suma:=0;
     for i:=4 to n do
         suma:=suma+(1/i);
     writeln (1+(1/2)+(1/3)+suma);
     readkey;
end.
