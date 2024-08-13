# CONCLUSIÓN

La documentación de cada proyecto describe cada una de las partes que lo compone. Se realiza desde la documentación de los requisitos hasta la documentación de la certificación pasando por software, fuente, modelo, validación, diseño, verificación y calidad.

## TERMINAL DE LINUX

### Introducción

La terminal de Linux es una herramienta poderosa que permite interactuar directamente con el sistema operativo mediante la línea de comandos. Este manual cubre desde los conceptos básicos hasta comandos avanzados y técnicas para maximizar tu eficiencia al usar la terminal.

### Fundamentos de la Terminal

#### Acceder a la Terminal

Para abrir la terminal, puedes:

- Buscar "Terminal" en tu menú de aplicaciones.
- Usar atajos de teclado como `Ctrl + Alt + T` (varía según la distribución).

#### Estructura Básica de un Comando

Un comando en la terminal tiene la siguiente estructura básica:

```bash
comando [opciones] [argumentos]
```
- **comando**: El nombre del programa o la utilidad que deseas ejecutar.
- **opciones**: Modificadores que alteran el comportamiento del comando.
- **argumentos**: Los datos sobre los que opera el comando.

### Comandos Básicos

#### Navegación del Sistema de Archivos

- `pwd`: Muestra el directorio de trabajo actual.
- `ls`: Lista el contenido del directorio.
  - `ls -l`: Lista en formato largo.
  - `ls -a`: Incluye archivos ocultos.
- `cd [directorio]`: Cambia al directorio especificado.
  - `cd ..`: Sube un nivel en la jerarquía de directorios.
  - `cd ~`: Cambia al directorio home del usuario.

#### Manipulación de Archivos y Directorios

- `cp origen destino`: Copia un archivo o directorio.
  - `cp -r origen destino`: Copia recursivamente un directorio.
- `mv origen destino`: Mueve o renombra un archivo o directorio.
- `rm archivo`: Elimina un archivo.
  - `rm -r directorio`: Elimina recursivamente un directorio.
- `mkdir nombre_directorio`: Crea un nuevo directorio.
- `rmdir nombre_directorio`: Elimina un directorio vacío.

#### Visualización y Edición de Archivos

- `cat archivo`: Muestra el contenido de un archivo.
- `less archivo`: Muestra el contenido de un archivo página por página.
- `head archivo`: Muestra las primeras líneas de un archivo.
- `tail archivo`: Muestra las últimas líneas de un archivo.
- `nano archivo`: Abre el editor de texto `nano` para editar un archivo.
- `vi archivo`: Abre el editor de texto `vi` para editar un archivo.

### Permisos y Propiedad

#### Comandos de Permisos

- `chmod modo archivo`: Cambia los permisos de un archivo o directorio.
  - `chmod 755 archivo`: Permisos de lectura, escritura y ejecución para el propietario, y lectura y ejecución para otros.
- `chown propietario:grupo archivo`: Cambia el propietario y grupo de un archivo o directorio.

#### Visualización de Permisos

- `ls -l`: Lista los archivos con sus permisos, propietario y grupo.

### Redirección y Pipes

#### Redirección

- `comando > archivo`: Redirige la salida de un comando a un archivo (sobrescribe).
- `comando >> archivo`: Redirige la salida de un comando a un archivo (añade al final).
- `comando < archivo`: Usa un archivo como entrada de un comando.

#### Pipes

- `comando1 | comando2`: Pasa la salida de `comando1` como entrada de `comando2`.

### Administración del Sistema

#### Información del Sistema

- `uname -a`: Muestra información del sistema.
- `top`: Muestra los procesos activos y el uso de recursos en tiempo real.
- `df -h`: Muestra el uso del disco.
- `free -h`: Muestra el uso de la memoria.

#### Gestión de Procesos

- `ps`: Muestra los procesos en ejecución.
  - `ps aux`: Muestra todos los procesos en detalle.
- `kill PID`: Termina un proceso por su ID.
  - `kill -9 PID`: Fuerza la terminación de un proceso.
