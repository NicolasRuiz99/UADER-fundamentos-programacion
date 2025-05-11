//Cargar dos vectores A y B de 45 elementos c/u
//A. Sumar el elemento 1 del vector A con el elemento 1 del B y asi sucesivamente almacenando el resultado en un vector C
//B. Ordenar y mostrar el vector C
//C. Solicitar al usuario que ingrese un buscado y en base a ese le devuelva un mensaje si existe o no en la lista. Mostrar la posicion.
Program EJVectores1;
uses crt;
const
     n=10;
type
    t_v=array [1..n] of integer;
var
   A,B,C:t_v;
   busc:integer;
procedure inicializar (var vector:t_v);
var i:1..n;
begin
     for i:=1 to n do
         vector[i]:=0;
end;
procedure cargar (var vector:t_v);
var i:1..n;
begin
     for i:=1 to n do
         readln (vector[i]);
end;
procedure sumar (var vA:t_v; var vB:t_v; var vC:t_v);
var i:1..n;
begin
     for i:=1 to n do
         vC[i]:= vA[i]+vB[i];
end;
procedure ordenar (var vector:t_v);
var i,aux:integer; orden:boolean;
begin
     orden:=false;
     while not (orden) do
     begin
          orden:=true;
          for i:=1 to (n-1) do
          begin
               if vector[i]>vector[i+1] then
               begin
                    orden:=false;
                    aux:=vector[i];
                    vector[i]:=vector[i+1];
                    vector[i+1]:=aux;
               end;
          end;
     end;
end;
procedure mostrar (var vector:t_v);
var i:1..n;
begin
     for i:=1 to n do
         writeln (vector[i]);
end;
function buscar (var vector:t_v; buscado:integer):integer;
var pos:integer;
begin
     buscar:=0;
     pos:=0;
     while (buscar=0) and (pos<n) do
     begin
          inc (pos);
          if buscado = vector[pos] then
             buscar:=pos;
     end;
end;

begin
     inicializar (A);
     inicializar (B);
     inicializar (C);
     writeln ('Vector A');
     cargar (A);
     writeln ('Vector B');
     cargar (B);
     sumar (A,B,C);
     ordenar (C);
     writeln ('Vector C');
     mostrar (C);
     writeln ('Ingrese un nro entero para buscar');
     readln (busc);
     if buscar(C,busc) <> 0 then
     begin
          writeln ('El nro ', busc, ' existe y se encuentra en la posicion ', buscar(C,busc));
     end
     else
         writeln ('El nro ', busc, ' no existe ');
     readkey;
end.
