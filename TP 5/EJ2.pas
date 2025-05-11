Program EJ2;
uses crt;
var suma,prod,i:integer;
begin
     suma:=0;
     prod:=0;
     for i:=20 to 500 do
     begin
          if (i mod 2)=0 then
          begin
               suma:=suma+i;
               prod:=prod*i;
          end;
     end;
     writeln ('La suma da ', suma, ' y el producto da ', prod);
     readkey;
end.
