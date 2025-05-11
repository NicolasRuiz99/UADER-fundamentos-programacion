Program EJ19;
uses crt;
var car,caresp:char;
    cont_car:word;
begin
     cont_car:=0;
     writeln ('Ingrese caracter');
     readln (car);
     writeln ('Ingrese caracter especial');
     readln (caresp);
     while car<> '.' do
     begin
          if car=caresp then
             cont_car:=cont_car+1;
          writeln ('Ingrese caracter');
          readln (car);
     end;
     writeln ('El caracter ', caresp, ' ha aparecido ', cont_car, ' veces');
     readkey;
end.