- `pkill nombre_proceso`: Termina un proceso por su nombre.

### Comandos Avanzados

#### Búsqueda

- `find directorio -name "patrón"`: Busca archivos y directorios por nombre.
- `grep "patrón" archivo`: Busca un patrón dentro de un archivo.
  - `grep -r "patrón" directorio`: Busca recursivamente en un directorio.

#### Compresión y Descompresión

- `tar -czvf archivo.tar.gz directorio`: Crea un archivo tar comprimido.
- `tar -xzvf archivo.tar.gz`: Extrae un archivo tar comprimido.
- `zip -r archivo.zip directorio`: Crea un archivo zip.
- `unzip archivo.zip`: Extrae un archivo zip.

### Personalización y Automatización

#### Variables de Entorno

- `export VAR=value`: Establece una variable de entorno.
- `echo $VAR`: Muestra el valor de una variable de entorno.

#### Aliases

- `alias nombre='comando'`: Crea un alias para un comando.
  - `alias ll='ls -la'`: Crea un alias `ll` para `ls -la`.

#### Scripts

Puedes crear scripts para automatizar tareas repetitivas. Los scripts suelen tener la extensión `.sh` y empiezan con `#!/bin/bash` para indicar que deben ejecutarse con `bash`.

Ejemplo de script:

```bash
#!/bin/bash
echo "Hola, Mundo"
```

Para ejecutar un script:

1. Hazlo ejecutable: `chmod +x script.sh`
2. Ejecútalo: `./script.sh`

### Conclusión

La terminal de Linux es una herramienta esencial para usuarios y administradores de sistemas. Aunque puede parecer desafiante al principio, dominarla puede incrementar significativamente tu productividad y eficiencia. Este manual proporciona una base sólida para empezar a explorar y utilizar la terminal de manera efectiva.

## EDITOR `vi` DE LINUX

### Introducción

`vi` es uno de los editores de texto más populares en sistemas Unix y Linux. Es conocido por su potencia y flexibilidad. Aunque puede parecer intimidante al principio debido a su interfaz basada en comandos, una vez que te familiarizas con sus características, te permite editar archivos de manera muy eficiente.

Este manual te guiará a través de los conceptos básicos y avanzados del editor `vi`, incluyendo cómo moverse, editar texto, y usar sus diversas características.

### Iniciando `vi`

Para abrir un archivo con `vi`, usa el siguiente comando en la terminal:

```bash
vi nombre_del_archivo
```

Si el archivo no existe, `vi` lo creará cuando lo guardes.

### Modos de `vi`

`vi` tiene varios modos de operación. Los más importantes son:

1. **Modo Normal**: Es el modo predeterminado cuando inicias `vi`. En este modo, puedes moverte por el texto y ejecutar comandos.
2. **Modo de Inserción**: En este modo, puedes insertar y editar texto.
3. **Modo de Línea de Comando**: En este modo, puedes ejecutar comandos de `vi` que afectan el archivo o la sesión.

#### Cambiar entre modos

- **Modo Normal a Modo de Inserción**: Presiona `i`, `I`, `a`, `A`, `o`, o `O`.
- **Modo de Inserción a Modo Normal**: Presiona `Esc`.
- **Modo Normal a Modo de Línea de Comando**: Presiona `:`.

### Comandos de Navegación

#### Navegación Básica

- `h`: Mover el cursor a la izquierda.
- `j`: Mover el cursor hacia abajo.
- `k`: Mover el cursor hacia arriba.
- `l`: Mover el cursor a la derecha.

#### Navegación por Palabras

- `w`: Mover al inicio de la siguiente palabra.
- `b`: Mover al inicio de la palabra anterior.
- `e`: Mover al final de la palabra actual.

#### Navegación por Líneas

- `0`: Mover al inicio de la línea.
- `^`: Mover al primer carácter no en blanco de la línea.
- `$`: Mover al final de la línea.
- `G`: Mover al final del archivo.
- `gg`: Mover al inicio del archivo.

### Modo de Inserción

Para ingresar al modo de inserción desde el modo normal, puedes usar varios comandos:

