Program TP10_1;
uses crt;
type
    t_reg=record
                 titulo:string[50];
                 autor:string[50];
                 anio:string[4];
                 duracion:string[3];
           end;
var
   disco:t_reg;
procedure inicializar (var d:t_reg);
begin
     with d do
     begin
          titulo:=' ';
          autor:=' ';
          anio:=' ';
          duracion:=' ';
     end;
end;
procedure cargar (var d:t_reg);
begin
     with d do
     begin
          readln (titulo);
          readln (autor);
          readln (anio);
          readln (duracion);
     end;
end;
begin
     inicializar (disco);
     cargar (disco);
end.
