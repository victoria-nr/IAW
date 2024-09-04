---
title: "Práctica 1: Instalación de un servidor LAMP"
---

## ¿Qué vas a aprender en esta práctica?

* A instalar un servidor LAMP que nos permita el despliegue de aplicaciones PHP.

## Introducción a PHP

PHP es un lenguaje de programación interpretado de propósito general, pero se ha generalizado su uso en el desarrollo web. Aunque se puede ejecutar desde la línea de comandos, normalmente nos lo encontraremos embebido en el HTML.

```html
<!DOCTYPE HTML>
<html>
    <body>
        <h1>Mi primera página <strong>PHP</strong></h1>
        <?php>
            echo "Hello world!";
        ?>
    </body>
</html>
``` 

Podemos servir páginas web PHP de varias formas:

- Con un **servidor web** (por ejemplo, **apache2**) y el módulo **libapache2-mod-php**. El servidor web sirve el contenido estático y el contenido dinámico generado por el PHP.
- Con un **servidor web** y un servidor de aplicaciones, por ejemplo, **fpm-php**. El servidor web sirve el contendio estático y hace de proxy inverso para las peticiones PHP, es decir, pasa a **fpm-php** las peticiones en las que hay que ejecutar el código PHP.

## Servidor LAMP

El acrónimo *LAMP* se refiere a un entorno configurado en un servidor que nos posibilita servir aplicaciones web escritas en PHP.

El entorno que vamos a configurar se consigue mediante la unión de las siguientes tecnologías:

* **L**inux, el sistema operativo;
* **A**pache, el servidor web;
* **M**ySQL, **M**ariaDB, el gestor de bases de datos;
* **P**HP, el lenguaje de programación.

Existe también el entorno **LEMP**, en donde cambiamos apache2 por nginx. En nuestro caso, configuraremos el entorno **LAMP**.

## Tarea

En esta práctica, aprenderemos a configurar un entorno *LAMP*. A medida que vayamos instalando y configurando las distintas herramientas aprovecharemos para introducir algunas características de las mismas.

!!!Question "Tarea 1"
    Sigue todos los pasos que se describen a continuación para configurar un entorno LAMP.

!!! Info 
    Realiza esta tarea en una máquina virtual. Puedes usar Vagrant para configurarla con el sistema operativo Ubuntu Server 22.04. Si utilizas la MV del tema anterior, recuerda que Nginx está escuchando en el puerto 80, por tanto, desactiva Nginx para que Apache pueda escuchar en el puerto 80. Si no, realiza los pasos sobre una máquina limpia. Recuerda actualizar los paquetes disponibles con:
        ```sh
            sudo apt update
            sudo apt upgrade
        ```

### Paso 1: Instalación y configuración del servidor de base de datos.

Podemos instalar MySQL o MariaDB, en este caso optaremos por MySQL:
```shell
	sudo apt install mysql-server
```

Para iniciar, parar, reiniciar y consultar el estado de MySQL server podemos utilizar los siguientes comandos:
```shell
    sudo systemctl start mysql
    sudo systemctl stop mysql
    sudo systemctl restart mysql
    sudo systemctl status mysql
```

Por defecto el usuario `root` no tiene contraseña, para acceder necesitaremos hacerlo con el root del sistema. Es muy recomendable ejecutar el programa `mysql_secure_installation` para configurar la base de datos de manera segura, por ejemplo para indicar una contraseña al root.

Si necesitas crear una base de datos y un usuario que tenga acceso a la misma, deberás entrar en el servidor de la base de datos con el comando ```mysql -u root -p``` y una vez dentro ejecutar los siguientes pasos:
```shell
	CREATE DATABASE newdb;
	CREATE USER 'username'@'localhost' IDENTIFIED BY 'userpassword';
	GRANT ALL PRIVILEGES ON newdb.* to 'username'@'localhost';
	FLUSH PRIVILEGES;
	quit
```
Observa que el usuario creado tiene todos los privilegios sobre la base de datos creada pero sólo puede conectarse al servidor desde la máquina local. Para poder conectarse desde una máquina remota utilizaríamos el comodín '%' en lugar de localhost.

## Paso 2: Instalación de Apache y PHP

A continuación instalamos el interprete de PHP. Al menos instalamos la librerías de PHP necesarias para conectar los programas PHP con la base de datos (dependiendo de la aplicación que instalemos necesitaremos instalar las librerías PHP necesarias).

También instalamos el servidor web. Además vamos a instalar el módulo que permite que apache2 interprete PHP (es decir, apache2 hará el papel de servidor web y de servidor de aplicaciones).
```shell
	apt install apache2 libapache2-mod-php php php-mysql
```
A continuación se describe cada librería:

