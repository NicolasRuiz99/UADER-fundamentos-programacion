Program EJ24;
uses crt;
var num,fac,i:integer;
    cont1000:word;
begin
     writeln ('Ingrese numero');
     readln (num);
     while num<>0 do
     begin
          if num > 1000 then
             cont1000:=cont1000+1;
          writeln ('Ingrese numero');
          readln (num);
     end;
     fac:=1;
     if cont1000 < 20 then
     begin
          for i:=1 to cont1000 do
              fac:=i*1
     end;
     writeln ('Su factorial es ', fac);
     readkey;
end.
