---
title: '3.1. Implantación de aplicaciones web PHP.'
---

# **Implantación de aplicaciones web PHP.**

Tal y como hemos visto, un servidor web es un software que se encarga de almacenar, procesar y entregar páginas web a los usuarios a través de la red, generalmente mediante el protocolo HTTP o HTTPS. Actúa como intermediario entre el navegador del usuario y el contenido solicitado, como páginas HTML, archivos multimedia, o aplicaciones web dinámicas. El servidor web escucha las solicitudes del cliente (navegador) y responde enviando el contenido adecuado, ya sea estático o dinámico.

En la actualidad, el servidor web raramente funciona solo. Cada vez hay menos páginas web estáticas y más servicios y aplicaciones que no solo necesitan el servidor web, sino que necesitan una plataforma web que contiene, además, un gestor de base de datos y algún lenguaje de programación interpretado.

Hoy en día son muchos los servicios que necesitan una plataforma web corriendo en el servidor antes de poder instalarlos. Estamos hablando de entornos de aprendizaje virtual, como Moodle, o gestores de blogs y páginas web como Wordpress.

Una plataforma web es el entorno de desarrollo de software empleado para diseñar y ejecutar un sitio web. En términos generales, una plataforma web consta de cuatro componentes básicos:

1. **Sistema operativo:** Bajo el cual opera el equipo donde se hospedan las páginas web y que representa la base misma del funcionamiento del computador. En ocasiones limita la elección de otros componentes.
2. **Servidor web:** El software que maneja las peticiones desde equipos remotos a través de la Internet. En el caso de páginas estáticas, el servidor web simplemente provee el archivo solicitado, el cual se muestra en el navegador. En el caso de sitios dinámicos, el servidor web se encarga de pasar las solicitudes a otros programas que puedan gestionarlas adecuadamente.
3. **Gestor de bases de datos:** Se encarga de almacenar sistemáticamente un conjunto de registros de datos relacionados para ser usados posteriormente.
4. **Lenguaje de programación interpretado:** Controla las aplicaciones de software que corren en el sitio web.

Diferentes combinaciones de los cuatro componentes señalados, basadas en las distintas opciones de software disponibles en el mercado, dan lugar a numerosas plataformas web, aunque, sin duda, hay dos que sobresalen del resto por su popularidad y difusión: **LAMP** y **WISA**.

### Plataforma LAMP

La plataforma LAMP trabaja enteramente con componentes de software libre y no está sujeta a restricciones propietarias. El nombre LAMP surge de las iniciales de los componentes de software que la integran:

- **Linux:** sistema operativo.
- **Apache:** servidor web.
- **MySQL:** gestor de bases de datos.
- **PHP:** lenguaje interpretado PHP, aunque a veces se sustituye por Perl o Python.

### Plataforma WISA

La plataforma WISA está basada en tecnologías desarrolladas por la compañía Microsoft; se trata, por lo tanto, de software propietario. La componen los siguientes elementos:

- **Windows:** sistema operativo.
- **Internet Information Services (IIS):** servidor web.
- **SQL Server:** gestor de bases de datos.
- **ASP o ASP.NET:** como lenguaje para scripting del lado del servidor.

### Otras plataformas

Existen otras plataformas, como por ejemplo la configuración **WAMP** (Windows-Apache-MySQL-PHP), que es bastante común pero sólo como plataforma de desarrollo local. De forma similar, un servidor Windows puede correr con IIS y con MySQL y PHP. A esta configuración se la conoce como plataforma **WIMP**.

Entre los servidores web más utilizados hoy en día, aparte de Apache e IIS, tenemos también a **Nginx**, un servidor web software libre que está demostrando un alto rendimiento. Nginx es capaz de atender una gran cantidad de peticiones simultáneas y tiene un mejor rendimiento que sus competidores al servir contenido estático. Sin embargo, su configuración es menos flexible que otros.

Nginx también puede integrarse con PHP, dando lugar a plataformas tipo **LNMP** (Linux + Nginx + MySQL o MariaDB + PHP). Esta opción es también posible en Windows, dando lugar a plataformas **WNMP** (Windows + Nginx + MySQL o MariaDB + PHP).

Existen muchas otras plataformas que trabajan con distintos sistemas operativos (Unix, MacOS, Solaris), servidores web (incluyendo algunos que se han cobrado relativa popularidad como Lighttpd y LiteSpeed), bases de datos (MariaDB, PostgreSQL, MongoDB) y otros lenguajes de programación.

**XAMPP:** [XAMPP](https://www.apachefriends.org/es/index.html) es una forma fácil de instalar y usar el servidor web Apache con un sistema gestor de bases de datos (MariaDB), PHP y Perl. Basta con descargarlo, extraerlo y comenzar. En este momento hay cuatro versiones de XAMPP para Linux, Windows, Mac OS X y Solaris.

