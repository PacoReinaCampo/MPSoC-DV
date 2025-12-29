# INTRODUCCIÓN

La documentación de cada proyecto describe cada una de las partes que lo compone. Se realiza desde la documentación de los requisitos hasta la documentación de la certificación pasando por software, fuente, modelo, validación, diseño, verificación y calidad.

## MODELO

Un modelo es una representación simplificada de algo más complejo. Puede ser físico, matemático, conceptual o de otro tipo. Los modelos se utilizan para entender, predecir o simular fenómenos del mundo real. Por ejemplo, en ciencia, un modelo puede ser una ecuación matemática que describe el crecimiento de una población. En informática, un modelo puede ser un diagrama que representa la estructura de datos de una base de datos.

### Modelo del Sistema (model)

```bash
· Crear fichero
· Definir librerias
· Definir entidad
  · Definir genéricos
  · Definir puertos
· Crear arquitectura
  · Definir tipos
  · Definir constantes
  · Definir señales
  · Instanciar componentes
  · Definir procesos FSM
    · Implementar reinicio asíncrono
      · Asignar señales de control de salida de arquitectura
      · Asignar señales de datos de salida de arquitectura
      · Asignar señales de control internas
        · Parámetros vectoriales, matriciales, tensoriales (index)
        · Control de segmentación (pipeline)
        · Control de entrada
      · Asignar señales de datos internas
        · Señales de registro de componentes
    · Implementar unidad síncrona
      · Establecer estados FSM
      · Asignar señales de control FSM
      · Asignar señales de control interno
      · Asignar señales de datos internas
      · Asignar señales de control de entrada a componente (instancia múltiple)
      · Asignar señales de datos de entrada a componente (instancia múltiple)
      · Asignar señales de datos de salida de arquitectura
  · Asignar señales de control de entrada a componente (instancia única)
  · Asignar señales de datos de entrada a componente (instancia única)
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

### Señales de Modelo

```bash
· Señales de control
  · Señal de entrada
    · Señal de entrada START
    · Señal de entrada IN_ENABLE
  · Señal de salida
    · Señal de salida READY
    · Señal de salida OUT_ENABLE
· Señales de datos
  · Señal de entrada
    · Señal de tamaño SIZE_IN
    · Señal de contenido X_IN
  · Señal de salida
    · Señal de contenido X_OUT
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

### Descripción de FSM de Modelo

0. Establecer el conjunto de estados;
1. Asignar las "señales de control de FSM" en función de las "señales de control de entrada de la entidad" y de las "señales de control de salida de los componentes instanciados";
2. Asignar las "señales de control de entrada de los componentes instanciados" fuera de la FSM si existe una única asignación o dentro de la FSM si existen múltiples asignaciones;
3. Las "señales de control de salida de los componentes instanciados" dan valor a las "señales de control de salida de la entidad" y a las "señales de control de la FSM";
4. Asignar las "señales de datos de entrada de los componentes instanciados" fuera de la FSM si existe una única asignación o dentro de la FSM si existen múltiples asignaciones;
5. Las "señales de datos de salida de los componentes instanciados" dan valor a las "señales de datos de salida de la entidad";
6. Las "señales de control de entrada de la entidad" dan valor a las "señales de control de entrada de los componentes instanciados" y a las "señales de control de la FSM";
7. Asignar las "señales de control de salida de la entidad" fuera de la FSM si existe una única asignación o dentro de la FSM si existen múltiples asignaciones;
8. Las "señales de datos de entrada de la entidad" dan valor a las "señales de datos de entrada de los componentes instanciados";
9. Asignar las "señales de datos de salida de la entidad" fuera de la FSM si existe una única asignación o dentro de la FSM si existen múltiples asignaciones.

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

## VALIDACIÓN

Es el proceso de evaluación y verificación para determinar si el hardware finalizado cumple con los requerimientos de alto nivel y si es adecuado para su uso previsto.

### Validación del Sistema (validation)

```bash
· Crear fichero
· Definir librerias
· Definir entidad
  · Definir genéricos
  · Definir puertos
· Crear arquitectura
  · Definir tipos
  · Definir constantes
  · Definir señales
  · Instanciar componentes
  · Definir procesos FSM
    · Implementar reinicio asíncrono
      · Asignar señales de control de salida de arquitectura
      · Asignar señales de datos de salida de arquitectura
      · Asignar señales de control internas
        · Parámetros vectoriales, matriciales, tensoriales (index)
        · Control de segmentación (pipeline)
        · Control de entrada
      · Asignar señales de datos internas
        · Señales de registro de componentes
    · Implementar unidad síncrona
      · Establecer estados FSM
      · Asignar señales de control FSM
      · Asignar señales de control interno
      · Asignar señales de datos internas
      · Asignar señales de control de entrada a componente (instancia múltiple)
      · Asignar señales de datos de entrada a componente (instancia múltiple)
      · Asignar señales de datos de salida de arquitectura
  · Asignar señales de control de entrada a componente (instancia única)
  · Asignar señales de datos de entrada a componente (instancia única)
```

