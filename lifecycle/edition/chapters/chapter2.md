# COMPONENTES

La documentación de cada proyecto se divide en tres elementos:

* Carpeta "doc";
* Contenido "wiki";
* Fichero "readme".

## CARPETA "doc"

La organización y manipulación de la estructura de almacenamiento de datos en un sistema de archivos de computadora. Aquí te explico los conceptos básicos y las operaciones comunes relacionadas con estos elementos:

### Directorios (Carpetas)

1. **Definición**: Un directorio, también conocido como carpeta, es una ubicación específica en el sistema de archivos donde se pueden almacenar ficheros y otros directorios.

2. **Jerarquía**: Los directorios pueden contener otros directorios (subdirectorios) y ficheros, lo que permite una estructura jerárquica que organiza y gestiona los datos de manera eficiente.

3. **Operaciones comunes**:

   * **Crear directorios**: Se crea un nuevo directorio utilizando comandos específicos del sistema operativo o mediante interfaces gráficas.
   * **Eliminar directorios**: Se elimina un directorio vacío o con su contenido utilizando comandos o la interfaz gráfica.
   * **Navegar entre directorios**: Se accede a diferentes directorios para ver y manipular su contenido.
   * **Mover y renombrar directorios**: Se cambia la ubicación o el nombre de un directorio.
   * **Listar contenido**: Se muestra una lista de ficheros y subdirectorios dentro de un directorio específico.

### Ficheros (Archivos)

1. **Definición**: Un fichero es una unidad de almacenamiento que contiene datos o información en formato digital. Puede contener texto, imágenes, programas ejecutables, entre otros tipos de datos.

2. **Tipos de ficheros**:

   * **Ficheros de texto**: Contienen texto sin formato, como documentos escritos en un editor de texto.
   * **Ficheros binarios**: Contienen datos en un formato que no es legible directamente para humanos, como programas ejecutables o imágenes.
   * **Ficheros multimedia**: Contienen datos de audio, video o imágenes.
   * **Ficheros de configuración**: Contienen ajustes y configuraciones para programas y sistemas.

3. **Operaciones comunes**:

   * **Crear ficheros**: Se crea un nuevo fichero especificando su nombre y ubicación.
   * **Eliminar ficheros**: Se elimina un fichero específico del sistema de archivos.
   * **Copiar ficheros**: Se duplica un fichero en una ubicación diferente.
   * **Mover y renombrar ficheros**: Se cambia la ubicación o el nombre de un fichero existente.
   * **Editar ficheros**: Se modifica el contenido de un fichero utilizando editores de texto o herramientas específicas para su tipo.
   * **Leer y escribir ficheros**: Se accede al contenido de un fichero para leerlo o modificarlo según sea necesario.

### Gestión en Sistemas Operativos

- **Interfaz gráfica de usuario (GUI)**: Muchos sistemas operativos proporcionan una interfaz gráfica para la gestión de directorios y ficheros, permitiendo a los usuarios realizar operaciones a través de clics y arrastres.
  
- **Línea de comandos (CLI)**: Los sistemas operativos también ofrecen interfaces de línea de comandos donde los usuarios pueden utilizar comandos específicos para crear, mover, copiar, eliminar y gestionar directorios y ficheros de manera más rápida y automatizada.

### Importancia

La gestión adecuada de directorios y ficheros es crucial para mantener la organización y la accesibilidad de los datos en un sistema informático. Permite a los usuarios y aplicaciones almacenar, recuperar y gestionar información de manera eficiente y segura, facilitando la administración de recursos digitales en entornos personales y empresariales.

## CONTENIDO "wiki"

Wiki se refiere a un estilo de marcado o formato de texto utilizado en sistemas de gestión de contenido colaborativo, como Wikipedia y otros sitios wiki. Aquí hay algunos puntos clave sobre el formato wiki:

1. **Sintaxis simplificada**: Utiliza una sintaxis sencilla que permite a los usuarios escribir y editar páginas sin necesidad de conocimientos avanzados de programación o diseño web. Por lo general, se basa en el uso de caracteres especiales para estructurar el contenido.

2. **Hipervínculos y enlaces**: Los enlaces y las referencias cruzadas son elementos fundamentales del formato wiki. Normalmente, se crean utilizando dobles corchetes `[[]]` alrededor del texto que se desea vincular a otra página dentro del mismo wiki.

