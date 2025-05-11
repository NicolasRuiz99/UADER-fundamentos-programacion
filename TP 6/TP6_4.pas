Program TP6_4;
uses crt;
var  nro,nrof:integer;

procedure fac (num:integer; var nf:integer);
var i:integer;
begin
    nf:= 1;
    for i:= 1 to num do
    begin
         nf:= nf * i;
    end;
end;
begin
     writeln ('Ingrese un nro');
     readln (nro);
     if (nro = 0) or (nro = 1) then
     begin
        writeln ('Su factorial es 1');
     end
     else
     begin
          fac (nro,nrof);
          writeln ('Su factorial es ', nrof);
     end;
     readkey;
end.
