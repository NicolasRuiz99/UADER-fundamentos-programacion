Program EJ21;
uses crt;
var num,suma:integer;
    cont_num:word;
    tecla:char;
begin
     cont_num:=0;
     suma:=0;
     tecla:='s';
     while (tecla<>'n') or (tecla<>'N') do
     begin
          writeln ('Ingrese numero');
          readln (num);
          cont_num:=cont_num+1;
          suma:=suma+num;
          writeln ('Desea continuar?');
          readln (tecla);
     end;
     writeln ('El nro de valores introducidos es de ', cont_num, ' y su suma da ', suma);
     readkey;
end.
