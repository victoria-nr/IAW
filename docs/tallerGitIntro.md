---
title: "Taller 1: Introducción a git y GitHub"
---

## ¿Qué vas a aprender en este taller?

* Recordar el uso de git para realizar el control de versiones de los proyectos.
* Configurar una cuenta en GitHub, servicio que nos ofrece repositorios remotos.
* Recordar el ciclo de vida de la gestión de nuestros repositorios: creación, clonación, sincronización, ... y nuestros ficheros:  creación, modificación, borrado.

## ¿Qué tienes que hacer?

1. Crea una cuenta en GitHub (**Si no la tienes!!!**). La forma de acceder a los repositorios remotos de GitHub va a ser por SSH, por lo tanto debes copiar tu clave pública RSA a GitHub, para ello:
	* Copia el contenido de tu fichero `~/.ssh/id_rsa.pub`, para ello: añade una nueva clave SSH en el apartado "SSH keys" de tu perfil en GitHub y pega el contenido de tu clave pública.
	* Si no tienes ese fichero, puedes generar una nueva clave ssh pública: [http://librosweb.es/pro_git/capitulo_4/generando_tu_clave_publica_ssh.html](http://librosweb.es/pro_git/capitulo_4/generando_tu_clave_publica_ssh.html).

2. Crea en GitHub un repositorio con el nombre **prueba_tu_nombre** (inicializa el repositorio con un fichero README) y la descripción **Repositorio de prueba 2ASIR**.

3. Instala git en tu ordenador (**si no lo tienes instalado!!!**).

		apt-get install git

4. Configuración de git. Lo primero que deberías hacer cuando instalas Git es establecer tu nombre de usuario y dirección de correo electrónico (**Asegurate que los datos son correctos y que has puesto tu nombre completo**). Esto es importante porque las confirmaciones de cambios (commits) en Git usan esta información, y es introducida de manera inmutable en los commits que envías:

		git config --global user.name "John Doe"
		git config --global user.email johndoe@example.com

	De nuevo, sólo necesitas hacer esto una vez si especificas la opción `--global`, ya que Git siempre usará esta información para todo lo que hagas en ese sistema.

5. Clonar el repositorio remoto. Copia la url SSH del repositorio (**no copies la URL https**) y vamos a clonar el repositorio en nuestro ordenador.

		git clone git@github.com:xxxxxxx/xxxxxxx.git

	Comprueba que dentro del repositorio que hemos creado se encuentra el fichero README.md, en este fichero podemos poner la descripción del proyecto.

6. Vamos a crear un nuevo fichero, lo vamos a añadir a nuestro repositorio local y luego lo vamos a sincronizar con nuestro repositorio remoto de GitHub. Cada vez que hagamos una modificación en un fichero lo podemos señalar creando un commit. Los mensajes de los commits son fundamentales para explicar la evolución de un proyecto. Un commit debe ser un conjunto pequeño de cambios de los ficheros del proyecto con una cierta coherencia.

		echo "Esto es una prueba">ejemplo.txt
		git add ejemplo.txt
		git commit -m "He creado el fichero ejemplo.txt"
		git push

7. Si modificas un fichero en tu repositorio local, no tienes que volver a añadirlo a tu repositorio (`git add`). Pero tienes que usar la opción -a al hacer el commit.

		git commit -am "He modificado el fichero ejemplo.txt"
		git push

8. Si quieres cambiar el nombre de un fichero o directorio de tu repositorio:

		git mv ejemplo.txt ejemplo2.txt
		git commit -am "He cambiado el nombre del fichero"
		git push

9. Si quieres borrar un fichero de tu repositorio:

		git rm ejemplo2.txt
		git commit -am "He borrado el fichero ejemplo2"
		git push

10. Puedes clonar tu repositorio de GitHub en varios ordenadores (por ejemplo, si quieres trabajar en tu casa y en el instituto), por lo tanto antes de trabajar en un repositorio local tienes que sincronizar los posibles cambios que se hayan producido en el repositorio remoto, para ello:

		git pull

11. Para comprobar el estado de mi repositorio local:

		git status


!!!Task "¿Qué tienes que entregar?"
    1. Una captura de pantalla donde se vea que has creado el repositorio.
    2. El contenido del fichero `.git/config` para que se vea que has clonado el repositorio con la URL ssh.
    3. La salida de la instrucción `git log` para ver los commits que has realizado (debe aparecer como autor tu nombre completo).
    4. Buscar información para crear un nuevo repositorio llamado **prueba2_tu_nombre**. En esta ocasión, crea primero el repositorio local (usando `git init`) y luego busca información para sincronizarlo y crear el repositorio remoto en GitHub. Comenta los pasos que has realizado y manda alguna prueba de funcionamiento.
