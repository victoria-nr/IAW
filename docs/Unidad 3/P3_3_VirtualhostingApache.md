---
title: "Práctica 3.3: VirtualHosting con Apache"
---

## ¿Qué vas a aprender en esta práctica?

* Dónde están los archivos de configuración de apache2
* Crear distintos *Host Virtuales* en apache2 que nos permiten tener sitios web diferenciados.
* Acceder a cada *Host Virtual* con un determinado nombre de dominio.

## Apache

Apache es un popular servidor web de código abierto que desempeña un papel fundamental en la infraestructura de Internet. La versión más reciente, conocida como Apache HTTP Server 2 (o simplemente Apache2), es ampliamente utilizada en todo el mundo para alojar sitios web y aplicaciones web.

Para iniciar, parar, reiniciar y consultar el estado de apache2 podemos utilizar los siguientes comandos:
```shell
    sudo systemctl start apache2
    sudo systemctl stop apache2
    sudo systemctl restart apache2
    sudo systemctl status apache2
```
Los archivos de configuración de Apache se encuentran en el directorio `/etc/apache2`. En este directorio podemos encontrar los siguientes archivos y directorios:

- `apache2.conf`: Es el archivo de configuración principal. En este archivo se incluyen todos los archivos de configuración adicionales.
- `envvars`: En este archivo se definen las variables de entorno que hacen referencia al servidor web Apache y se utilizan en el archivo `apache2.conf`.
- `magic`: Este archivo contiene instrucciones para determinar el tipo de contenido o tipo MIME de un archivo en función de los primeros bytes de un archivo. 
- `ports.conf`: En este archivo se definen los puertos TCP donde el servidor Apache estará escuchando peticiones.
- `conf-available`: Este directorio contiene archivos de configuración que se aplican a todos los hosts virtuales de forma global.
- `conf-enabled`: Este directorio ccontiene enlances simbólicos a los archivos de configuración del directorio `conf-available` que están activos.
- `mods-available`: Este directorio contiene los archivos de configuración de los módulos que se pueden utilizar para añadir nuevas funcionalidades al servidor.
- `mods-enabled`: Este directorio contiene enlaces simbólicos a los archivos de configuración del directorio `mods-available` que están activos.
- `sites-available`: Este directorio contiene los archivos de configuración de los hosts virtuales.
- `sites-enabled`: Este directorio contiene enlaces simbólicos a los archivos de configuración del directorio `sites-available` que están activos.

## Introducción al VirtualHosting

El término *Hosting Virtual* se refiere a hacer funcionar más de un sitio web (tales como `www.company1.com` y `www.company2.com`) en una sola máquina. Los sitios web virtuales pueden estar "basados en direcciones IP", lo que significa que cada sitio web tiene una dirección IP diferente, o **"basados en nombres diferentes"**, lo que significa que con una sola dirección IP están funcionando sitios web con diferentes nombres de dominio (estos últimos son los que vamos a trabajar en esta práctica).

El servidor web Apache2 se instala por defecto con un host virtual. La configuración de este sitio la podemos encontrar en:

    /etc/apache2/sites-available/000-default.conf

Cuyo contenido podemos ver:
```apache
	<VirtualHost *:80>
	        #ServerName www.example.com	
	        ServerAdmin webmaster@localhost
	        DocumentRoot /var/www/html	
	        ErrorLog ${APACHE_LOG_DIR}/error.log
	        CustomLog ${APACHE_LOG_DIR}/access.log combined	
	</VirtualHost>
```
Donde encontramos los siguientes parámetros:

