Program EJ9;
uses crt;
var i,nro,cont15,cont25_45,cont50:integer;
begin
     for i:=1 to 100 do
     begin
          writeln ('Ingrese numero');
          read (nro);
          if nro>0 then
          begin
               if nro>15 then
               begin
                    cont15:=cont15+1;
                    if (nro>25) and (nro<45) then
                    begin
                         cont25_45:=cont25_45+1;
                    end
                    else
                    begin
                         if nro >50 then
                            cont50:=cont50+1;
                    end
               end
               else
                   writeln ('Numero no natural');
               end;
      end;
      writeln ('Hay ', cont50, ' numero/s mayores a 50');
      writeln ('Hay ', cont25_45, ' numero/s entre 25 y 45');
      writeln ('Hay ', cont15, ' numero/s mayores a 15');
      readkey;
end.