3. **Encabezados y listas**: Permite la creación de encabezados y listas mediante el uso de caracteres como `== Encabezado ==` para encabezados de sección y `*` para listas con viñetas.

4. **Negritas y cursivas**: Para destacar texto, se utilizan comillas simples (`'`) para cursivas y comillas dobles (`"`) para negritas en algunos formatos wiki, mientras que en otros se usan asteriscos (`*`) para cursivas y dobles asteriscos (`**`) para negritas.

5. **Tablas**: Algunos sistemas wiki admiten la creación de tablas utilizando un formato específico que puede incluir barras verticales (`|`) para delimitar celdas y filas.

6. **Imágenes y archivos adjuntos**: Los wikis frecuentemente permiten la inclusión de imágenes y otros archivos multimedia, utilizando una sintaxis específica para enlazar o insertar estos elementos en las páginas.

7. **Historial de revisiones**: Uno de los aspectos clave de los sistemas wiki es la capacidad de realizar un seguimiento de las revisiones de las páginas. Cada cambio queda registrado con detalles como el autor, la fecha y una descripción del cambio realizado.

El formato wiki es especialmente útil para la creación de contenido colaborativo y la gestión de conocimientos, ya que facilita la edición por parte de múltiples usuarios y proporciona una estructura clara para organizar la información.

## FICHERO "readme.md"

Markdown es un lenguaje de marcado ligero y fácil de usar que permite formatear texto de manera sencilla, diseñado originalmente por John Gruber y Aaron Swartz. Aquí están los puntos clave sobre el formato Markdown:

1. **Sintaxis simple**: Markdown utiliza caracteres simples y familiares del teclado para aplicar formato al texto. Esto hace que sea fácil de aprender y de escribir, sin necesidad de conocimientos avanzados de HTML u otros lenguajes de marcado.

2. **Encabezados**: Para crear encabezados, se utilizan uno o más símbolos `#` al inicio de la línea. Cuantos más `#` haya, más pequeño será el encabezado. Por ejemplo:

   ```bash
   # Encabezado 1
   ## Encabezado 2
   ### Encabezado 3
   ```

3. **Estilos de texto**: 

   * Para texto en **negrita**, se utilizan dos asteriscos `**` o dos guiones bajos `__` alrededor del texto.
   * Para texto en *cursiva*, se utilizan un asterisco `*` o un guion bajo `_` alrededor del texto.
   * Ejemplo:

     ```bash
     **texto en negrita**
     *texto en cursiva*
     ```

4. **Listas**: Markdown permite crear listas ordenadas (numeradas) y no ordenadas (viñetas). Para listas no ordenadas se utilizan asteriscos `*`, guiones `-` o signos más `+`, y para listas ordenadas se usa simplemente el número seguido de un punto.

   ```bash
   * Elemento 1
   * Elemento 2
      * Subelemento A
      * Subelemento B
   1. Primer elemento
   2. Segundo elemento
   ```

5. **Enlaces e imágenes**: 
   * Para crear enlaces, se encierra el texto del enlace entre corchetes `[ ]` y la URL entre paréntesis `( )`.
   * Para insertar imágenes, se utiliza un formato similar al de los enlaces, pero precedido de un signo de exclamación `!`.

   ```bash
   [Texto del enlace](http://ejemplo.com)
   ![Texto alternativo](ruta/a/la/imagen.jpg)
   ```

6. **Bloques de código**: Para incluir bloques de código o texto preformateado, se utiliza el símbolo de comillas invertidas triples ``` ``` al inicio y al final del bloque.

   ```bash
   Código aquí
   ```

7. **Citas**: Para citar texto, se utiliza el símbolo `>` al principio de la línea.

   ```bash
   > Esto es una cita.
   ```

Markdown es ampliamente utilizado en plataformas web y en sistemas de gestión de contenido debido a su simplicidad y versatilidad. Es particularmente útil para escribir documentos rápidamente, formatear mensajes en foros, y crear contenido para blogs y sitios web estáticos. Además, muchas plataformas de colaboración y control de versiones, como GitHub y GitLab, utilizan Markdown para formatear textos en comentarios y documentación.
