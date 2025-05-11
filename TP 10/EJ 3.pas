Program TP10_1;
uses crt;
type
    t_r1=record
                 titulo:string[50];
                 autor:string[50];
                 anio:string[4];
                 duracion:string[3];
           end;
    t_r2=record
                 marca:string[15];
                 modelo:string[50];
                 anio:string[4];
                 color:string[20];
                 nrop:string[2];
                 precio:string[20];
           end;
var
   disco:t_r1;
   auto:t_r2;
procedure inicializar1 (var d:t_r1);
begin
     with d do
     begin
          titulo:=' ';
          autor:=' ';
          anio:=' ';
          duracion:=' ';
     end;
end;
procedure inicializar2 (var a:t_r2);
begin
     with a do
     begin
          marca:=' ';
          modelo:=' ';
          anio:=' ';
          color:=' ';
          nrop:=' ';
          precio:=' ';
     end;
end;
procedure cargar1 (var d:t_r1);
begin
     with d do
     begin
          readln (titulo);
          readln (autor);
          readln (anio);
          readln (duracion);
     end;
end;
procedure cargar2 (var a:t_r2);
begin
     with a do
     begin
          readln (marca);
          readln (modelo);
          readln (anio);
          readln (color);
          readln (nrop);
          readln (precio);
     end;
end;
procedure mostrar1 (var d:t_r1);
begin
     writeln ('Disco');
     with d do
     begin
          writeln ('Titulo: ', titulo);
          writeln ('Autor: ', autor);
          writeln ('Anio: ', anio);
          writeln ('Duracion: ', duracion, ' seg.');
     end;
end;
procedure mostrar2 (var a:t_r2);
begin
     writeln ('Automovil');
     with a do
     begin
          writeln ('Marca: ', marca);
          writeln ('Modelo: ', modelo);
          writeln ('Anio: ', anio);
          writeln ('Color: ', color);
          writeln ('Numero de puertas: ', nrop);
          writeln ('Precio: ', precio, ' $');
     end;
end;
begin
     inicializar1 (disco);
     inicializar2 (auto);
     cargar1 (disco);
     cargar2 (auto);
     clrscr;
     mostrar1 (disco);
     mostrar2 (auto);
     readkey;
end.

