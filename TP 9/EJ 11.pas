Program TP9_11;
uses crt;
const
     n=1000;
type
    t_r=record
              titulo:string[50];
              autor:string[60];
              categoria:string[30];
              stock:word;
              precio_unitario:real;
    end;
    t_v=array [1..n] of t_r;
var
   v:t_v;
   l,p,p1,p2,i:word;
   total:real;
procedure inicializar (var vector:t_v; var lim:word);
var i:1..n;
begin
    lim:=0;
    for i:=1 to n do
        with vector[i] do
        begin
             titulo:=' ';
             autor:=' ';
             categoria:=' ';
             stock:=0;
             precio_unitario:=0;
        end;
end;
procedure cargar (var vector:t_v; var lim:word);
var aux:string[50];
begin
     writeln ('Titulo');
     readln (aux);
     while (lim<=n) and (aux<>'z') do
     begin
          inc (lim);
          with vector[lim] do
          begin
               titulo:=aux;
               writeln ('Autor');
               readln (autor);
               writeln ('Categoria');
               readln (categoria);
               writeln ('Stock');
               readln (stock);
               writeln ('Precio unitario');
               readln (precio_unitario);
          end;
          writeln ('Titulo');
          readln (aux);
      end;
end;
procedure ordenar_autor (var vector:t_v; lim:word);
var i,j:word; aux:t_r;
begin
     for i:=1 to lim-1 do
         for j:=1 to lim-i do
             if vector[j].autor > vector[j+1].autor then
             begin
                  aux:=vector[j];
                  vector[j]:=vector[j+1];
                  vector[j+1]:=aux;
             end;
end;
procedure bbin (var vector:t_v; lim:word; var pos:word);
var pri,ult,med:word;
begin
     pri:=1;
     ult:=lim;
     while (pos=0) and (pri<=lim) do
     begin
          med:= (pri+ult) div 2;
          if vector[med].autor = 'agatha cristie' then
          begin
               pos:=med;
          end
          else
              if vector[med].autor < 'agatha cristie' then
              begin
                   pri:=med+1;
              end
              else
                  ult:=med-1;
      end;
end;
procedure agatha (var vector:t_v; lim:word; pos:word; var pos1:word; var pos2:word; var totalstock:real);
begin
     while (pos>1) and (vector[pos-1].autor = 'agatha cristie') do
           dec (pos);
     pos1:=pos;
     while (pos<=lim) and (vector[pos].autor = 'agatha cristie') do
     begin
          with vector[pos] do
               totalstock:= totalstock + (precio_unitario*stock);
          inc (pos);
     end;
     pos2:=pos;
end;
procedure ordenar_autor_cat (var vector:t_v; lim:word);
var i,j:word; aux:t_r;
begin
     for i:=1 to lim-1 do
         for j:=1 to lim-i do
             if (vector[j].categoria+vector[j].autor) > (vector[j+1].categoria+vector[j+1].autor) then
             begin
                  aux:=vector[j];
                  vector[j]:=vector[j+1];
                  vector[j+1]:=aux;
             end;
end;
procedure listar (var vector:t_v; lim:word);
var i:1..n;
begin
     for i:=1 to lim do
         with vector[i] do
              writeln ('Categoria: ', categoria, '; Autor: ', autor, '; Titulo: ', titulo, '; Stock: ', stock, '; Precio unitario: ', precio_unitario:2:2, ' $');
end;
procedure listar_a (var vector:t_v; lim:word);
var i:1..n;
begin
     for i:=1 to lim do
         with vector[i] do
              if ((titulo[1] = 'l') or (titulo[1] = 'L')) and ((titulo[2] = 'a') or (titulo[2] = 'A')) then
                 writeln ('Titulo: ', titulo, '; Categoria: ', categoria, '; Autor: ', autor, '; Stock: ', stock, '; Precio unitario: ', precio_unitario:2:2, ' $');
end;
begin
     inicializar (v,l);
     cargar (v,l);
     ordenar_autor_cat (v,l);
     clrscr;
     listar (v,l);
     ordenar_autor (v,l);
     p:=0;
     bbin (v,l,p);
     if p=0 then
     begin
          writeln ('Agatha Cristie no se encuentra entre los autores ingresados');
     end
     else
         agatha (v,l,p,p1,p2,total);
         writeln ('Libros de la autora Agatha Cristie:');
         for i:=p1 to p2 do
             with v[i] do
                  writeln ('Titulo: ', titulo, '; Categoria: ', categoria, '; Stock: ', stock, '; Precio unitario: ', precio_unitario:2:2, ' $');
         writeln ('Sus libros pertenecen a la categoria ', v[p1].categoria);
         writeln ('El stock valorizado total es de ', total:2:2, ' $');
      writeln ('Libros que empriezan por LA');
      listar_a (v,l);
      readkey;
end.
