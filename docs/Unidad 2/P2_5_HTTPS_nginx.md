# Practica 2.5 - Activación HTTPS en proxy inverso NGINX

## Requisitos antes de comenzar la práctica

!!!danger "Atención, muy importante antes de comenzar"

    + La práctica 2.4 ha de estar funcionando correctamente
    + No comenzar la práctica antes de tener la 2.4 ***funcionando y comprobada***

## Introducción

Como vimos en la teoría el protocolo HTTP es un procotoco inseguro ya que las comunicaciones entre cliente web y servidor web no están cifradas. Por tanto, no podemos tener la seguridad de que la página que estamos visualizando no ha sido modificada en el trayecto del servidor al cliente. Gracias a HTTPS, las comunicaciones están cifradas mediante un certificado SSL/TSL. Veamos cómo hacer que las comunicaciones en el escenario que definimos en la práctica anterior estén cifradas.


### Certificados

HTTPS se basa en el uso de certificados digitales. 

Grosso modo, cuando entramos en una web vía HTTPS, esta nos presenta un certificado digital para asegurar que es quién dice ser. ¿Cómo sabemos que ese certificado es válido? Debemos consultar a la Autoridad de Certificación (CA) que emitió ese certificado si es válido. 

Las CA son entidades que emiten certificados y su funcionamiento se basa en la confianza. Confiamos en que los certificados emitidos y firmados por esas entidades son reales y funcionales.  

![](P2_4/4.1-17.png)

Los navegadores web tienen precargadas las Autoridades de Certificación en las que confían por defecto a la hora de navegar por webs HTTPS: 

![](P2_4/4.1-18.png)

Si accedemos a una web cuyo certificado no haya sido emitido y firmado por una de estas entidades, nos saltará el famoso aviso: 

![](P2_4/4.1-19.png)

Ya que si el certificado no ha sido emitido y firmado por una CA de confianza, puede que se trate de una web maliciosa que nos suponga un riesgo de seguridad, como bien dice el aviso. 

## Tarea

A partir de las prácticas anteriores hemos llegado a un escenario donde un proxy inverso actúa de intermediario entre el cliente y un servidor web Nginx.

Ya dijimos que una importante función que podía tener un proxy inverso era realizar el cifrado y descifrado de SSL para utilizar HTTPS en los servidores web. De esta forma se aliviaba la carga de trabajo de los servidores web, ya que es una tarea que consume recursos.

Podría llegarse a pensar que en términos de seguridad no es adecuado que el tráfico de red entre el proxy inverso y el servidor web vaya sin cifrar (HTTP). Sin embargo, pensando en un caso real, la red privada y el proxy inverso, además de estar en la misma red privada, suelen estar administrados por las mismas personas de la misma empresa, por lo que no supone un peligro real que ese tráfico vaya sin cifrar.

Podría cifrarse si fuera necesario, pero entonces pierde sentido que el proxy inverso se encargue del cifrado SSL para HTTPS, ya que haríamos el mismo trabajo dos veces.

En definitiva, tendríamos un esquema como el siguiente:

![](P2_4/p2.3https.png)


### Creación de certificado autofirmado 

Nosotros no utilizaremos certificados de ninguna CA de confianza, básicamente porque: 

+ Nuestros servicios no están publicados en Internet 

+ Estos certificados son de pago 
  
Así pues, nosotros crearemos nuestros propios certificados y los firmaremos nosotros mismos como si fuéramos una CA auténtica para poder simular este escenario.

!!!warning
    Esto provocará que cuando accedamos por HTTPS a nuestro sitio web por primera vez, nos salté el aviso de seguridad que se comentábamos en la introducción. 

En este caso no habrá peligro, puesto que estamos 100% seguros que ese certificado lo hemos emitido nosotros para esta práctica, no hay dudas. 

Veamos pues el proceso para generar los certificados y las claves asociadas a ellos (privada/pública). En primer lugar, en el servidor que hace de proxy inverso debemos crear el siguiente directorio: 

```/etc/nginx/ssl```

