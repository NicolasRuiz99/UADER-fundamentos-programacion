Program EJ12;
uses crt;
var cod,comp1,comp2,comp3,i:integer;
begin
     for i:=1 to 1000 do
     begin
          writeln ('Ingrese codigo de comportamiento');
          read (cod);
          case cod of
               1: comp1:=comp1+1;
               2: comp2:=comp2+1;
               3: comp3:=comp3+1;
          else
              writeln ('codigo incorrecto');
          end;
     end;
     writeln ('Hay ', comp1, ' alumno/s con comportamiento 1,  ', comp2, ' alumno/s con comportamiento 2, y ', comp3, ' alumno/s con comportamiento 3');
     readkey;
end.