* [ServerName](https://httpd.apache.org/docs/2.4/mod/core.html#servername): El nombre con el que vamos acceder al sitio virtual. En el sitio virtual por defecto (como sólo tenemos uno) está comentado, podemos acceder por nombre o por dirección IP.
* [ServerAdmin](https://httpd.apache.org/docs/2.4/mod/core.html#serveradmin): Dirección de correo del administrador responsable del servidor.
* [DocumentRoot](https://httpd.apache.org/docs/2.4/mod/core.html#documentroot): Directorio donde guardamos los ficheros que se van a servir.
* [ErrorLog](https://httpd.apache.org/docs/2.4/mod/core.html#errorlog): Fichero de errores del host virtual.
* [CustomLog](http://httpd.apache.org/docs/current/mod/mod_log_config.html#customlog): Fichero de accesos al host virtual.

Por defecto este sitio virtual está habilitado, por lo que podemos comprobar que existe un enlace simbólico a este fichero en el directorio `/etc/apache2/sites-enabled`:

    lrwxrwxrwx 1 root root   35 Oct  3 15:24 000-default.conf -> ../sites-available/000-default.conf

Podemos habilitar o deshabilitar nuestros hosts virtuales utilizando los siguientes comandos:
```shell
	a2ensite
	a2dissite
```
En el fichero de configuración general `/etc/apache2/apache2.conf` nos encontramos las opciones de configuración del directorio padre del indicado en la directiva `DocumentRoot` (suponemos que todos los host virtuales van a estar guardados en subdirectorios de este directorio):
```apache
	...
	<Directory /var/www/>
		Options Indexes FollowSymLinks
		AllowOverride None
		Require all granted
	</Directory>
	...
```

## Tarea

!!!Question "Tarea 1"
	Queremos construir en nuestro servidor web apache dos sitios web con las siguientes características:

    * El nombre de dominio del primero será `www.iescaminas_local.org`, su directorio base será `/var/www/iescaminas` y contendrá una página llamada `index.html`, donde sólo se verá una bienvenida a la página del Instituto El Caminàs.
    * En el segundo sitio vamos a crear una página donde se pondrán noticias por parte de los departamentos, el nombre de este sitio será `www.departamentosiescaminas.org`, y su directorio base será `/var/www/departamentos`. En este sitio sólo tendremos una página inicial `index.html`, dando la bienvenida a la página de los departamentos del instituto.

Para conseguir estos dos sitios virtuales debes seguir los siguientes pasos:

1. Los ficheros de configuración de los sitios webs se encuentran en el directorio `/etc/apache2/sites-available`. Por defecto está el fichero `000-default.conf` que es la configuración del sitio web por defecto. Necesitamos tener dos ficheros para realizar la configuración de los dos sitios virtuales, para ello vamos a copiar el fichero `000-default.conf` dos veces, una para cada sitio virtual:
```
	cd /etc/apache2/sites-available
	cp 000-default.conf iescaminas.conf
	cp 000-default.conf departamentos.conf
```
	De esta manera tendremos un fichero llamado `iescaminas.conf` para realizar la configuración del sitio web `www.iescaminas_local.org`, y otro llamado `departamentos.conf` para el sitio web `www.departamentosiescaminas.org`.

2. Modificamos los ficheros `iescaminas.conf` y `departamentos.conf`, para indicar el nombre que vamos a usar para acceder al host virtual (`ServerName`) y el directorio de trabajo (`DocumentRoot`). Además vamos cambiar los nombres de los ficheros log de acceso y de error.
   
3. No es suficiente con crear los ficheros de configuración de cada sitio web, necesitambos también crear un enlace simbólico a estos ficheros dentro del directorio `/etc/apache2/sites-enabled`, para ello: 
```
    a2ensite iescaminas
    a2ensite departamentos
```
	Es decir, la creación de los enlaces simbólicos se puede hacer con la instrucción `a2ensite nombre_fichero_configuracion`. Para deshabilitar el sitio tenemos que borrar el enlace simbólico o usar la instrucción `a2dissite nombre_fichero_configuracion`.

4. Crea los directorios y los ficheros index.html necesarios en `/var/www` y reiniciamos el servicio apache2. Recuerda que los directorios y los ficheros deben pertenecer al usuario `www-data:www-data` y deben tener los permisos adecuados.

5. Para terminar lo único que tendremos que hacer es cambiar el fichero hosts (**resolución estática**) en el cliente y poner dos nuevas líneas donde se haga la conversión entre los dos nombre de dominio y la dirección IP del servidor.

6. Comprueba que puedes acceder desde el cliente a los dos sitios web utilizando sus nombres de dominio `www.iescaminas_local.org` y `www.departamentosiescaminas.org`.

<!--

!!!Task "¿Qué tienes que entregar?"
    1. Lista los ficheros que se encuentran en el directorio `/etc/apache2/sites-enabled`.
    2. Muestra cómo has configurado la resolución estática.
    3. Capturas de pantallas accediendo a los sitios web.
-->

<!--4. Repite el ejercicio cambiando los directorios de trabajo a `/srv/www`. ¿Qué modificación debes hacer en el fichero `/etc/apache2/apache2.conf`?
-->

