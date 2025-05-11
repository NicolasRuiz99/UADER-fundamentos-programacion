Program TP9_9;
uses crt;
const
     n=1000;
type
    t_p=record
              nombre:string[50];
              nro_asiento:word;
              monto_pasaje:real;
              destino:string[60];
    end;
    t_v=array [1..n] of t_p;
var
   v:t_v;
   l,p,cant:word;
   busc:string[60];
procedure inicializar (var vector:t_v; var lim:word);
var i:1..n;
begin
     for i:=1 to n do
         with vector[i] do
         begin
              nombre:=' ';
              nro_asiento:=0;
              monto_pasaje:=0;
              destino:=' ';
         end;
     lim:=0;
end;
procedure cargar (var vector:t_v; var lim:word);
var aux:string[50];
begin
     writeln ('Nombre del pasajero');
     readln (aux);
     while (lim<n) and (aux<>'z') do
     begin
          inc (lim);
          with vector[lim] do
          begin
               nombre:=aux;
               writeln ('Nro de asiento');
               readln (nro_asiento);
               writeln ('Monto del pasaje');
               readln (monto_pasaje);
               writeln ('Destino');
               readln (destino);
          end;
          writeln ('Nombre del pasajero');
          readln (aux);
     end;
end;
procedure listar (var vector:t_v; lim:word);
var i:word;
begin
     for i:=1 to lim do
         with vector[i] do
              writeln ('Nro de asiento: ', nro_asiento, '; Nombre: ', nombre, '; Monto del pasaje: ', monto_pasaje:2:2, ' $; Destino: ', destino);
end;
procedure ordenar_asiento (var vector:t_v; lim:word);
var i,j:word; aux:t_p;
begin
     for i:=1 to lim-1 do
         for j:=1 to lim-i do
             if vector[j].nro_asiento > vector[j+1].nro_asiento then
             begin
                  aux:=vector[j];
                  vector[j]:=vector[j+1];
                  vector[j+1]:=aux;
             end;
end;
procedure ordenar_destino (var vector:t_v; lim:word);
var i,j:1..n; aux:t_p;
begin
     for i:=1 to lim-1 do
         for j:=1 to lim-i do
             if vector[j].destino > vector[j+1].destino then
             begin
                  aux:=vector[j];
                  vector[j]:=vector[j+1];
                  vector[j+1]:=aux;
             end;
end;
function monto_total (var vector:t_v; lim:word):real;
var i:1..n; ac:real;
begin
     ac:=0;
     for i:=1 to lim do
         ac:=ac+vector[i].monto_pasaje;
     monto_total:=ac;
end;
procedure bbin (var vector:t_v; lim:word; var pos:word; buscado:string[60]);
var pri,ult,med:word;
begin
     pri:=1;
     ult:=lim;
     while (pos=0) and (pri<=ult) do
     begin
          med:=(pri+ult) div 2;
          if vector[med].destino = buscado then
          begin
               pos:=med;
          end
          else
          begin
               if vector[med].destino < buscado then
               begin
                    pri:=med+1;
               end
               else
                   ult:=med-1;
          end;
      end;
end;
procedure cant_personas (var vector:t_v; lim:word; pos:word; var cantidad:word);
var buscado:string[60];
begin
     buscado:=vector[pos].destino;
     while (pos>1) and (vector[pos-1].destino = buscado) do
           dec (pos);
     while (pos<=lim) and (vector[pos].destino = buscado) do
     begin
          inc (cantidad);
          inc (pos);
     end;
end;
begin
     inicializar (v,l);
     cargar (v,l);
     ordenar_asiento (v,l);
     clrscr;
     listar (v,l);
     writeln ('El monto total de pasajes vendidos es de ', monto_total (v,l):2:2, ' $');
     writeln ('Ingrese una ciudad destino');
     readln (busc);
     p:=0;
     ordenar_destino (v,l);
     bbin (v,l,p,busc);
     cant_personas (v,l,p,cant);
     writeln ('Hay ', cant, ' de personas dirigidas a la ciudad ', busc);
     readkey;
end.
