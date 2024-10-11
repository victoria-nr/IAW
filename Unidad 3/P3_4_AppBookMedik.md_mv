---
title: "Práctica 4: Instalación de la aplicación BookMedik"
---

## ¿Qué vas a aprender en esta práctica?

* A desplegar una aplicación PHP construida a medida en nuestro servidor LAMP.

## Introducción

Como ya sabemos tenemos 3 maneras principales para ejecutar código PHP:

* Desde la línea de comandos (**cli**).
* Con el servidor web **Apache2** y el módulo **libapache2-mod-php**. 
* Con un servidor web y el servidor de aplicaciones **fpm-php**. 

Nosotros utilizaremos la segunda opción.

La configuración de php está dividida según desde donde se use:

* `/etc/php/8.1/cli`: Configuración de php para `php8.1-cli`, cuando se utiliza php desde la línea de comandos.
* `/etc/php/8.1/apache2`: Configuración de php para apache2 cuando utiliza el módulo.
* `/etc/php/8.1/fpm`: Configuración de php para php-fpm.
* `/etc/php/8.1/mods-available`: Módulos disponibles de php que puedes estar configurados en cualquiera de los escenarios anteriores.

Si nos fijamos en la configuración de php para apache2 con el módulo:

* `/etc/php/8.1/apache2/conf.d`: Módulos instalados en esta configuración de php.
* `/etc/php/8.1/apache2/php.ini`: Configuración de php para este escenario.


## Tarea

!!!Question "Tarea 1"
    La tarea consiste en instalar la aplicación BookMedik, una aplicación web a medida para llevar el control de citas médicas, pacientes, médicos, historiales de citas, áreas médicas y mucho mas, pensado para centros médicos, clínicas y médicos independientes. Puedes encontrar la aplicación en [https://github.com/evilnapsis/bookmedik](https://github.com/evilnapsis/bookmedik).

Para realizar la instalación sigue los siguientes pasos:

1. Crea un virtualhost con el que accederás con el nombre `bookmedik.tunombre.org`. Copia en el *DocumentRoot* (`/var/www`) el directorio con los ficheros de la aplicación (para ello, puedes clonar con git el repositorio en `/var/www`). 
   
2. Crea la base de datos y las tablas necesarias recuperando la copia de seguridad de la base de datos que encuentras en el fichero `schema.sql`. Se creará una base de datos llamada `bookmedik`. Crea un usuario que tenga privilegios sobre dicha base de datos. 

3. Vamos a configurar el acceso a la base de datos desde la aplicación, para ello cambia el fichero `core\controller\Database.php` indicando el usuario de acceso (el que has creado en el punto 2), su contraseña, la base de datos que se llama `bookmedik` y la dirección donde se encuentra la base de datos, que en este caso es `localhost`.
   
4. Accede a la aplicación web usando la URL configurada en el virtualhost (usa el usuario `admin` y contraseña `admin`).
   
5. Para esta aplicación no es necesario, pero en determinadas aplicaciones es posible que necesitemos cambiar la memoria RAM que puede utilizar. Cambia la memoria máxima de uso de un script PHP (parámetro `memory_limit`) a 256Mb. ¿En qué fichero lo tienes que cambiar?.


## Evaluación

| Criterio      | Puntuación                         |
| :--------- | :----------------------------------: |
|  Configuración del virtualhost   |**2 puntos**  |
|  Contenido del fichero  `Database.php` | **2 puntos** |
|  Captura con el acceso a `bookmedik`, después del login| **3 puntos**|
|  Indica el fichero que has modificado (con el path completo) para modificar el límite de memoria. Muestra un pantallazo de la salida del fichero `info.php` donde se vea el cambio | **1 punto**|
| Se ha prestado especial atención al formato del documento, haciendo un correcto uso del lenguaje técnico y documentando de forma correcta todos los pasos del proceso|**2 puntos** |



