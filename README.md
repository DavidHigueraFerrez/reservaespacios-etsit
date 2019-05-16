# Aplicacion para reserva de Espacios de la ETSIT

Desarrollada una aplicacion para la reserva de espacios de la ETSIT, desplegada en un contenedor Docker basando el principio LAMP. Para este caso solo usaremos

* PHP 7.1
* Apache 2.4
* MySQL 5.7

## Proceso instalacion y despliegue

Clonar el repositorio desde Git y seguir las instrucciones de arranque la copia de la bbdd

Instalacion y despliegue de la aplicacion 
```shell
git clone https://github.com/DavidHigueraFerrez/reservaespacios-etsit.git
cd reservaespacios-etsit
docker-compose build
docker-compose up -d
```
## Configuracion de la bbdd de la aplicacion

Una vez levantada la aplicacion debemos configurar el schema y los datos de las reservas
```
docker exec -i 5.7-mysql mysql -ubookedscheduler -p123secret bookedscheduler < create-schema.sql 
docker exec -i 5.7-mysql mysql -ubookedscheduler -p123secret bookedscheduler < create-data.sql 
docker exec -i 5.7-mysql mysql -ubookedscheduler -p123secret bookedscheduler < bookedscheduler.sql 
```
### Configuracion de la bbdd para actualizacion de versiones

Los siguientes pasos son para cuando se despliega la aplicacion para una actualizacion de codigo y se quiere mantener las reservas de la bddd anterior

Necesario hacer un "dump" de la bbdd previo al al build para luego cargar la nueva informacion del contenedor.Pasos del script
Prepara script
```
# Backup
docker exec 5.7-mysql /usr/bin/mysqldump -u bookedscheduler --password=root bookedscheduler > bookedscheduler.sql

# Restore
cat backup.sql | docker exec -i 5.7-mysql /usr/bin/mysql -u bookedscheduler --password=root bookedscheduler

```

## Acceso a la aplicacion
La aplicacion estara desplegada en el puerto 81 y accesible sobre el contexto de /reservaespacios/