Confirmar que el hardware diseñado y construido satisface las necesidades operativas y funcionales especificadas inicialmente para el sistema en el que será utilizado.

### Señales de Validación

```bash
· Señales de control
  · Señal de entrada
    · Señal de entrada START
    · Señal de entrada IN_ENABLE
  · Señal de salida
    · Señal de salida READY
    · Señal de salida OUT_ENABLE
· Señales de datos
  · Señal de entrada
    · Señal de tamaño SIZE_IN
    · Señal de contenido X_IN
  · Señal de salida
    · Señal de contenido X_OUT
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

### Descripción de FSM de Validación

0. Establecer el conjunto de estados;
1. Asignar las "señales de control de FSM" en función de las "señales de control de entrada de la entidad" y de las "señales de control de salida de los componentes instanciados";
2. Asignar las "señales de control de entrada de los componentes instanciados" fuera de la FSM si existe una única asignación o dentro de la FSM si existen múltiples asignaciones;
3. Las "señales de control de salida de los componentes instanciados" dan valor a las "señales de control de salida de la entidad" y a las "señales de control de la FSM";
4. Asignar las "señales de datos de entrada de los componentes instanciados" fuera de la FSM si existe una única asignación o dentro de la FSM si existen múltiples asignaciones;
5. Las "señales de datos de salida de los componentes instanciados" dan valor a las "señales de datos de salida de la entidad";
6. Las "señales de control de entrada de la entidad" dan valor a las "señales de control de entrada de los componentes instanciados" y a las "señales de control de la FSM";
7. Asignar las "señales de control de salida de la entidad" fuera de la FSM si existe una única asignación o dentro de la FSM si existen múltiples asignaciones;
8. Las "señales de datos de entrada de la entidad" dan valor a las "señales de datos de entrada de los componentes instanciados";
9. Asignar las "señales de datos de salida de la entidad" fuera de la FSM si existe una única asignación o dentro de la FSM si existen múltiples asignaciones.

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

## DISEÑO

Proceso de planificación y creación de una estructura, sistema, producto o servicio con el propósito de cumplir ciertos objetivos específicos. Puede aplicarse a una amplia gama de disciplinas y campos.

### Diseño del Sistema (rtl)

```bash
· Crear fichero
· Definir librerias
· Definir entidad
  · Definir genéricos
  · Definir puertos
· Crear arquitectura
  · Definir tipos
  · Definir constantes
  · Definir señales
  · Instanciar componentes
  · Definir procesos FSM
    · Implementar reinicio asíncrono
      · Asignar señales de control de salida de arquitectura
      · Asignar señales de datos de salida de arquitectura
      · Asignar señales de control internas
        · Parámetros vectoriales, matriciales, tensoriales (index)
        · Control de segmentación (pipeline)
        · Control de entrada
      · Asignar señales de datos internas
        · Señales de registro de componentes
    · Implementar unidad síncrona
      · Establecer estados FSM
      · Asignar señales de control FSM
      · Asignar señales de control interno
      · Asignar señales de datos internas
      · Asignar señales de control de entrada a componente (instancia múltiple)
      · Asignar señales de datos de entrada a componente (instancia múltiple)
      · Asignar señales de datos de salida de arquitectura
  · Asignar señales de control de entrada a componente (instancia única)
  · Asignar señales de datos de entrada a componente (instancia única)
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

### Señales de Diseño

