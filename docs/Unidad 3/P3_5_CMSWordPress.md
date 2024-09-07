---
title: "Práctica 5: Instalación del CMS WordPress"
---

## ¿Qué vas a aprender en esta práctica?

* A instalar el CMS WordPress en nuestro servidor LAMP.

## Introducción a los CMS

Un **Sistema de Gestión de Contenido**, o CMS por sus siglas en inglés (Content Management System), es una plataforma de software que facilita la creación, edición, gestión y publicación de contenido en línea, como sitios web, blogs, tiendas en línea y más. Los CMS son herramientas valiosas para usuarios que desean administrar su contenido en línea sin necesidad de conocimientos avanzados de programación o diseño web. 

Existen varios tipos de CMS, principalmente clasificados según su uso y propósito. Muchos de ellos están desarrollados en PHP.

1. CMS para blogs y  sitios web:

    * WordPress: Uno de los CMS más populares, especialmente para blogs y sitios web pequeños a medianos.
    * Joomla: Otra opción versátil para sitios web, que es especialmente adecuada para comunidades en línea y sitios más complejos.
    * Drupal: Ideal para sitios web más complejos y personalizables, a menudo utilizados por empresas y organizaciones.

2. CMS de Comercio Electrónico:

    * Magento: Un CMS de código abierto potente y altamente personalizable para tiendas en línea.
    * WooCommerce: Un plugin de comercio electrónico para WordPress que es muy popular y fácil de usar.
    * Shopify: Una plataforma de comercio electrónico basada en la nube que es excelente para los vendedores en línea.

3. CMS de Gestión de Contenido Empresarial (ECM):
    * SharePoint: Desarrollado por Microsoft, es utilizado para gestionar documentos y colaboración en empresas.
    * OpenText: Ofrece soluciones ECM para la gestión de contenido empresarial y la administración de documentos.

4. CMS de E-Learning:

    * Moodle: Un sistema de gestión de aprendizaje de código abierto que facilita la creación y administración de cursos en línea.
    * Blackboard: Utilizado en instituciones educativas para administrar contenido y participación en cursos en línea.

5. CMS de Redes Sociales:

    * BuddyPress: Un complemento de WordPress que permite crear comunidades y redes sociales
    * Dolphin: Un CMS dedicado a la creación de sitios web de redes sociales.

Estos son solo ejemplos de CMS populares en sus respectivas categorías, y existen muchas otras opciones disponibles, tanto de código abierto como comerciales, que se adaptan a diversas necesidades y niveles de habilidad. La elección del CMS adecuado dependerá de los objetivos específicos y la complejidad del proyecto web que se desee desarrollar.

## Principales pasos para instalar un CMS PHP

A continuación, se describen los pasos principales para instalar un CMS basado en PHP en un entorno LAMP.

1. Crear la base de datos y el usuario de la base de datos que vamos a utilizar para que la aplicación acceda a los datos.
2. ¿Dónde vamos a implantar la aplicación? Se puede implantar en un virtual host o en un directorio dentro de un virtual host. Por ejemplo, si instalo WordPress:
   
    * En un virtual host accederíamos con `wordpress.victoria.org` y los ficheros del CMS estarían en la raíz del DocumentRoot.
    * En un directorio dentro de un virtual host, se accedería, por ejemplo, con `victoria.org/wordpress` y los ficheros del CMS estarían en el directorio wordpress dentro del DocumentRoot.
  
3. Descargar los ficheros del CMS y subirlos al servidor. Esto se puede hacer de varias formas, una de las más sencillas es con el comando wget.
4. Acceso a la URL de instalación e iniciar el proceso de configuración.
   
    * Un punto importante en el proceso de configuración es indicar las credenciales para el acceso a la base de datos: hay que indicar el usuario y contraseña que vamos a utilizar, el nombre de la base de datos y la dirección donde se encuentra el servidor de base de datos. Si el servidor de base de datos está en la misma máquina que el servidor web, se pondrá localhost, si no se pondrá la IP o el nombre del servidor.
    * En el proceso de configuración e instalación, quizás se nos pida instalar determinadas librerías de PHP.
    * Terminamos la configuración de la aplicación como nombre, usuario administrador, etc.
  
5. La información que introducimos para configurar la aplicación se puede guardar en un fichero o en la base de datos:

    * Las credenciales de conexión se suelen guardar en un fichero de configuración.
    * Las demás configuraciones se suelen guardar en la base de datos, pero esto varía según el CMS que estemos instalando.

## Tarea

!!!Question "Tarea 1"
    Siguiendo los pasos anteriores, la tarea consiste en instalar la última versión del CMS WordPress, en un virtual host al cual se accederá mediante `wordpress.tunombre.org`.


## Evaluación

Documenta todo el proceso de instalación tanto con explicaciones como con capturaas de pantalla para que pueda valores los siguientes aspectos: 

| Criterio      | Puntuación                         |
| :--------- | :----------------------------------: |
|  Creación correcta de la base de datos y el usuario  |**2 puntos**  |
|  Configuración del virtualhost | **2 puntos** |
|  Captura de las pantallas de configuración de Wordpress en el navegador | **2 puntos**|
|  Captura de la creación de la primera entrada en el blog | **2 puntos**|
|  Se ha prestado especial atención al formato del documento, haciendo un correcto uso del lenguaje técnico y *documentando de forma correcta todos los pasos del proceso*|**2 puntos** |
