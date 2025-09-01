---
title: '2.5. Infraestructura para el despliegue de aplicaciones web'
---

Para desplegar una aplicación web vamos a necesitar una infraestructura que nos permita alojarla y hacerla accesible a los usuarios a través de Internet.

A continuación, se describen las opciones más comunes para desplegar una aplicación web.


## Hosting Compartido

En un hosting compartido, las aplicaciones web comparten los recursos del servidor (CPU, RAM, espacio de disco, etc.) con otros sitios web que están alojados en el mismo servidor físico.

**Ventajas:**

+ Es la opción más económica.
+ Fácil de gestionar a través de paneles de control como [Plesk](https://www.plesk.com/) o [cPanel](https://www.cpanel.net/).
+ Ideal para principiantes o proyectos pequeños.

**Desventajas:**

+ Pueden existir problemas de rendimiento, debido a que se comparten los recursos con otros sitios web.
+ Tienes poco control sobre la configuración del servidor y lo que puedes instalar en él.

**Ejemplos de proveedores:**

+ [Hostinger](https://www.hostinger.es)
+ [Arsys](https://www.arsys.es)
+ [IONOS](https://www.ionos.es)
+ [Cdmon](https://www.cdmon.com)
+ [Hetzner](https://www.hetzner.com)



## VPS (Virtual Private Server)

El servidor físico se divide en varios servidores virtuales o **VPS**, donde cada uno tiene asignados sus propios recursos.  
Es una opción intermedia entre el hosting compartido y un servidor dedicado.

**Ventajas:**

+ Tienes más control sobre la configuración del servidor y lo que puedes instalar en él.
+ Puede ofrecer un mejor rendimiento que el hosting compartido.

**Desventajas:**

+ El coste es mayor que el del hosting compartido.
+ Necesitas tener algunos conocimientos técnicos básicos sobre cómo gestionar un servidor.

**Ejemplos de proveedores:**

+ [DigitalOcean](https://www.digitalocean.com)
+ [OVH](https://www.ovhcloud.com/es/)
+ Algunos proveedores de hosting compartido también ofrecen planes de VPS.


## Servidor Dedicado

En un servidor dedicado, tienes un servidor físico completo donde sólo se alojará tu aplicación web.

**Ventajas:**

+ Tendremos mejor rendimiento ya que no compartimos los recursos con otros sitios web.
+ Ideal para aplicaciones grandes y con mucho tráfico.

**Desventajas:**

+ Más caro que un VPS o hosting compartido.
+ Necesitas conocimientos técnicos avanzados para su gestión (seguridad, actualizaciones, etc.).

**Ejemplos de proveedores:**

+ [Hetzner](https://www.hetzner.com)
+ Algunos proveedores de VPS también ofrecen planes de servidores dedicados.


## Cloud Computing

Los servicios de **Cloud Computing** para desplegar aplicaciones web incluyen:

+ IaaS (Infrastructure as a Service)  
+ PaaS (Platform as a Service)  
+ FaaS (Function as a Service) o Serverless  
+ CaaS (Containers as a Service)  
+ KaaS (Kubernetes as a Service)  

Vamos a ver cada uno de ellos con detalle:

### IaaS (Infrastructure as a Service)

Proporciona recursos de infraestructura como servidores virtuales, redes y almacenamiento.  
El usuario gestiona sistema operativo, seguridad y software.

**Ventajas:**

+ Ofrece más flexibilidad y control al usuario para configurar el entorno según las necesidades específicas de su aplicación.
+ Facilita la escalabilidad ya que puedes aumentar o reducir la infraestructura según la demanda.

**Desventajas:**

+ Requiere conocimientos técnicos avanzados.
+ El coste depende de los recursos consumidos. Puede ser más caro que otras opciones.

**Ejemplos de proveedores:**

+ [Amazon Web Services (AWS)](https://aws.amazon.com/es/)
+ [Microsoft Azure](https://azure.microsoft.com/es-es/)
+ [Google Cloud Platform (GCP)](https://cloud.google.com)
+ [Oracle Cloud Infrastructure (OCI)](https://www.oracle.com/cloud/)


### PaaS (Platform as a Service)

Estas plataformas gestionan la infraestructura y se enfocan en simplificar el despliegue de las aplicaciones. El usuario sólo se tiene que preocupar de la aplicación y la plataforma se encarga del resto (servidores, escalabilidad, mantenimiento).

**Ventajas:**

+ Es fácil de usar. Ideal para desarrolladores que no quieren complicarse con la administración de servidores.
+ Permite el autoescalado en función de la demanda.

**Desventajas:**

+ Tienes menos control ya que no tienes acceso al servidor donde se ejecuta la aplicación.
+ El coste depende de los recursos que se usen. Puede ser más caro que otras opciones.

**Ejemplos de proveedores:**

+ [Vercel](https://vercel.com)
+ [Heroku](https://www.heroku.com)
+ [AWS Elastic Beanstalk](https://aws.amazon.com/elasticbeanstalk/)
+ [Google App Engine](https://cloud.google.com/appengine)
+ [Netlify](https://www.netlify.com)
+ [Platform.sh](https://platform.sh)
+ [Firebase](https://firebase.google.com)


### FaaS (Function as a Service) o Serverless

Este tipo de servicio no se utiliza para desplegar aplicaciones web completas, sino que se utiliza para desplegar funciones que responden a eventos o peticiones HTTP. El usuario no gestiona ningún servidor, es el proveedor el encargado de ejecutar las funciones en su infraestructura.

**Ventajas:**

+ Pagas solo por el tiempo de ejecución.
+ Ideal para aplicaciones que tienen cargas de trabajo intermitentes.
+ No necesitas gestionar servidores.

**Desventajas:**

+ Tienes menos control sobre el entorno de ejecución.
+ Útil solo para tareas pequeñas, no para aplicaciones completas.

**Ejemplos de proveedores:**

+ [AWS Lambda](https://aws.amazon.com/lambda/)
+ [Google Cloud Functions](https://cloud.google.com/functions)
+ [Azure Functions](https://azure.microsoft.com/es-es/services/functions/)


### CaaS (Containers as a Service)

Las tecnologías de contenedores, como [Docker](https://www.docker.com/), permiten empaquetar aplicaciones y sus dependencias para garantizar que se pueda ejecutar de la misma manera en cualquier entorno.

**Ventajas:**

+ Facilitan la portabilidad de las aplicaciones.
+ Es ideal para arquitecturas basadas en microservicios.

**Desventajas:**

+ Requiere conocimientos técnicos avanzados.

**Ejemplos de proveedores:**

+ [AWS Elastic Container Service (ECS)](https://aws.amazon.com/ecs/)
+ [Azure Container Apps](https://azure.microsoft.com/es-es/products/container-apps/)


### KaaS (Kubernetes as a Service)

Kubernetes es una plataforma para orquestar y gestionar contenedores a gran escala.

**Ventajas:**

+ Facilita la gestión y escalado de aplicaciones distribuidas.

**Desventajas:**

+ Requiere conocimientos técnicos avanzados.

**Ejemplos de proveedores:**

+ [AWS Elastic Kubernetes Service (EKS)](https://aws.amazon.com/eks/)
+ [Google Kubernetes Engine (GKE)](https://cloud.google.com/kubernetes-engine)
+ [Azure Kubernetes Service (AKS)](https://azure.microsoft.com/es-es/services/kubernetes-service/)


## Hosting Estático con CDNs (Content Delivery Network)

Para desplegar aplicaciones web estáticas (HTML, CSS y JavaScript) podemos utilizar una CDN (Content Delivery Netowrk) para distribuir el contenido en servidores que están repartidos por todo el mundo.

**Ventajas:**

+ Muy eficiente para sitios web estáticos.
+ Existen proveedores gratuitos y económicos.
+ Mejora la velocidad de carga de los sitios web estáticos.

**Desventajas:**

+ Está limitado a contenido de sitios web estáticos.

**Ejemplos de proveedores:**

+ [GitHub Pages](https://pages.github.com)
+ [Cloudflare Pages](https://pages.cloudflare.com)
+ [Surge.sh](https://surge.sh)