```bash
· Señales de control
  · Señal de entrada
    · Señal de entrada START
    · Señal de entrada IN_ENABLE
  · Señal de salida
    · Señal de salida READY
    · Señal de salida OUT_ENABLE
· Señales de datos
  · Señal de entrada
    · Señal de tamaño SIZE_IN
    · Señal de contenido X_IN
  · Señal de salida
    · Señal de contenido X_OUT
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

### Descripción de FSM de Diseño

0. Establecer el conjunto de estados;
1. Asignar las "señales de control de FSM" en función de las "señales de control de entrada de la entidad" y de las "señales de control de salida de los componentes instanciados";
2. Asignar las "señales de control de entrada de los componentes instanciados" fuera de la FSM si existe una única asignación o dentro de la FSM si existen múltiples asignaciones;
3. Las "señales de control de salida de los componentes instanciados" dan valor a las "señales de control de salida de la entidad" y a las "señales de control de la FSM";
4. Asignar las "señales de datos de entrada de los componentes instanciados" fuera de la FSM si existe una única asignación o dentro de la FSM si existen múltiples asignaciones;
5. Las "señales de datos de salida de los componentes instanciados" dan valor a las "señales de datos de salida de la entidad";
6. Las "señales de control de entrada de la entidad" dan valor a las "señales de control de entrada de los componentes instanciados" y a las "señales de control de la FSM";
7. Asignar las "señales de control de salida de la entidad" fuera de la FSM si existe una única asignación o dentro de la FSM si existen múltiples asignaciones;
8. Las "señales de datos de entrada de la entidad" dan valor a las "señales de datos de entrada de los componentes instanciados";
9. Asignar las "señales de datos de salida de la entidad" fuera de la FSM si existe una única asignación o dentro de la FSM si existen múltiples asignaciones.

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

## VERIFICACIÓN

Es el proceso de evaluación y revisión sistemática de los productos de trabajo durante todas las etapas del ciclo de vida del desarrollo de hardware para asegurar que cumplen con los requisitos especificados.

### Verificación del Sistema (verification)

```bash
· Crear fichero
· Definir librerias
· Definir entidad
  · Definir genéricos
  · Definir puertos
· Crear arquitectura
  · Definir tipos
  · Definir constantes
  · Definir señales
  · Instanciar componentes
  · Definir procesos FSM
    · Implementar reinicio asíncrono
      · Asignar señales de control de salida de arquitectura
      · Asignar señales de datos de salida de arquitectura
      · Asignar señales de control internas
        · Parámetros vectoriales, matriciales, tensoriales (index)
        · Control de segmentación (pipeline)
        · Control de entrada
      · Asignar señales de datos internas
        · Señales de registro de componentes
    · Implementar unidad síncrona
      · Establecer estados FSM
      · Asignar señales de control FSM
      · Asignar señales de control interno
      · Asignar señales de datos internas
      · Asignar señales de control de entrada a componente (instancia múltiple)
      · Asignar señales de datos de entrada a componente (instancia múltiple)
      · Asignar señales de datos de salida de arquitectura
  · Asignar señales de control de entrada a componente (instancia única)
  · Asignar señales de datos de entrada a componente (instancia única)
```

Confirmar que el diseño, la implementación y la integración del hardware cumplen con los requisitos establecidos en los estándares de diseño.

### Señales de Verificación

```bash
· Señales de control
  · Señal de entrada
    · Señal de entrada START
    · Señal de entrada IN_ENABLE
  · Señal de salida
    · Señal de salida READY
    · Señal de salida OUT_ENABLE
· Señales de datos
  · Señal de entrada
    · Señal de tamaño SIZE_IN
    · Señal de contenido X_IN
  · Señal de salida
    · Señal de contenido X_OUT
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

### Descripción de FSM de Verificación

0. Establecer el conjunto de estados;
1. Asignar las "señales de control de FSM" en función de las "señales de control de entrada de la entidad" y de las "señales de control de salida de los componentes instanciados";
2. Asignar las "señales de control de entrada de los componentes instanciados" fuera de la FSM si existe una única asignación o dentro de la FSM si existen múltiples asignaciones;
3. Las "señales de control de salida de los componentes instanciados" dan valor a las "señales de control de salida de la entidad" y a las "señales de control de la FSM";
4. Asignar las "señales de datos de entrada de los componentes instanciados" fuera de la FSM si existe una única asignación o dentro de la FSM si existen múltiples asignaciones;
5. Las "señales de datos de salida de los componentes instanciados" dan valor a las "señales de datos de salida de la entidad";
6. Las "señales de control de entrada de la entidad" dan valor a las "señales de control de entrada de los componentes instanciados" y a las "señales de control de la FSM";
7. Asignar las "señales de control de salida de la entidad" fuera de la FSM si existe una única asignación o dentro de la FSM si existen múltiples asignaciones;
8. Las "señales de datos de entrada de la entidad" dan valor a las "señales de datos de entrada de los componentes instanciados";
9. Asignar las "señales de datos de salida de la entidad" fuera de la FSM si existe una única asignación o dentro de la FSM si existen múltiples asignaciones.

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....
