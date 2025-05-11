Program EJ22;
uses crt;
var palo,palo1:string [10];
    num,num1:integer;
    cont:word;
begin
     cont:=1;
     writeln ('Ingrese palo de la primera carta');
     readln (palo1);
     writeln ('Ingrese numero de la primera carta');
     readln (num1);
     writeln ('Ingrese palo de la carta siguiente');
     readln (palo);
     writeln ('Ingrese numero de la carta siguiente');
     readln (num);
     while (palo<>palo1) and (num<=num1) do
     begin
          cont:=cont+1;
          writeln ('Ingrese palo de la carta siguiente');
          readln (palo);
          writeln ('Ingrese numero de la carta siguiente');
          readln (num);
     end;
     writeln ('Fue necesario extraer ',cont, ' carta/s del mazo');
     readkey;
end.
