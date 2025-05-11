Program TP7_14;
uses crt;
const
     n=1000;
type
    t_v=array [1..n] of char;
var
   vA,vB,vC:t_v;
   lA,lB,lC:word;
procedure inicializar (var vector:t_v);
var i:1..n;
begin
     for i:=1 to n do
         vector[i]:=' ';
end;
procedure cargar (var vector:t_v; var lim:word);
var aux:char;
begin
     readln (aux);
     while (aux<>'z') and (lim<n) do
     begin
          inc (lim);
          vector[lim]:=aux;
          readln (aux);
     end;
end;
procedure sumar (var vectorA:t_v; var vectorB:t_v; var vectorC:t_v; limA:word; limB:word; var limC:word);
var i:integer;
begin
     for i:=1 to limA do
         vectorC[i]:=vectorA[i];
     limC:=limA+limB;
     for i:= (limA+1) to limC do
         vectorC[i]:=vectorB[i-limA];
end;
procedure mostrar (var vector:t_v; lim:word);
var i:integer;
begin
     for i:=1 to lim do
         writeln (vector[i]);
end;
procedure ordenar (var vector:t_v; lim:word);
var i,j:integer; aux:char;
begin
     for i :=lim downto 2 do
        for j := 0 to i - 1 do
            if vector[j] > vector[j + 1] then
            begin
                aux := vector[j];
                vector[j] := vector[j + 1];
                vector[j + 1] := aux;
            end;
end;
begin
     lA:=0;
     lB:=0;
     lC:=0;
     inicializar (vA);
     inicializar (vB);
     inicializar (vC);
     writeln ('Vector A');
     cargar (vA,lA);
     writeln ('Vector B');
     cargar (vB,lB);
     sumar (vA,vB,vC,lA,lB,lC);
     ordenar (vC,lC);
     writeln ('Vector C');
     mostrar (vC,lC);
     readkey;
end.
