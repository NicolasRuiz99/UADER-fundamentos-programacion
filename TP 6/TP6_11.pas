Program TP6_11;
uses crt;
var u,r:integer;
    pr,mon:real;
procedure desc (unidad:integer; precio:real; var res:integer; var monto:real);
begin
     monto:= unidad*precio;
     if (monto >= 1000) and (monto < 10000) then
     begin
        res:=20;
     end
     else
         if monto >= 10000 then
         begin
              res:=50;
         end
         else
             res:=0;
end;
begin
writeln ('Ingrese las unidades que desea comprar');
readln (u);
writeln ('Ingrese el precio que desea pagar');
readln (pr);
clrscr;
desc (u,pr,r,mon);
writeln ('Su monto total es de ', mon:2:2, ' $');
case r of
     0: writeln ('No se le aplicara un descuento a su compra');
     20: writeln ('Se le aplicara un 20% de descuento a su compra, por lo que quedara en ', mon - ((mon*20)/100):2:2, ' $');
     50: writeln ('Se le aplicara un 50% de descuento a su compra, por lo que quedara en ', mon - ((mon*50)/100):2:2, ' $');
end;
readkey;
end.
