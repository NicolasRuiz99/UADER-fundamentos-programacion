Program EJ13;
uses crt;
var edad,edad1,edad2,edad3,edad4,edad5,nro,prom1,prom2,prom3,prom4,prom5,i:integer;
    sec,sec1,sec2,sec3,sec4,sec5:word;
begin
     for i:=1 to 4000 do
     begin
          writeln ('Ingrese numero de empleado');
          readln (nro);
          writeln ('Ingrese seccion a la que pertenece');
          readln (sec);
          writeln ('Ingrese edad');
          readln (edad);
          case sec of
               1: begin
                       sec1:=sec1+1;
                       edad1:=edad1+edad;
                  end;
               2: begin
                       sec2:=sec2+1;
                       edad2:=edad2+edad;
                  end;
               3: begin
                       sec3:=sec3+1;
                       edad3:=edad3+edad;
                  end;
               4: begin
                       sec4:=sec4+1;
                       edad4:=edad4+edad;
                  end;
               5: begin
                       sec5:=sec5+1;
                       edad5:=edad5+edad;
                  end;
          else
              writeln ('Seccion incorrecta');
          end;
     end;
     prom1:=edad1 div sec1;
     prom2:=edad2 div sec2;
     prom3:=edad3 div sec3;
     prom4:=edad4 div sec4;
     prom5:=edad5 div sec5;
     writeln ('Hay ', sec1, ' empleados en la seccion 1 con un promedio de edad de ', prom1);
     writeln ('Hay ', sec2, ' empleados en la seccion 2 con un promedio de edad de ', prom2);
     writeln ('Hay ', sec3, ' empleados en la seccion 3 con un promedio de edad de ', prom3);
     writeln ('Hay ', sec4, ' empleados en la seccion 4 con un promedio de edad de ', prom4);
     writeln ('Hay ', sec5, ' empleados en la seccion 5 con un promedio de edad de ', prom5);
     readkey;
end.
