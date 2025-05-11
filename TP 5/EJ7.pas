Program EJ7;
uses crt;
var suma,i:integer;
begin
     suma:=0;
     for i:= 300 to 1232 do
     begin
          if (i mod 2)=0 then
             suma:=suma+1;
     end;
     writeln ('La suma es de ', suma);
readkey;
end.