- `i`: Insertar texto antes del cursor.
- `I`: Insertar texto al inicio de la línea.
- `a`: Insertar texto después del cursor.
- `A`: Insertar texto al final de la línea.
- `o`: Insertar una nueva línea debajo de la línea actual.
- `O`: Insertar una nueva línea encima de la línea actual.

### Edición de Texto

#### Borrado

- `x`: Borrar el carácter bajo el cursor.
- `dw`: Borrar desde el cursor hasta el final de la palabra.
- `dd`: Borrar la línea actual.
- `D`: Borrar desde el cursor hasta el final de la línea.

#### Copiar y Pegar

- `yy`: Copiar la línea actual (yank).
- `p`: Pegar después del cursor.
- `P`: Pegar antes del cursor.

#### Deshacer y Rehacer

- `u`: Deshacer el último cambio.
- `Ctrl + r`: Rehacer el último cambio deshecho.

### Modo de Línea de Comando

#### Guardar y Salir

- `:w`: Guardar el archivo.
- `:q`: Salir de `vi`.
- `:wq`: Guardar y salir.
- `:q!`: Salir sin guardar cambios.

#### Búsqueda

- `/texto`: Buscar `texto` hacia adelante.
- `?texto`: Buscar `texto` hacia atrás.
- `n`: Repetir la búsqueda en la misma dirección.
- `N`: Repetir la búsqueda en la dirección opuesta.

#### Reemplazo

- `:s/viejo/nuevo/`: Reemplazar la primera ocurrencia de `viejo` por `nuevo` en la línea actual.
- `:s/viejo/nuevo/g`: Reemplazar todas las ocurrencias de `viejo` por `nuevo` en la línea actual.
- `:%s/viejo/nuevo/g`: Reemplazar todas las ocurrencias de `viejo` por `nuevo` en todo el archivo.

### Configuración y Personalización

#### Ajustes Comunes

- `:set number`: Mostrar números de línea.
- `:set nonumber`: Ocultar números de línea.
- `:set ignorecase`: Ignorar mayúsculas y minúsculas en las búsquedas.
- `:set noignorecase`: No ignorar mayúsculas y minúsculas en las búsquedas.
- `:set hlsearch`: Resaltar los resultados de búsqueda.
- `:set nohlsearch`: No resaltar los resultados de búsqueda.

#### Archivos de Configuración

Puedes personalizar `vi` usando un archivo de configuración llamado `.vimrc` (para `vim`, una versión mejorada de `vi`). Algunas configuraciones útiles para `.vimrc` son:

```vim
set number           " Mostrar números de línea
syntax on            " Activar el resaltado de sintaxis
set tabstop=4        " Establecer el ancho de tabulación a 4 espacios
set shiftwidth=4     " Establecer el ancho de indentación a 4 espacios
set expandtab        " Usar espacios en lugar de tabulaciones
```

### Comandos Avanzados

#### Macro Grabación

Puedes grabar macros para repetir secuencias de comandos.

- `q<registro>`: Comenzar a grabar una macro en el registro `<registro>`.
- `<comandos>`: Ejecutar los comandos que quieres grabar.
- `q`: Terminar la grabación.
- `@<registro>`: Reproducir la macro grabada en el registro `<registro>`.

#### Comandos Externos

Puedes ejecutar comandos del sistema desde `vi`.

- `:!comando`: Ejecutar `comando` en la línea de comandos del sistema.

### Conclusión

`vi` es un editor poderoso con muchas características útiles. Al principio puede parecer complicado, pero con práctica, se puede llegar a dominar y aumentar significativamente la eficiencia en la edición de texto. Este manual cubre las funcionalidades básicas y algunas avanzadas, proporcionando una base sólida para explorar más a fondo este versátil editor.

## TERMINAL DE MACOS

### Common macOS Commands

Below are some common macOS commands, organized by general function. Bookmark this page so you can refer back to it often. Although most options to these commands are identical between Linux and macOS, be sure to view the manual page for commands that you will use in the future.

