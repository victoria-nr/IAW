---
title: '5 Redes y Volúmenes'
---

# Gestión de redes

La gestión de redes en Docker es una funcionalidad esencial que permite a los contenedores comunicarse entre sí, con otros servicios y con redes externas. Docker ofrece diferentes tipos de redes que simplifican tanto la conectividad interna entre contenedores como la integración con redes externas. A través de estas redes, se pueden controlar aspectos como el aislamiento, la seguridad y el rendimiento de las comunicaciones.

Por defecto, Docker crea tres tipos de redes principales:

* Bridge: Es la red predeterminada que utiliza Docker cuando se inicia un contenedor sin especificar ninguna red. Permite que los contenedores se comuniquen entre ellos en el mismo host.
* Host: En este modo, el contenedor comparte la red del host, lo que elimina la capa de aislamiento que crea Docker entre el contenedor y el host.
* None: Desactiva toda la conectividad de red del contenedor, lo que es útil cuando se necesita ejecutar servicios completamente aislados.
  
Además, Docker permite la creación de redes personalizadas y la integración con redes definidas por el usuario mediante plugins. Este sistema flexible de redes facilita la implementación de aplicaciones distribuidas, sistemas escalables y entornos de microservicios en contenedores.

## Crear una red

Podemos crear distinas redes ampliando las 3 anteriores, por ejemplo, para aislar una base de datos:

```console
$ docker network create red-interna-db
```

## Listar redes

Con `docker network ls` podemos visualizar todas las redes disponibles.

```console
$ docker network ls
NETWORK ID     NAME                                DRIVER    SCOPE
65d4ba07a72c   bridge                              bridge    local
1cc57257dd38   red-interna-db                      bridge    local
64f68361ff3f   host                                host      local
```

## Visualizar redes

Para obtener información de cada red podemos usar `docker network inspect ID/nombre-red`

```console
$ docker network inspect red-interna-db
[
    {
        "Name": "red-interna-db",
        "Id": "12b97f5878419d2dd7bf7d4b2671f9bd0738cd6e75f922d24ba982edbada78c9",
        "Created": "2023-10-22T14:15:25.194744249Z",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": {},
            "Config": [
                {
                    "Subnet": "172.24.0.0/16",
                    "Gateway": "172.24.0.1"
                }
            ]
        },
        "Internal": false,
        "Attachable": false,
        "Ingress": false,
        "ConfigFrom": {
            "Network": ""
        },
        "ConfigOnly": false,
        "Containers": {},
        "Options": {},
        "Labels": {}
    }
]

```


## Borrar redes

También podemos eliminar redes mediante el comando: `docker network rm` y el nombre de la red.

```console
$ docker network rm red-interna-db
```


# Persistiendo datos

Por defecto ya hemos indicado que un contenedor está aislado de todo. Hemos visto como podemos conectar el contenedor a un puerto de red para poder acceder a él. Eso incluye al sistema de archivos que contiene. De tal manera que si se elimina el contenedor, se eliminan también sus archivos.

Si queremos almacenar datos (una web, una base de datos, etc.) dentro de un contenedor necesitamos una manera de almacenarlos sin perderlos.

Docker ofrece tres maneras:

* A través de **volúmenes**, que son objetos de Docker como las imágenes y los contenedores.
* Montando un **directorio** de la máquina anfitrión dentro del contenedor.
* Almacenándolo en la **memoria del sistema** (aunque también se perderían al reiniciar el servidor).

Lo normal es usar volúmenes, pero habrá ocasiones en que es preferible montar directamente un directorio de nuestro espacio de trabajo. Por ejemplo, para guardar los datos de una base de datos usaremos volúmenes, pero para guardar el código de una aplicación o de una página web montaremos el directorio.

La razón para esto último es que tanto nuestro entorno de desarrollo como el contenedor tengan acceso a los archivos del código fuente. Los volúmenes, al contrario que los directorios montados, no deben accederse desde la máquina anfitrión.

## Crear un volumen

Como en la siguiente sección necesitaremos crear una base de datos para instalar un blog con _WordPress_ vamos a crear un volumen donde guardar la información:

```console
$ docker volume create wordpress-db
wordpress-db
```

## Listar volúmenes

Con `docker volume ls` podemos visualizar todos los volúmenes disponibles.

```console
$ docker volume ls
DRIVER              VOLUME NAME
local               wordpress-db
```
## Visualizar volúmenes

Los volúmenes se crean en un directorio del sistema y no es recomendable acceder a él, no al menos mientras haya un contenedor usándolo. En cualquier caso, si queremos ver los metadatos de un volumen podemos usar `docker volume inspect`

```console
$ docker volume inspect wordpress-db 
[
    {
        "CreatedAt": "yyyy-mm-ddThh:ii:ss+Z",
        "Driver": "local",
        "Labels": {},
        "Mountpoint": "/var/lib/docker/volumes/wordpress-db/_data",
        "Name": "wordpress-db",
        "Options": {},
        "Scope": "local"
    }
]
```
## Borrar volúmenes

Como todos los objetos de _Docker_, los volúmenes también pueden ser borrados, pero solo si no están en uso. Mucha precaución al borrar los volúmenes, porque perderíamos todos los datos que contenga.

Para borrar un contenedor usaremos `docker volume rm` y el nombre del volumen.

```console
$ docker volume rm wordpress-db
```

# Para saber más

Para profundizar más en el manejo de redes y volúmenes en Docker seguiremos el siguiente documento:

[Redes y volúmenes](CursoDockerKubernetes_2025/UD05.01-Redes_y_volumenes_en_Docker.pdf)

Para ir recordando los distintos comandos que vayamos usando imprime y ve marcando los comandos que uses en este CheatSheet:

[Cheatsheet](CursoDockerKubernetes_2025/UD05.02-Docker_CheatSheet_Version_UD05.pdf)

Una vez finalices la parte teórica prueba a realizar estas dos prácticas para afianzar conocimientos:

[Caso práctico 01 - Wordpress + MariaDB](CursoDockerKubernetes_2025/UD05.03-Caso_practico_01-Wordpress_y_MariaDB.pdf)

[Caso práctico 02 - Balanceo de carga con HAProxy](CursoDockerKubernetes_2025/UD05.04-Caso_practico_02-Balanceo_de_carga_con_HAProxy.pdf)

Para esta práctica necesitarás los siguientes [archivos](CursoDockerKubernetes_2025/UD05-CasoPractico02-HAProxy.zip). Cuando te los descargues, asegúrate de que los ficheros `index.html` tienen los permisos adecuados (644) para que los pueda servir apache en todas las carpetas en las que existen.