Podemos crear el certificado y las claves de forma simultánea con un único comando, donde: 

  + **`openssl`**: esta es la herramienta por línea de comandos básica para crear y administrar certificados, claves y otros archivos OpenSSL. 

  + **`req`**: este subcomando se utiliza para generar una solicitud de certificados y también solicitudes de firma de certificados (CSR). 

  + **`-x509`**: Esto modifica aún más el subcomando anterior al decirle a la herramienta que queremos crear un certificado autofirmado en lugar de generar una solicitud de firma de certificado, como sucedería normalmente. 

  + **`-nodes`**: Esto le dice a OpenSSL que omita la opción de asegurar nuestro certificado con contraseña. Necesitamos que Nginx pueda leer el archivo sin la intervención del usuario cuando se inicia el servidor. Una contraseña evitaría que esto sucediera ya que tendríamos que introducirla a mano después de cada reinicio. 

  + **`-days 365`**: esta opción establece el tiempo durante el cual el certificado se considerará válido. Lo configuramos para un año. 

  + **`-newkey rsa: 2048`** : Esto especifica que queremos generar un nuevo certificado y una nueva clave al mismo tiempo. No creamos la clave necesaria para firmar el certificado en un paso anterior, por lo que debemos crearla junto con el certificado. La parte rsa:2048 le dice que cree una clave RSA de 2048 bits de longitud. 

  + **`-keyout`**: este parámetro le dice a OpenSSL dónde colocar el archivo de clave privada generado que estamos creando. 

  + **`-out`**: Esto le dice a OpenSSL dónde colocar el certificado que estamos creando. 

El comando completo sería así: 

![](P2_4/4.1-22.png)

Os solicitará que introduzcáis una serie de parámetros. Introduce los parámetros que se adecuen a nuestro contexto y, en concreto en los últimos:

  + Organizational Unit Name:   `2ASIX – IAW`
  + Common Name: `Tu nombre`
  + Email Address: `Tu email`

Si no te ha dado ningún error comprueba los archivos creados en `etc/nginx/ssl` y el contenido de cada uno de ellos.

### Configuración SSL en el proxy inverso

De la práctica anterior, dentro del directorio `/etc/nginx/sites-available` ya debéis tener el archivo de configuración llamado `ejemplo-proxy`. Es precisamente aquí donde realizaremos la configuración para que el acceso al sitio web se realice mediante SSL (HTTPS). 

Dentro del bloque `server {…}` debéis cambiar el puerto de escucha (`listen 80`) por lo que véis en la imagen de abajo, añadiendo las siguientes líneas de configuración también, de tal forma que quede: 

```
        listen 443 ssl;
        ssl_certificate /etc/nginx/ssl/server.crt;
        ssl_certificate_key     /etc/nginx/ssl/server.key;
        ssl_ciphers 'TLS_AES_128_GCM_SHA256:TLS_AES_256_GCM_SHA384:TLS_CHACHA20_POLY1305_SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-RSA-CHACHA20-POLY1305-SHA256:ECDHE-RSA-AES128-SHA256:ECDHE-RSA-AES256-SHA384';
        ssl_protocols TLSv1.2 TLSv1.3;
        access_log /var/log/nginx/https_access.log;
```

Donde le estáis diciendo que: 

  + Escuche en el puerto 443 → Puerto por defecto de HTTPS 

  + El directorio donde está el certificado que habéis generado anteriormente 

  + El directorio donde está la clave que habéis generado anteriormente 

  + Los protocolos y tipos de cifrados que se pueden utilizar → Estas son las versiones de protocolos y los tipos de cifrados considerados seguros a día de hoy (hay muchos más pero no se consideran seguros actualmente) 

  + `server_name` ya lo teníais de la práctica anterior, no hace falta tocarlo 

  + El archivo donde se guardan los logs cambia de nombre, ahora será https_access.log 

Recordad que tras modificar cualquier configuración de un servicio, hay que reiniciar el servicio, en este caso Nginx. 

### Comprobaciones

+ Si accedéis ahora a `https://ejemplo-proxy` os debería saltar un aviso de seguridad debido a que nuestro certificado es autofirmado, como comentábamos anteriormente. 
  
+ Si añadís una excepción podréis acceder al sitio web mediante HTTPS.

+ Para comprobar que los datos del certificado son, efectivamente, los vuestros podéis comprobarlo así. Pulsando en el candado de la barra de búsqueda: 

![](P2_4/4.1-24.png)

Podéis ver también el certificado:

![](P2_4/4.1-26.png)

Y finalmente accedemos a nuestra web:

![](P2_4/4.1-27.png)

