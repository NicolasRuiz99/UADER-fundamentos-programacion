program p;
uses crt;
const
n = 200;
type
t_vector = Array[1..n] of string;
var
limite:word;
cadena:string;
vector_caracteres:t_vector;
vector_palabras:t_vector;
num_palabras:word;
cant_de_palabras_10_letras:word;
porcentaje_palabras_10_letras:real;
contador_a:word;
contador_e:word;
contador_i:word;
contador_o:word;
contador_u:word;
porcentaje_espacios_en_blanco:real;
 
procedure inicializar(var v:t_vector);
var
i:integer;
begin
for i:= 1 to n do
    v[i]:= '';
end;
 
procedure cargar(var limit:word;cad:string;var v:t_vector);
begin
limit:=0;
while ((limit<n) and (v[limit] <> '.')) do
begin
     inc(limit);
     v[limit]:= copy(cad, limit, 1);
end;
end;
 
procedure mostrar(var v:t_vector; limit:word);
var
i:integer;
begin
for i:= 1 to limit do
    writeln(v[i]);
end;
 
 
procedure caracteres_a_palabras(var vector_c:t_vector; var vector_p:t_vector; limit:word; var numero_palabras:word);
var
i:integer;
palabra:string;
begin
     numero_palabras:= 0;
     palabra:= '';
     for i:= 1 to limit do
     begin
          if ((vector_c[i] = ' ') or (vector_c[i] = '.')) then
          begin
             inc(numero_palabras);
             vector_p[numero_palabras]:= palabra;
             palabra:= '';
          end
          else
          palabra:= palabra + vector_c[i];
     end;
end;
 
procedure mas_de_10_letras(var vector_p:t_vector; numero_palabras:word; var cant_10:word; var porc_10:real);
var
i:word;
begin
     cant_10:= 0;
     for i:= 1 to numero_palabras do
     begin
          if (length(vector_p[i]) > 10) then
             inc(cant_10);
     end;
     porc_10:= ((cant_10 * 100) div numero_palabras);
end;
 
procedure vocales(vector_c:t_vector; limit:word; var cont_a:word; var cont_e:word; var cont_i:word; var cont_o:word; var cont_u:word);
var
i:word;
begin
for i:= 1 to limit do
     begin
 
          if vector_c[i] = 'a' then
             inc(cont_a)
          else
          if vector_c[i] = 'e' then
             inc(cont_e)
          else
          if vector_c[i] = 'i' then
             inc(cont_i)
          else
          if vector_c[i] = 'o' then
             inc(cont_o)
          else
          if vector_c[i] = 'u' then
             inc(cont_u)
 
     end;
end;
 
procedure espacios_en_blanco(vector_c:t_vector; limit:word; var porc_blanco:real);
var
i:word;
contador_espacios_en_blanco:word;
begin
contador_espacios_en_blanco:= 0;
for i:= 1 to limit do
     begin
          if vector_c[i] = ' ' then
             inc(contador_espacios_en_blanco)
     end;
     porc_blanco:= ((contador_espacios_en_blanco * 100) div limit)
end;
 
BEGIN
 
 
readln(cadena);
inicializar(vector_caracteres);
inicializar(vector_palabras);
cargar(limite, cadena, vector_caracteres);
caracteres_a_palabras(vector_caracteres, vector_palabras, limite, num_palabras);
mas_de_10_letras(vector_palabras, num_palabras, cant_de_palabras_10_letras, porcentaje_palabras_10_letras);
vocales(vector_caracteres, limite, contador_a, contador_e, contador_i, contador_o, contador_u);
espacios_en_blanco(vector_caracteres, limite, porcentaje_espacios_en_blanco);
mostrar(vector_palabras, num_palabras);
writeln('La cantidad de palabras con mas de 10 letras son: ', cant_de_palabras_10_letras, ' y representan el ', porcentaje_palabras_10_letras:3:2, '% del total de palabras');
writeln('A: ', contador_a, ' E: ', contador_e, ' I: ', contador_i, ' O: ', contador_o, ' U: ', contador_u);
writeln('La cantidad de espacios en blanco representa el ', porcentaje_espacios_en_blanco:3:2, '% del total de caracteres');
readkey;
END.
