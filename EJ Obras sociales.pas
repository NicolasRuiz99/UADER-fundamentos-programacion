//Se tienen las obras sociales de la provincia de Entre Rios y de c/u se tiene el listado de afiliados.
//De c/afiliado se lee nombre y apellido, edad y año de ingreso.
//Se pide:
//A. Total de obras sociales
//B. Total de afiliados por obra social
//C. Promedio de edad de afiliados por obra social
//D. Afiliado mas antiguo por obra social, mostrar todos sus datos
//E. Obra social con mayor cant de afiliados y % que representan el total

Program OS;
uses crt;
var obrasocial,nombreapellido,nombreapellido_antiguo,max_obrasocial:string;
    cont_obrasocial,nro_obrasocial,edad,anioingreso,cant_afiliados,edad_antiguo,anioingreso_antiguo,i,ac_edad,total_afiliados,max_afiliados:integer;
begin
     cont_obrasocial:=0;
     nro_obrasocial:=1;
     total_afiliados:=0;
     while nro_obrasocial <> 0 do
     begin
          ac_edad:=0;
          cont_obrasocial:=cont_obrasocial+1;
          if nro_obrasocial=1 then
             writeln ('Para finalizar ingrese 0 en el nro de obra social');
          writeln ('Ingrese nombre de obra social');
          readln (obrasocial);
          writeln ('Ingrese cantidad de afiliados de la obra social');
          readln (cant_afiliados);
          if nro_obrasocial=1 then
          begin
             max_afiliados:=cant_afiliados;
             max_obrasocial:=obrasocial;
          end
          else
              if cant_afiliados>max_afiliados then
              begin
                   max_afiliados:=cant_afiliados;
                   max_obrasocial:=obrasocial;
              end;
          for i:=1 to cant_afiliados do
          begin
               writeln ('Ingrese nombre y apellido del afiliado');
               readln (nombreapellido);
               writeln ('Ingrese su edad');
               readln (edad);
               writeln ('Indique anio de ingreso');
               readln (anioingreso);
               ac_edad:=ac_edad+edad;
               total_afiliados:=total_afiliados+cant_afiliados;
               if i=1 then
               begin
                    nombreapellido_antiguo:=nombreapellido;
                    edad_antiguo:=edad;
                    anioingreso_antiguo:=anioingreso;
               end
               else
               if anioingreso<anioingreso_antiguo then
               begin
                    nombreapellido_antiguo:=nombreapellido;
                    edad_antiguo:=edad;
                    anioingreso_antiguo:=anioingreso;
               end;
          end;
          writeln ('El total de afiliados de ',obrasocial, ' es de ', cant_afiliados);
          writeln ('El promedio de edad de los afiliados es de ', ac_edad div cant_afiliados);
          writeln ('El afiliado mas antiguo es ', nombreapellido_antiguo ,' con ', edad_antiguo, ' anios, cuyo anio de ingreso es el ', anioingreso_antiguo);
          writeln ('Ingrese nro de obra social');
          readln (nro_obrasocial);
     end;
     writeln ('El total de obras sociales es de ', cont_obrasocial);
     writeln (max_obrasocial, ' es la obra social con mas afiliados');
     writeln ('Esa cantidad de afiliados representa el ',(max_afiliados*100) div total_afiliados, ' % del total');
readkey;
end.
