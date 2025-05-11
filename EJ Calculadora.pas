Program Calculadora;
uses crt;
var n1,n2,r:real;
    nro:integer;
    tecla:string[1];
    error:byte;
procedure suma (nro1:real;nro2:real; var res:real);
begin
     res:=nro1+nro2;
end;
procedure resta (nro1:real;nro2:real; var res:real);
begin
     res:=nro1-nro2;
end;
procedure mult (nro1:real;nro2:real; var res:real);
begin
     res:=nro1*nro2;
end;
procedure division (nro1:real;nro2:real; var res:real);
begin
     res:=nro1/nro2;
end;
begin
     textcolor (yellow);
     textbackground (blue);
     clrscr;
     tecla:='s';
     while tecla <> 'n' do
     begin
           error:=0;
           gotoxy (5,4);
           writeln ('=========================');
           gotoxy (5,5);
           writeln ('[1..... Para SUMAR      ]');
           gotoxy (5,6);
           writeln ('[2..... Para RESTAR     ]');
           gotoxy (5,7);
           writeln ('[3..... Para MULTIPLICAR]');
           gotoxy (5,8);
           writeln ('[4..... Para DIVIDIR    ]');
           gotoxy (5,9);
           writeln ('=========================');
           readln (nro);
           clrscr;
           case nro of
                1:begin
                gotoxy (5,4);
                writeln ('===============');
                gotoxy (5,5);
                writeln ('[Ingrese nro 1]');
                gotoxy (5,6);
                writeln ('[');
                gotoxy (19,6);
                writeln (']');
                gotoxy (6,6);
                readln (n1);
                gotoxy (5,7);
                writeln ('[Ingrese nro 2]');
                gotoxy (5,8);
                writeln ('[');
                gotoxy (19,8);
                writeln (']');
                gotoxy (6,8);
                readln (n2);
                gotoxy (5,9);
                writeln ('===============');
                suma (n1,n2,r);
                end;
                2:begin
                gotoxy (5,4);
                writeln ('===============');
                gotoxy (5,5);
                writeln ('[Ingrese nro 1]');
                gotoxy (5,6);
                writeln ('[');
                gotoxy (19,6);
                writeln (']');
                gotoxy (6,6);
                readln (n1);
                gotoxy (5,7);
                writeln ('[Ingrese nro 2]');
                gotoxy (5,8);
                writeln ('[');
                gotoxy (19,8);
                writeln (']');
                gotoxy (6,8);
                readln (n2);
                gotoxy (5,9);
                writeln ('===============');
                resta (n1,n2,r);
                end;
                3:begin
                gotoxy (5,4);
                writeln ('===============');
                gotoxy (5,5);
                writeln ('[Ingrese nro 1]');
                gotoxy (5,6);
                writeln ('[');
                gotoxy (19,6);
                writeln (']');
                gotoxy (6,6);
                readln (n1);
                gotoxy (5,7);
                writeln ('[Ingrese nro 2]');
                gotoxy (5,8);
                writeln ('[');
                gotoxy (19,8);
                writeln (']');
                gotoxy (6,8);
                readln (n2);
                gotoxy (5,9);
                writeln ('===============');
                mult (n1,n2,r);
                end;
                4:begin
                gotoxy (5,4);
                writeln ('===============');
                gotoxy (5,5);
                writeln ('[Ingrese nro 1]');
                gotoxy (5,6);
                writeln ('[');
                gotoxy (19,6);
                writeln (']');
                gotoxy (6,6);
                readln (n1);
                gotoxy (5,7);
                writeln ('[Ingrese nro 2]');
                gotoxy (5,8);
                writeln ('[');
                gotoxy (19,8);
                writeln (']');
                gotoxy (6,8);
                readln (n2);
                gotoxy (5,9);
                writeln ('===============');
                if n2 <> 0 then
                begin
                     division (n1,n2,r);
                end
                else
                    error:=1;
                end;
           end;
           clrscr;
           case error of
                0:begin
                gotoxy (5,4);
                writeln ('====================================================');
                gotoxy (56,5);
                writeln (']');
                gotoxy (5,5);
                writeln ('[El resultado es: ', r:2:2);
                gotoxy (5,6);
                writeln ('[Para continuar presione enter, para finalizar la n]');
                gotoxy (5,7);
                writeln ('====================================================');
                readln (tecla);
                clrscr;
                end;
                1:begin
                gotoxy (5,4);
                writeln ('====================================================');
                gotoxy (5,5);
                writeln ('[ERROR: Division por 0                             ]');
                gotoxy (5,6);
                writeln ('[Para continuar presione enter, para finalizar la n]');
                gotoxy (5,7);
                writeln ('====================================================');
                readln (tecla);
                clrscr;
                end;
           end;
     end;
end.