- `apache2`: servidor web apache2.
- `libapache2-mod-php`: módulo de apache2 que le permite ejecutar el código PHP. Es decir, apache2 será servidor web y servidor de aplicaciones PHP.
- `php`: es un metapaquete que apunta al paquete de Ubuntu 22.04, en este caso apunta al paquete `php8.1`.
- `php-mysql`: librería PHP que posibilita el acceso a la base de datos.

## Paso 3: Comprobación del servidor web y LAMP

El directorio web por defecto de apache es `/var/www/html` (el DocumentRoot), que inicialmente contiene el fichero `index.html`. Comprueba que apache está funcionando escribiendo en la barra de direcciones del navegador la IP de tu servidor.
   	Recuerda que los ficheros que sirve el servidor web deben tener como propietario el usuario `www-data:www-data`. <!-- chown -R www-data:www-data /var/www/html-->

Para comprobar si el servidor LAMP está funcionando, puedes crear un fichero `info.php` en el DocumentRoot (el directorio `/var/www/html`) con el siguiente contenido:

```html
    <html>
        <head>
        </head>
        <body>
	        <h1>Escribe aquí tu nombre</h1>
	        <br >
            <?php phpinfo(); ?>
        </body>
    </html>
```
  
A partir del DocumentRoot puedes crear directorios con ficheros que servirá el servidor web accediendo con la IP del servidor más el path correspondiente. Por ejemplo, crea dos directorios *sitio1xxx* y *sitio2xxx* (donde xxx son tus iniciales). Dentro de cada directorio crea un fichero llamado `index.php` (deben tener contenidos diferentes). Puedes utilizar los ejemplos siguientes:
   
```html
    <html>
        <head>
        </head>
        <body>
	        <h1>Escribe aquí tu nombre</h1>
	        <br >
            <?php echo ‘sitio 1’; ?>
        </body>
     </html>
```
```html
    <html>
        <head>
        </head>
        <body>
	         <h1>Escribe aquí tu nombre</h1>
	         <br >
            <?php echo ‘sitio 2’; ?>
        </body>
    </html>
```

Comprueba que los dos dos ficheros se ven correctamente desde el navegador con las rutas `http://IP/sitio1xxx` y `http://IP/sitio2xxx`.

Como ya hemos visto, para acceder a las páginas usamos la dirección IP del servidor. Sin embargo vamos a usar un nombre. Si queremos usar un nombre para acceder a la página, tenemos que tener un sistema para convertir el nombre en dirección IP. Como no tenemos servidor DNS vamos a usar la **resolución estática**.

Para usar la resolución estática, modificamos el fichero `/etc/hosts` del ordenador desde el que vamos acceder a la página, de la siguiente forma:

	<direccion_ip_servidor_web>      <nombre_con_el_que_accedemos>

Por ejemplo:

	192.168.121.10      www.example.org

Ahora podemos acceder a la URL: `http://www.example.org/info.php`

Si tenemos problemas de acceso podemos ver los logs del servidor:
    
  - El fichero de logs de acceso por "defecto": `/var/log/apache/access.log`. Donde se registra los accesos al servidor desde los clientes.
  - El fichero de logs de errores por" defecto": `/var/log/apache/error.log`.
  -  También podemos ver los logs del servicio ejecutando: `journalctl -u apache2`.


## Paso 4: Comprobación acceso a la base de datos

Para comprobar que podemos acceder a la base de datos creada en la paso 1 con el usuario y contraseña indicados, completa el siguiente script con los datos correctos y pruébalo desde un navegador:

```php
<?php
    $username="username";
    $password="userpassword";
    $database="newdb";

    $mysqli = new mysqli("localhost", $username, $password, $database);

    $mysqli->select_db($database) or die( "Unable to select database");

    echo "PRUEBA DE CONEXIÓN A LA BD $database CON EL USER $username OK";

    $mysqli->close();
?>
```


<!--
!!!Task "¿Qué tienes que entregar?"
    1. Una captura de pantalla donde se vea la configuración de la resolución estática con el nombre `wwww.tunombreyapellidos.org`
    2. Crea una base de datos y un usuario en la base de datos y entrega una comprobación de que se puede acceder a la base de datos con ese usuario y puede acceder a la base de datos creada.
    3. Una captura de pantalla accediendo desde un navegador a los dos ficheros del punto 5.
    4. Una captura de pantalla accediendo desde un navegador al fichero `info.php` usando el nombre que has configurando en la resolución estática.

-->