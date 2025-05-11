Program EJ20;
uses crt;
var num:integer;
    cont_neg:word;
begin
     cont_neg:=0;
     writeln ('Ingrese numero');
     readln (num);
     while num<>0 do
     begin
          if num<0 then
             cont_neg:=cont_neg+1;
          writeln ('Ingrese numero');
          readln (num);
     end;
     writeln ('La cantidad de numeros negativos es de ', cont_neg);
     readkey;
end.
