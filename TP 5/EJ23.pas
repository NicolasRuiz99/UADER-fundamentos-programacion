Program EJ23;
uses crt;
var max,min,num:integer;
begin
     writeln ('Ingrese numero');
     readln (num);
     max:=num;
     min:=num;
     while num<>0 do
     begin
          if num > max then
          begin
               max:=num;
          end
          else
          begin
               if num < min then
                  min:=num;
          end;
          writeln ('Ingrese numero');
          readln (num);
      end;
      writeln ('El rango es ', (max-min));
      readkey;
end.
