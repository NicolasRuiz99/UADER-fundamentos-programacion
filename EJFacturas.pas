//Se pide:
//A. Procesar vector docs de la sig forma: tomar c/doc, buscar cliente en el v. clientes, si existe actualizar sino cargarlo.
//B. Listado ordenado p/sucursal de todos los clientes
//C. Dada una sucursal mostrar todos los clientes con todos sus datos ordenados alfabeticamente
Program EJFacturas;
uses crt;
const
     n=1000;
type
    t_r1=record
               apynom:string[40];
               nro_doc:word;
               tipo_doc:string[2];
               saldo:real;
               sucursal:word[0..3];
    end;
    t_r2=record
               apynom:string[40];
               sucursal:word[0..3];
               saldo:real;
    end;
    t_v1=array [1..n] of t_r1;
    t_v2=array [1..n] of t_r2;
var
   docs:t_v1;
   clientes:t_v2;
   l1,l2:word;
procedure inicializar (var vector:t_v1; var vector2:t_v2; var lim:word);
var i:1..n;
begin
     lim:=0;
     for i:=1 to n
     begin
          with vector[i] do
          begin
               apynom:=' ';
               nro_doc:=0;
               tipo_doc:=' ';
               saldo:=0;
               sucursal:=0;
          end;
          with vector2[i] do
          begin
               apynom:=' ';
               sucursal:=0;
               saldo:=0;
          end;
     end;
end;
procedure cargar (var vector1:t_v1; var vector2:t_v2; var lim1:word; var lim2:word);
var aux:string[40];
begin
     writeln ('Clientes:');
     writeln ('Apellido y nombre);
     readln (aux);
     while (lim2<n) and (aux<>'z') do
     begin
          inc (lim2);
          with vector2[lim2] do
          begin
               apynom:=aux;
               writeln ('Sucursal');
               readln (sucursal);
               writeln ('Saldo');
               readln (saldo);
          end;
          writeln ('Apellido y nombre');
          readln (aux);
     end;
     writeln ('Documentos:');
     writeln ('Apellido y nombre);
     readln (aux);
     while (lim1<n) and (aux<>'z') do
     begin
          inc (lim1);
          with vector1[lim1] do
          begin
               apynom:=aux;
               writeln ('Nro de doc');
               readln (nro_doc);
               writeln ('Tipo de doc');
               readln (tipo_doc);
               writeln ('Saldo');
               readln (saldo);
               writeln ('Sucursal');
               readln (sucursal);
          end;
          writeln ('Apellido y nombre');
          readln (aux);
     end;
end;
procedure ordenar1 (var vector:t_v2; lim:word);
var i,j:byte;
begin
     for i:=1 to lim-1 do
         for j:=1 to lim-i do
             if vector[j].sucursal > vector.sucursal[j+1] then
             begin
                  aux:=vector[j];
                  vector[j]:=vector[j+1];
                  vector[j+1]:=aux;
             end;
end;
procedure ordenar2 (var vector:t_v2; lim:word);
var i,j:byte;
begin
     for i:=1 to lim-1 do
         for j:=1 to lim-i do
             if (vector[j].sucursal+vector[j].apynom) > (vector.sucursal[j+1]+vector[j+1].apynom) then
             begin
                  aux:=vector[j];
                  vector[j]:=vector[j+1];
                  vector[j+1]:=aux;
             end;
end;
begin

end.