### System Documentation Commands in macOS

  * **man** Displays/searches the manual page database
  * **apropos** Searches the manual page database by keyword
  * **info** Displays/searches the info page database
  * **help** Displays help on BASH functions

### File Management Commands in macOS

  * **pwd** Displays the current directory
  * **cd** Changes the current directory
  * **ls** Lists files
  * **file** Displays file type
  * **locate** Finds files using a predefined database
  * **which** Searches the PATH variable for files
  * **find** Finds files on the filesystem based on certain criteria
  * **cp** Copies files and directories
  * **mv** Moves/renames files and directories
  * **rm** Removes files and directories
  * **rmdir** Removes empty directories
  * **mkdir** Creates empty directories
  * **ln** Creates hard links; the –s option is used to create symbolic links
  * **chown** Changes ownership for files and directories
  * **chgrp** Changes group ownership for files and directories
  * **chmod** Changes the permissions (mode) on files and directories
  * **umask** Changes the UMASK variable used to determine default permissions

### Text Tools in macOS

  * **cat** Views (concatenates) the contents of text files to the terminal screen
  * **more** Views the contents of text files page by page
  * **less** Views the contents of text files page by page with advanced text features
  * **head** Displays the beginning of a text file
  * **tail** Displays the end of a text file
  * **sort** Sorts lines in text files
  * **wc** Counts the number of lines, words and characters in a text file
  * **grep** Searches text files for regular expressions
  * **egrep** Searches text files for regular expressions (including extended ones)
  * **sed** Edits text files using search-and-replace functions
  * **awk** Edits and formats text using predefined functions
  * **vi** (vim) The vi text editor (common to all UNIX systems)
  * **emacs** The GNU Emacs text editor
  * **nano** A small easy-to-use text editor based on the UNIX pico editor

### Filesystem Administration in macOS

  * **mount** Mounts a filesystem to a mount point directory – alternatively, you can use the mount_filesystem commands (where filesystem is the name of an appropriate filesystem) – see man mount for details.
  * **umount** Unmounts a filesystem from a mount point directory
  * **pdisk** May be used to create Apple disk partitions
  * **newfs_type** Creates a new filesystem on a device (type = apfs, hfs, udf, exfat, msdos)
  * **fuser** Determines the users accessing a certain file, directory or terminal
  * **df** Displays disk free space by filesystem
  * **du** Displays disk free space by directory
  * **quota** Displays quotas for a certain user
  * **edquota** Edits user quotas
  * **repquota** Displays a report on quotas by user
  * **quotacheck** Updates quota limits on the filesystem

Disk quotas are configured differently in macOS. In Linux, you enable quotas using the appropriate option in `/etc/fstab`. However, `/etc/fstab` is not available in macOS. Instead, you must create two files in the root of the filesystem that you wish to enable quotas on (.quota.ops.user and .quota.ops.group).

### Shutdown and System State in macOS

  * **shutdown** Shuts down or reboots the system at a specified time
  * **halt** Shuts down the system immediately
  * **reboot** Reboots the system immediately

### Compression, Backup and Software in macOS

  * **compress** Compresses files using a Lempel-Ziv algorithm
  * **gzip** Compresses files using a standard Lempel-Ziv algorithm
  * **bzip2** Compresses files using a block-sorting algorithm
  * **tar** Used to create small tar archives and tarballs
  * **cpio** Used to create full filesystem backups using a variety of options
  * **make** Manages software compiling using gcc and Makefile settings
  * **gcc** The GNU C compiler used to compile software

### BASH Management in macOS

As in Linux, macOS stores its variables in environment files. The `/etc/profile` and `/etc/bashrc` files are used by default on the system. Each user can also create their own ~/.bash_profile and ~/.bashrc files. In addition, ~/.bash_logout may be used to perform tasks at shell exit. Here are more BASH management commands for macOS.

  * **set** Displays all variables in your shell
  * **env** Displays exported variables in your shell
  * **alias** Creates special alias variables
  * **unalias** Removes special alias variables
  * **export** Creates and exports variables
  * **ulimit** Sets BASH limits for users (e.g., maximum number of user processes)

