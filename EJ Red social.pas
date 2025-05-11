//Se tienen los datos de los seguidores de una red social, de c/u se ingresa edad, pag. que le gusta (suponer una por usuario) y ocupacion. Se pide determinar:
//A. Cant de seguidores por rango etario (menor a 13, de 13 a 18, o de 19 a 25) y cual tiene mayor representatividad en la red
//B. Cant de seguidores de la pag. Pythonizame
//C. Porcentaje de estudiantes
Program EJ_RedSocial;
uses crt;
const
     n=100000;
type
    t_seg= record
           edad:word;
           pag:string[50];
           ocupacion:string[30];
    end;
    t_v= array [1..n] of t_seg;
var
   v:t_v;
   l:byte;
   m13,d1318,d1925,m:word;
procedure inicializar (var vector:t_v; var lim:byte);
var i:1..n;
begin
     lim:=0;
     for i:=1 to n do
     begin
          with vector[i] do
          begin
               edad:=0;
               pag:=' ';
               ocupacion:=' ';
          end;
     end;
end;
procedure cargar (var vector:t_v; var lim:byte);
var aux:word;
begin
     writeln ('Edad');
     readln (aux);
     while (lim<n) and (aux<>0) do
     begin
          inc (lim);
          with vector[lim] do
          begin
               edad:=aux;
               writeln ('Pagina preferida');
               readln (pag);
               writeln ('Ocupacion');
               readln (ocupacion);
          end;
          writeln ('Edad');
          readln (aux);
     end;
end;
procedure rango (var vector:t_v; lim:byte; var menor13:word; var de13a18:word; var de19a25:word; var mayor:word);
var i:1..n; resto:word;
begin
     resto:=0;
     menor13:=0;
     de13a18:=0;
     de19a25:=0;
     for i:=1 to lim do
     begin
          if vector[i].edad < 13 then
          begin
               inc (menor13);
          end
          else
              if (vector[i].edad >= 13) and (vector[i].edad <= 18) then
              begin
                   inc (de13a18);
              end
              else
                  if (vector[i].edad >= 19) and (vector[i].edad <=25) then
                  begin
                     inc (de19a25);
                  end
                  else
                      inc (resto);
     end;
     if (menor13>de13a18) and (menor13>de19a25) and (menor13>resto) then
     begin
          mayor:=0;
     end
     else
         if (de13a18>de19a25) and (de13a18>resto) then
         begin
              mayor:=1;
         end
         else
             if de19a25>resto then
             begin
                  mayor:=2;
             end
             else
                 mayor:=3;
end;
function python (var vector:t_v; lim:byte):word;
var i:1..n; aux:word;
begin
     aux:=0;
     for i:=1 to lim do
     if (vector[i].pag = 'pythonizame') or (vector[i].pag = 'Pythonizame') then
        inc(aux);
     Python:=aux;
end;
function est (var vector:t_v; lim:byte):word;
var i:1..n; aux:word;
begin
     aux:=0;
     for i:=1 to lim do
     if (vector[i].ocupacion = 'estudiante') or (vector[i].ocupacion = 'Estudiante') then
        inc(aux);
        est:=(aux*100) div lim;
end;
begin
     inicializar (v,l);
     cargar (v,l);
     rango (v,l,m13,d1318,d1925,m);
     writeln ('Hay ', m13, ' seguidores con menos de 13 anios');
     writeln ('Hay ', d1318, ' seguidores entre 13 y 18 anios');
     writeln ('Hay ', d1925, ' seguidores entre 19 y 25 anios');
     case m of
          0:writeln ('El rango de edad con mayor representatividad en la red es el de menor de 13 anios');
          1:writeln ('El rango de edad con mayor representatividad en la red es el de entre 13 y 18 anios');
          2:writeln ('El rango de edad con mayor representatividad en la red es el de entre 19 y 25 anios');
          3:writeln ('Ninguno de los rangos de edad es representativo en la red');
     end;
     writeln ('Hay ', python (v,l), ' seguidores de la pagina Pythonizame');
     writeln ('Hay un ', est (v,l), ' % de estudiantes');
     readkey;
end.
