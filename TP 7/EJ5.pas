Program TP7_5;
uses crt;
const n=10;
type
    t_vector=array [1..n] of real;
var
   v:t_vector;
   p,c,ng:word;
procedure inicializar (var vector:t_vector);
var i:1..n;
begin
     for i:=1 to n do
         vector[i]:=0;
end;
procedure cargar (var vector:t_vector);
var i:1..n;
begin
     for i:=1 to n do
         readln (vector[i]);
end;
procedure comp (var vector:t_vector; var pos:word; var cer:word; var neg:word);
var i:1..n;
begin
     pos:=0;
     cer:=0;
     neg:=0;
     for i:=1 to n do
     begin
         if vector[i] > 0 then
         begin
            inc(pos);
         end
         else
             if vector[i] = 0 then
             begin
                  inc(cer);
             end
             else
                 inc(neg);
     end;
end;
begin
     inicializar (v);
     cargar (v);
     comp (v,p,c,ng);
     if  p=10 then
     begin
          writeln ('El vector tiene todas sus componentes positivas');
     end
     else
         if ng>0 then
            writeln ('El vector tiene componentes negativas');
         if c>0 then
            writeln ('El vector tiene algun cero');
     readkey;
end.
