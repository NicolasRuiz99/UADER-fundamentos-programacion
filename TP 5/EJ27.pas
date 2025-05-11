Program EJ27;
uses crt;
var precio_prod,total_pago:real;
    cont_prod:word;
begin
     writeln ('Ingrese el precio del producto');
     readln (precio_prod);
     while precio_prod <> 0 do
     begin
          cont_prod:=cont_prod+1;
          total_pago:=total_pago+precio_prod;
          writeln ('Ingrese el precio del producto');
          readln (precio_prod);
     end;
     writeln ('La cantidad de articulos comprados es de ', cont_prod);
     writeln ('El total a pagar es de ', total_pago:3:2 , ' $');
     readkey;
end.
