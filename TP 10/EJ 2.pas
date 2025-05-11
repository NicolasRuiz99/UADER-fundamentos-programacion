Program TP10_2;
uses crt;
type
    t_reg=record
                 marca:string[15];
                 modelo:string[50];
                 anio:string[4];
                 color:string[20];
                 nrop:string[2];
                 precio:string[20];
           end;
var
   auto:t_reg;
procedure inicializar (var a:t_reg);
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
procedure cargar (var a:t_reg);
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
begin
     inicializar (auto);
     cargar (auto);
end.
