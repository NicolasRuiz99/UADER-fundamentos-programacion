Program EJ18;
uses crt;
var num,mayor:integer;
    cont_neg: word;
begin
     cont_neg:=0;
     writeln ('Ingrese numero');
     readln (num);
     mayor:=num;
     while num<>0 do
     begin
          if num<0 then
             cont_neg:=cont_neg+1;
          if num>mayor then
             mayor:=num;
          writeln ('Ingrese numero');
          readln (num);
     end;
     writeln ('El mayor numero es ', mayor, ' y la cantidad de numeros negativos es de ', cont_neg);
     readkey;
end.
