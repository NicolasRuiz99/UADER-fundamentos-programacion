Program TP6_13;
uses crt;
var num:integer;
    r:string[1];
procedure pon (nro:integer; var res:string[1]);
begin
     if nro > 0 then
     begin
        res:='P';
     end
     else
         res:='N';
end;
begin
     writeln ('Ingrese un numero entero');
     read (num);
     pon (num,r);
     writeln (r);
     readkey;
end.
