# Extensión de la práctica "Implantación de la aplicación PHP BookMedik"

## Cómo eliminar credenciales “hardcodeadas” con `config.ini`

### Introducción

En la primera parte de la práctica habéis dejado “fijos” (hardcodeados) en el código PHP los datos de conexión a la base de datos (`host`, `usuario`, `contraseña`, `nombre de BD`).  
Eso funciona para una prueba rápida, pero **no es una buena práctica** por varias razones:

1. **Inseguridad:** si ese fichero se sube a un repositorio público o se comparte, las credenciales quedan expuestas.  
2. **Falta de portabilidad:** si movéis la aplicación a otro servidor o cambiáis la contraseña, hay que editar el código y volver a desplegar.  
3. **Mantenimiento difícil:** mezclar la lógica de la aplicación con la configuración impide tener entornos distintos (desarrollo, pruebas, producción) de forma limpia y segura.

La solución profesional consiste en **separar la configuración del código**.  
En esta extensión aprenderéis a guardar los parámetros de conexión en un fichero externo llamado **`config.ini`**, y a leerlo desde PHP utilizando la función nativa `parse_ini_file()`.

De esta forma:
- El código PHP no contiene contraseñas ni configuraciones.
- Podréis modificar los parámetros de conexión sin tocar el código.
- Podréis proteger el fichero de configuración para que sólo el servidor web pueda leerlo.

---

### Pasos a seguir

#### 1. Hacer una copia de seguridad del fichero actual

Antes de modificar nada, guarda una copia del archivo original por si necesitas volver atrás.

```bash
sudo cp /var/www/bookmedik/core/controller/Database.php         /var/www/bookmedik/core/controller/Database.php.bak
```

---

#### 2. Crear el fichero de configuración `config.ini`

Crea el fichero en la **raíz del proyecto** (junto a `core/`, `index.php`, etc.).

```bash
sudo tee /var/www/bookmedik/config.ini > /dev/null << 'EOF'
[database]
host = localhost
name = bookmedik
user = bookmedik_user
pass = bookmedik_pass
charset = utf8mb4
EOF
```

---

#### 3. Proteger el fichero de configuración (permisos)

Haz que el fichero pertenezca al usuario y grupo del servidor web (`www-data`) y que no sea legible por otros usuarios del sistema.

```bash
sudo chown www-data:www-data /var/www/bookmedik/config.ini
sudo chmod 640 /var/www/bookmedik/config.ini
```

---

#### 4. Ignorar `config.ini` en Git para no subir credenciales

Añade una entrada a `.gitignore` en la raíz del proyecto.  
Si el archivo no existe, créalo.

```bash
sudo bash -c 'echo "/config.ini" >> /var/www/bookmedik/.gitignore'
```

---

#### 5. Modificar `Database.php` para leer `config.ini`

Edita el fichero que establece la conexión a la base de datos.

```bash
sudo nano /var/www/bookmedik/core/controller/Database.php
```

Busca la línea donde aparece algo parecido a:

```php
$con = new mysqli("localhost", "bookmedik_user", "bookmedik_pass", "bookmedik");
```

y reemplázala por el siguiente bloque de código:

```php

// Ruta al fichero de configuración (subimos dos niveles desde este archivo)
$configPath = __DIR__ . '/../../config.ini';

// Comprobamos que existe y se puede leer
if (!is_readable($configPath)) {
    die('Falta el fichero de configuración config.ini o no tiene permisos de lectura.');
}

// Leemos el fichero de configuración
$cfg = parse_ini_file($configPath, true, INI_SCANNER_TYPED);
$db  = $cfg['database'] ?? [];

// Cargamos los parámetros con valores por defecto por si faltan
$host    = $db['host']    ?? 'localhost';
$dbname  = $db['name']    ?? 'bookmedik';
$user    = $db['user']    ?? 'bookmedik_user';
$pass    = $db['pass']    ?? 'bookmedik_pass';
$charset = $db['charset'] ?? 'utf8mb4';

// Creamos la conexión
$con = new mysqli($host, $user, $pass, $dbname);
if ($con->connect_error) {
    die('Error de conexión a la base de datos: ' . $con->connect_error);
}

// Establecemos el juego de caracteres
if (!$con->set_charset($charset)) {
    error_log('No se pudo establecer el charset ' . $charset . ': ' . $con->error);
}
```
---

#### 6. Verificar que PHP puede leer el fichero

Comprueba que el usuario del servidor web (`www-data`) tiene acceso al fichero:

```bash
sudo -u www-data php -r 'echo is_readable("/var/www/bookmedik/config.ini") ? "OK\n" : "NO\n";'
```

El resultado debe ser `OK`.

---

#### 7. Probar la aplicación en el navegador

Abre la aplicación en el navegador:

```
http://bookmedik.tunombre.org
```

La aplicación debería cargarse igual que antes.  
Si aparece un error, revisa los mensajes y asegúrate de que el fichero `config.ini` contiene los datos correctos de la base de datos.

---

#### 8. (Opcional) Crear un ejemplo de plantilla `config.example.ini`

Este fichero sirve como plantilla para que otros usuarios sepan qué claves deben incluir en `config.ini`, sin mostrar contraseñas reales.

```bash
sudo tee /var/www/bookmedik/config.example.ini > /dev/null << 'EOF'
[database]
host = localhost
name = bookmedik
user = <usuario_aqui>
pass = <contraseña_aqui>
charset = utf8mb4
EOF
```

Este archivo **sí puede subirse al repositorio** porque no contiene información sensible.

---

## Resolución de problemas


### “Error de conexión a la base de datos”
Verifica que el usuario, la contraseña y el nombre de la base de datos en `config.ini` son correctos:
```bash
mariadb -u bookmedik_user -p -e "USE bookmedik; SHOW TABLES;"
```

### Cambiar la contraseña de la base de datos
Si cambias la contraseña del usuario de MySQL/MariaDB, sólo tendrás que editar `config.ini`:
```bash
sudo nano /var/www/bookmedik/config.ini
```