### Process Management in macOS

  * **ps** Displays system and user processes (supports BSD-style options only)
  * **top** Displays top processes and system statistics
  * **kill** Sends kill signals to processes by process identification number (PID)
  * **killall** Sends kill signals to processes by name
  * **jobs** Displays background processes
  * **fg** Moves a background process to the foreground
  * **bg** Moves a foreground process to the background
  * **nice** Changes the priority of a process as it is started
  * **renice** Changes the priority of a running process
  * **at** Schedules commands to run at a later time
  * **atq** Views at jobs
  * **atrm** Removes an at job
  * **crontab** Edits user cron tables (used to repetitively schedule commands)

### User and Group Administration in macOS

User and group administration differs slightly in macOS from Linux. There are no useradd or userdel commands. Instead, you must use the System Preferences utility to create user accounts properly. User information is stored in a directory database under the /var/db directory. The `/etc/shadow` file does not exist and the `/etc/passwd` and `/etc/group` files exist only to provide information to apps.

  * **whoami** Displays the current user name
  * **who am i** Displays your username and computer information
  * **groups** Displays the current user’s group memberships
  * **id** Prints the User ID (UID) and Group IDs (GIDs) for the current user
  * **chfn** Changes the user description used by the finger command
  * **finger** Displays user description information
  * **chsh** Changes the shell for a user account
  * **passwd** Changes the password for the current user (the root user may change other user's passwords by specifying the username as an argument)
  * **who** Displays who is on the system
  * **w** Displays who is on the system and what they are doing

### Common Unix Printing System (CUPS) Printing in macOS

  * **lp** Prints a file (lpr is supported for BSD compatibility)
  * **lpstat** Views print jobs and printer status (lpq and lpc are supported for BSD compatibility)
  * **cancel** Removes a print job from the print queue (lprm is supported for BSD compatibility)
  * **cupsaccept** Allows jobs to enter a print queue
  * **cupsreject** Prevents jobs from entering a print queue
  * **cupsenable** Allows jobs to be sent to the printer from the print queue
  * **cupsdisable** Prevents jobs from leaving the print queue

### Network- and Security-related Commands in macOS

Network devices have different names in macOS. The first ethernet adapter is called en0 (typically wired ethernet), and the second is called en1 (typically wireless ethernet). Ensure that you use System Preferences to change any network parameters, as they are not stored in text files as they are on Linux systems. For example, the `/etc/resolv.conf` file still exists in macOS and lists DNS servers configured in System Preferences, but it is not used by the system – it is merely there in case an app queries it. The only network-related file that is used actively and may be edited is `/etc/hosts` (for local host name resolution). Here are more network- and security-related commands in macOS.

  * **ifconfig** Displays and configures TCP/IP network interfaces
  * **ping** Tests connectivity between hosts
  * **whois** Queries domain name registration information
  * **arp** Views and manages the address resolution protocol (ARP) cache
  * **netstat** Views TCP/IP network statistics and the routing table
  * **route** Manages the TCP/IP routing table
  * **traceroute** Traces an IP packet across routers
  * **hostname** Sets the system host name
  * **host** Resolves host names to IP addresses and vice versa
  * **nslookup** Resolves host names to IP addresses and vice versa
  * **dig** Resolves host names to IP addresses and vice versa
  * **su** Switches your user account to another account
  * **sudo** Performs tasks as another user via entries in the `/etc/sudoers` file
  * **last** Displays a detailed list of previous user logins
  * **tcpdump** Captures packets on a network interface

### System and Miscellaneous Commands in macOS

  * **date** Displays the current date and time
  * **exit** Exits out of the shell (logout)
  * **echo** argument Displays the argument to the terminal screen
  * **clear** Clears the screen
  * **uname** option Displays system information specified by the option; –a specifies all information
  * **uptime** Lists system statistics and uptime
  * **cal** Lists the calendar for the current month
  * **banner** Prints an ASCII banner
  * **iostat** Displays input/output (I/O) statistics for the system
