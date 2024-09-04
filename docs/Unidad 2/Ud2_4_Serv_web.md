---
title: '2.4. Servidores web: Nginx vs Apache'
---

# **Servidores web: Nginx vs Apache**

Cuando vamos a poner en marcha un servidor web, lo primero que necesitamos es utilizar un sistema operativo sobre el cual vamos a ejecutar los diferentes servicios, sistema operativo que en más del 95% de las ocasiones suele ser un sistema Linux. Sobre el S.O. se ha de instalar el servicio de servidor web, que es el que se encargara de recibir las peticiones de páginas y servirlas. Y actualmente con esto no suele ser suficiente, ya que raramente un servidor web se limitará a servir páginas estáticas. Se hará necesario un software que se encargue de la gestión de las bases de datos, MySQL habitualmente, y un software para gestionar los contenidos dinámicos de las webs, que suele ser PHP.

En este apartado vamos a centrarnos en el software del servidor web y aquí es donde entran las dudas.

Cuando buscamos montar una web podemos elegir una gran cantidad de servidores web diferentes, desde Apache y Nginx, los más conocidos y utilizados con más de un 85% de uso entre ambos, hasta otros servidores menos conocidos como Microsoft IIS (si usamos un servidor Windows), LiteSpeed, Node.js, etc. 

Los dos servidores más utilizados para montar páginas web hoy en día son Apache y Nginx, sin embargo, es imposible decir que uno es mejor que otro ya que cada uno de ellos tiene sus propias fortalezas y debilidades y puede ir mejor bajo ciertas circunstancias o simplemente ser más sencillo de utilizar. 

<u>*Nginx está orientado a mejorar el rendimiento, soportando mayores cargas de tráfico y usuarios que Apache (Problema C10K), además de ofrecer otras funcionalidades como hacer de proxy. En sus orígenes era especialmente eficiente ofreciendo contenido estático*.</u>

![](../img/nginx1.png) 

Después de ser lanzado, Nginx fue usado principalmente para servir archivos estáticos y como un balanceador de carga o proxy inverso en frente de instalaciones Apache.

Ejemplos de servicios de despliegue de páginas estáticas:

+ Netlify
+ Surge
+ GitHub Pages
+ GitLab Pages
+ Firebase
+ Vercel
+ Neocities

Mientras evolucionaba la red, y la necesidad de exprimir hasta la última gota de la velocidad y eficiencia de uso de hardware con este, más sitios empezaron a reemplazar Apache con Nginx por completo, gracias a un software mucho más maduro.

![](../img/nginx2.png){: style="height:450px;width:700px"}

### Razones para usar Nginx

1. <u>Es ligero</u>

    Nginx reduce el consumo de RAM. 

2. <u>Es multiplataforma y fácil de instalar </u>

    La mayoría de las grandes distribuciones de GNU/Linux, tienen Nginx en sus repositorios. 

3. <u>¡Se puede usar junto a Apache! </u>

    Sí, como lo lees, algunas empresas solo usan Nginx para servir contenido estático y Apache para el contenido dinámico. 

4. <u>Caché</u>

    Puedes usar Nginx como caché, con algo de configuración, permitiendo mejorar la eficiencia de tu aplicación sin tocar la programación de la misma. 

5. <u>Balanceador de carga </u>

    Este servidor web puede funcionar como balanceador de carga, distribuyendo el tráfico entre varios servidores, permitiendo mayor escalabilidad. 

6. <u>Soporte comunitario y profesional </u>

    Nginx, Inc está detrás del desarrollo de Nginx, además de la comunidad en general, permitiendo tener un soporte tanto profesional como comunitario. 

7. <u>Compatibilidad con las aplicaciones web más populares</u>

    Nginx es compatible con una gran cantidad de CMS existentes en el mercado, y hay un muchos tutoriales y documentación para instalar estos bajo Nginx, como por ejemplo: Wordpress, Joomla, Drupal, phpBB ¡y más! 