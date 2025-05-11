// Se tienen las 10 sucursales de una farmacia y por c/u de ellas se leen los datos de los socios: nombre, apellido, DNI, edad
//A. Cant de socios por sucursal
//B. Verificar si Juan Perez es socio de la farmacia
//C. Mostrar los datos del socio mas joven y del socio mayor de la farmacia
//D. Promedio de edades de los socios por sucursal y de toda la farmacia

Program Farmacia;
uses crt;
var sucursal,nro_socio,dni,edad,cant_socios,cant_socios_total,socio_joven,socio_mayor,prom_sucursal,prom_total,dni_mayor,dni_menor:integer;
    nom_ap,nom_mayor,nom_menor:string [50];
begin
     socio_joven:=0;
     socio_mayor:=0;
     cant_socios_total:=0;
     prom_sucursal:=0;
     prom_total:=0;
     for sucursal:=1 to 10 do
     begin
          writeln ('Sucursal ', sucursal);
          prom_sucursal:=0;
          nro_socio:=1;
          cant_socios:=0;
          while nro_socio <> 0 do
          begin
               writeln ('Ingrese nombre y apellido del socio');
               readln (nom_ap);
               writeln ('Ingrese edad');
               readln (edad);
               writeln ('Ingrese DNI');
               readln (dni);
               cant_socios:=cant_socios+1;
               cant_socios_total:=cant_socios+1;
               prom_sucursal:=prom_sucursal+edad;
               prom_total:=prom_total+edad;
               if (sucursal=1)and (nro_socio=1) then
               begin
                    socio_joven:=edad;
                    nom_menor:=nom_ap;
                    dni_menor:=dni;
                    socio_mayor:=edad;
                    dni_mayor:=dni;
                    nom_mayor:=nom_ap;
               end
               else
                   if edad < socio_joven then
                   begin
                        socio_joven:=edad;
                        nom_menor:=nom_ap;
                        dni_menor:=dni;
                   end
                   else
                   if edad > socio_mayor then
                   begin
                        socio_mayor:=edad;
                        nom_mayor:=nom_ap;
                        dni_mayor:=dni;
                   end;
               if nom_ap = 'Juan Perez' then
                  writeln ('Juan Perez es socio de la farmacia');
               writeln ('Ingrese nro de socio');
               readln (nro_socio);
          end;
        writeln ('Hay ',cant_socios, ' socio/s en la sucursal ',sucursal);
        writeln ('El promedio de edad de la sucursal ', sucursal, ' es de ', prom_sucursal div cant_socios);
    end;
    writeln ('El socio mayor de la farmacia es ', nom_mayor, ' con ', socio_mayor, ' anios y DNI ', dni_mayor);
    writeln ('El socio mas joven de la farmacia es ', nom_menor, ' con ', socio_joven, ' anios y DNI ', dni_menor);
    writeln ('El promedio de edad de la farmacia es de ', prom_total div cant_socios_total);
    readkey;
end.
