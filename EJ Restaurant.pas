//Se tienen los datos de los consumos de un restaurant por mesa de un determinado dia. Para cada mesa se lee: nro de mesa, mozo, cant, desripcion, precio unitario, subtotal y precio total
//Se pide:
//A. Mozo con mayor recaudacion en el dia
//B. Total recaudado por mesa
//C. Total recaudado por el restaurnat en el dia
//D. Emitir ticket por mesa que incluya total, precio unitario y subtotal por articulo
//E. Mostrar la cant de gaseosas en el dia
//rsosazitto@yahoo.com.ar

Program RES;
uses crt;
var precio_unitario,subtotal,total,totaldia,rec_A,rec_B,rec_C:real;
    cant_gaseosa,nro_mesa,cant:word;
    des:string [50];
    tecla,mozo:char;
begin
     totaldia:=0;
     cant_gaseosa:=0;
     rec_A:=0;
     rec_B:=0;
     rec_C:=0;
     nro_mesa:=1;
     while nro_mesa<>0 do
     begin
          total:=0;
          writeln ('Para finalizar ingrese el 0 como nro de mesa');
          writeln ('Ingrese mozo que atiende a la mesa');
          readln (mozo);
          clrscr;
          tecla:='s';
          while tecla<> 'n' do
          begin
               writeln ('Para finalizar ingrese la tecla n ');
               writeln ('Ingrese descripcion del item');
               readln (des);
               clrscr;
               writeln ('Ingrese cantidad del mismo');
               read (cant);
               clrscr;
               writeln ('Ingrese precio unitario');
               readln (precio_unitario);
               clrscr;
               subtotal:=cant*precio_unitario;
               total:=total+subtotal;
               case mozo of
                    'A':rec_A:=rec_A+total;
                    'B':rec_B:=rec_B+total;
                    'C':rec_C:=rec_C+total;
               end;
               if des = 'gaseosa' then
                  cant_gaseosa:=cant_gaseosa+cant;
               gotoxy (3,3);
               writeln ('[Descripcion]: ', des);
               gotoxy (3,4);
               writeln ('[Cantidad]: ', cant);
               gotoxy (3,5);
               writeln ('[Precio Unitario]: ', precio_unitario:4:2, ' $');
               gotoxy (3,6);
               writeln ('[Subtotal]: ', subtotal:4:2, ' $');
               gotoxy (3,7);
               writeln ('[Total]: ', total:4:2, ' $');
               writeln ('Para continuar ingrese una tecla');
               readln (tecla);
               clrscr;
          end;
          totaldia:=totaldia+total;
          writeln ('El total recaudado por la mesa es de ', total:4:2, ' $');
          writeln ('Ingrese nro de mesa');
          readln (nro_mesa);
          clrscr;
    end;
    if (rec_A > rec_B) and (rec_A > rec_C) then
    begin
       writeln ('El mozo con mas recaudacion del dia es el A ');
    end
    else
        if rec_B > rec_C then
        begin
             writeln ('El mozo con mas recaudacion del dia es el B');
        end
        else
            writeln ('El mozo con mas recaudacion del dia es el C');
   writeln ('El total recaudado en el dia por el restaurante es de ', totaldia:4:2, ' $');
   writeln ('La cantidad de gaseosas en el dia es de ', cant_gaseosa);
   readkey;
end.
