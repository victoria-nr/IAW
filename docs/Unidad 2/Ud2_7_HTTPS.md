---
title: '2.7. El protocolo HTTPS'
---

# **El protocolo HTTPS**


El Protocolo seguro de transferencia de hipertexto (en inglés, Hypertext Transfer Protocol Secure o [HTTPS](https://es.wikipedia.org/wiki/Protocolo_seguro_de_transferencia_de_hipertexto)) es un protocolo de aplicación basado en el protocolo HTTP, destinado a la transferencia segura de datos de hipertexto, es decir, es la versión segura de HTTP. 

El protocolo HTTPS utiliza el puerto 443, mientras que el protocolo HTTP utiliza el puerto 80.

**La web es insegura por naturaleza.** Cuando se diseñaron los protocolos en los que está basada (TCP/IP) no se tuvieron en cuenta muchos de los problemas que tiene la Internet moderna. Y el protocolo HTTP, para transferir páginas web, no añadió nada al respecto tampoco hasta mucho después, con la introducción del protocolo HTTPS (la "ese" es de "Seguro") allá por 1994 por la empresa Netscape. El protocolo HTTPS original utilizaba SSL (Secure Sockets Layer) como protocolo seguro de intercambio de claves y cifrado, pero en la actualidad está obsoleto y se emplea [TLS](https://es.wikipedia.org/wiki/Seguridad_de_la_capa_de_transporte) (Transport Layer Security). El protocolo TLS se encarga de cifrar los datos transmitidos entre el cliente y el servidor garantizando: (1) la encriptación de los datos, (2) la autenticidad del cliente y servidor, (3) la integridad de los datos, es decir, que no han sido modificados.

Tradicionalmente, **los navegadores le han indicado a sus usuarios que se estaban conectando a un sitio seguro utilizando un iconito, generalmente uno con un candado**. 

Según el navegador el aspecto cambia un poco, pero todos muestran el proverbial "candadito" al lado de la dirección: 

![](../img/https1.png)

Es decir, lo importante aquí es que hasta ahora los navegadores consideran HTTP como la norma, y HTTPS como la excepción, y por eso lo marcan de esta manera. 

### Funcionamiento de HTTPS

El funcionamiento básico de HTTPS se muestra en la página siguiente. Como se puede observar, utiliza conceptos de cifrado con clave simétrica y asimétrica.

![](../img/https2.png)
