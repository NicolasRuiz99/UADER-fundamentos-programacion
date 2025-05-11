Program ej26;
uses crt;
var nro, nro_final:integer;
    cont_total,cont_multiplo5,cont_pares_menor_nfinal:word;
begin
     writeln ('Ingrese un nro');
     readln (nro);
     writeln ('Ingrese nro final');
     readln (nro_final);
     while (nro <> nro_final) and (nro > 0) do
     begin
          cont_total:= cont_total+1;
          if (nro mod 2=0) and (nro < nro_final) then
          begin
               cont_pares_menor_nfinal:= cont_pares_menor_nfinal+1;
               if nro mod 5=0 then
                  cont_multiplo5:=cont_multiplo5+1;
          end;
          writeln ('Ingrese un nro');
          readln (nro);
     end;
     writeln ('Hubo ', cont_pares_menor_nfinal, ' numeros pares menores que ', nro_final);
     writeln (cont_multiplo5, ' son numeros pares menores que ', nro_final, ' multiplos de 5');
     writeln ('Hay un ', ((cont_multiplo5*100) div cont_pares_menor_nfinal), ' % de multiplos de 5 sobre el total de nros pares');
     writeln ('Hay un ', ((cont_multiplo5*100) div cont_total), ' % de multiplos de 5 sobre el total de nros');
     writeln ('Hay un ', ((cont_pares_menor_nfinal*100) div cont_total), ' % de nros pares sobre el total de nros');
     readkey;
end.
