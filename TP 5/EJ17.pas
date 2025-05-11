Program EJ17;
uses crt;
var car:char;
begin
     writeln ('Ingrese caracter');
     readln (car);
     while car<>'#' do
     begin
          if car in'0' to '9' then
             writeln (car);
          writeln ('Ingrese caracter');
          readln (car);
     end;
     readkey;
end.
