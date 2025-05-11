Program EJ25;
uses crt;
var tar:string [10];
    num:integer;
    cont_azul_par,cont_roja_impar,cont_restantes:word;
begin
     writeln ('Ingrese color de tarjeta');
     readln (tar);
     writeln ('Ingrese numero de tarjeta');
     readln (num);
     while tar <> 'blanca' do
     begin
          if (tar='azul') and ((num mod 2)=0) then
          begin
               cont_azul_par:=cont_azul_par+1;
          end
          else
               if (num mod 2) <>0 then
               begin
                    cont_roja_impar:=cont_roja_impar+1;
               end
               else
                   cont_restantes:=cont_restantes+1;
          writeln ('Ingrese color de tarjeta');
          readln (tar);
          writeln ('Ingrese numero de tarjeta');
          readln (num);
     end;
     writeln ('Hay ', cont_azul_par, ' tarjetas de color azul y numero par, ',cont_roja_impar, ' tarjetas de color rojo con numero impar, y ', cont_restantes, ' tarjetas restantes');
     readkey;
end.
