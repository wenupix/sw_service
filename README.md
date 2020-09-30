# sw_service
Lanzador de servicio "Service.py" dockerizado.


## Antes de comenzar
Por favor, considere lo siguiente:
- El contenedor recibe el nombre de **tachy**.
- Por defecto, las pruebas pueden realizarse desde un navegador a través del puerto 80. Si su máquina tiene el puerto ocupado, realizar el cambio de puerto en la sección **ports** del archivo **docker-compose.yml**.
```sh
ports:
 - "80:5000"  <-- Solo debe cambiar el numero 80.
```
- Este script se ejecuta en un entorno Linux con Docker. Por lo tanto, debe tener instalado **docker** y **docker-compose**.
  - Para facilitar la instalación de Docker (CE), puede usar el siguiente script: https://gitlab.com/wenupix/docker-autoinstall/
  - **docker-autoinstall** funciona en distribuciones Ubuntu/Debian, Centos/Fedora, Archlinux y Alpine (experimental).
    
 
## Cómo usar
Una vez descargado el script, ejecutar:
```sh
$ docker-compose up -d
```
Para verificar el estado del contenedor (y el servicio), ejecutar:
```sh
$ docker logs tachy
```

## Pruebas
### Desde el navegador
Acceda a la url: http://localhost

### Desde consola (con curl)
```sh
$ curl http://localhost
```
### Desde el contenedor
Ingresar al contenedor
```sh
docker exec -it tachy bash
```
Una vez dentro, realizar prueba con curl:
```sh
$ curl http://localhost:5000
```

## Importante
Si realiza el cambio de puerto en el archivo docker-compose.yml, todas las pruebas externas (navegador o curl) deben apuntar a localhost con el puerto.
- Por ejemplo, si cambia el puerto 80 por 8080, la URL será: **http://localhost:8080**.




EOF