Si ahora intentáis acceder a **`http://ejemplo-proxy`**, ¿deberíais poder acceder? Comprobadlo y describid qué pasa y por qué. 


### Redirección forzosa a HTTPS 

Para que, indistintamente de la forma por la que accedamos al sitio web, siempre se fuerce a utilizar HTTPS, necesitaremos una configuración adicional. 

Necesitamos añadir un bloque “server” adicional y separado del otro, al archivo de configuración de “ejemplo-proxy”. Algo así: 

```
server {
        listen 80;
        server_name ejemplo-proxy;
        access_log /var/log/nginx/http_access.log;
        return 301 https://ejemplo-proxy$request_uri;
}
```

Con esta configuración le estamos diciendo que: 

  + Escuche en el puerto 80 (HTTP) 

  + Que el nombre al que responderá el servidor/sitio web es `ejemplo-proxy` 

  + Que guarde los logs de este bloque en ese directorio y con ese nombre 

  + Cuando se recibe una petición con las dos condiciones anteriores, se devuelve un código HTTP 301: 

    + **HTTP 301 Moved Permanently** (Movido permanentemente en español) es un código de estado de HTTP que indica que el host ha sido capaz de comunicarse con el servidor pero que el recurso solicitado ha sido movido a otra dirección permanentemente. Es muy importante configurar las redirecciones 301 en los sitios web y para ello hay diferentes métodos y sintaxis para realizar la redirección 301. 

    + La **redirección 301** es un código o comando insertado por un Webmaster que permite redirigir a los usuarios y buscadores de un sitio web de un sitio a otro. 

    !!!Note "Aclaración" 
        Es decir, lo que estamos haciendo es que cuando se reciba una petición HTTP (puerto 80) en `http://ejemplo-proxy`, se redirija a `https://ejemplo-proxy` (HTTPS).

!!!task "Tarea"
    + Eliminad del otro bloque `server{…}` la líneas que hagan referencia a escuchar en el puerto 80 (listen 80…). 

    + Reiniciad el servicio 

    + Comprobad ahora que cuando entráis en `http://ejemplo-proxy`, automáticamente os redirige a la versión segura de la web. 

    + Comprobad que cuando realizáis una petición en el archivo de log `http_access.log` aparece la redirección 301 y que, de la misma manera, aparece una petición GET en `https_access.log`. 

<!--
## Evaluación

| Criterio      | Puntuación                         |
| :--------- | :----------------------------------: |
|  Configuración correcta y completa del servidor web   |**2 puntos**  |
|  Configuración correcta y completa del proxy inverso| **2 puntos** |
| Creación correcta del certificado    |**1 puntos**  |
| Configuración SSL correcta del proxy  | **2 puntos** |
|Comprobaciones | **1 puntos**|
| Configuración correcta de la redirección forzosa a HTTPS y comprobaciones | **1 puntos**|
| Se ha prestado especial atención al formato del documento, haciendo un correcto uso del lenguaje técnico |**1 puntos** |
-->
<!--
## Cuestiones finales

!!!Task "Cuestión 1"
    Hemos configurado nuestro servidor con todo lo que nos hace falta pero no nos funciona y da un error del tipo `This site can't provide a secure connection, ERR_SSL_PROTOCOL_ERROR.`
    
    Dentro de nuestro server block tenemos esto:
    
    ```aconf
	server {
		listen 443;
		ssl_certificate /etc/nginx/ssl/enrico-berlinguer/server.crt;
		ssl_certificate_key /etc/nginx/ssl/enrico-berlinguer/server.key;
		ssl_protocols TLSv1.3;
		ssl_ciphers ECDH+AESGCM:DH+AESGCM:ECDH+AES256:DH+AES256:ECDH+AES128:DH+AES:ECDH+3DES:DH+3DES:RSA+AESGCM:RSA+AES:RSA+3DES:!aNULL:!MD5:!DSS;
		server_name enrico-berlinguer;
		access_log /var/log/nginx/https_access.log;
    ...
    
    }
    ```
    

!!!Task "Cuestión 2"
    Imaginad que intentamos acceder a nuestro sitio web HTTPS y nos encontramos con el siguiente error:
    
    ![](../P2_4/Your-connection-isnt-private-NET-ERR_CERT_REVOKED.png)

    Investigad qué está pasando y como se ha de solucionar.

-->