# Aplicacion de reserva de espacios PAS-PDI-Estudiantes de la ETSIT UPM

## Descripción
Proyecto en docker que crea la aplicacion de reserva de espacios de PDI-PAS-Estudiantes 


## Ficheros
Dentro de la carpeta  se encuentra todos los ficheros necesarios para el correcto despliegue de la aplicación. Posteriormente se comentarán en detalle.




## Pasos para despliegue de creacion de la bbdd

Tras el primer docker-compose build antes de "docker-compose up -d"

Pasos mediante los cual creas la bbdd del proyecto por primera vez por primera vez
```
docker exec -i 5.7-mysql mysql -ubookedscheduler -p123secret bookedscheduler < create-schema.sql 
docker exec -i 5.7-mysql mysql -ubookedscheduler -p123secret bookedscheduler < create-data.sql 
docker exec -i 5.7-mysql mysql -ubookedscheduler -p123secret bookedscheduler < bookedscheduler.sql 
```

