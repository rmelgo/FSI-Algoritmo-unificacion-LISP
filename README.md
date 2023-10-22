# FSI-Algortimo-unificacion-LISP

![inicio](https://github.com/rmelgo/FSI-Algortimo-unificacion-LISP/assets/145989723/5e134162-4ee5-4076-a883-713310dd6787)


# - Introducción

Programa realizado en la asignatura de Fundamentos de Sistemas Inteligentes del grado de Ingenieria Informática de la Universidad de Salamanca. El enunciado del programa se encuentra subido en el repositorio en un archivo PDF llamado *enunciadoLISP.pdf*.

El principal objetivo de este programa es la realización de un programa en el lenguaje LISP que implemente el algortimo de unificación.
De esta manera, el objetivo es la implementación del algortimo de unificación que nos permita conocer si 2 sentencias son unificables o no, y en el caso de serlas, proporcionar las sustituciones necesarias para la unificación.

# - Comentarios sobre el entorno de ejecución

Para ejecutar este programa, se requerira de una distribución del Sistema Operativo **GNU/Linux**.    

Para poder ejecutar correctamente el programa, se deberá tener instalada una version del entorno de LISP llamada **clisp**. En el caso de no tener clisp, se puede instalar facilmente con el siguiente comando:

```sudo apt install clisp```

# - Parámetros (sintáxis) de ejecución


# Comentarios sobre el material adjuntado

El programa cuenta con los siguientes ficheros:

- Un fichero llamado ***unificacion.lsp*** que contiene el esqueleto del algoritmo de unificación. Dentro de este esqueleto, se llamarán a funciones auxiliares que permiten la realizar la implementación del algoritmo de unificación.
- Un fichero llamado ***atomo.lsp*** que contiene una función atomo que evalua si la expresión pasada como parámetro se trata de un atomo.
- Un fichero llamado ***comprobaciones.lsp*** que contiene una función comprobaciones que realiza las comprobaciones de las líneas 2-12 del algoritmo de unificación.
- Un fichero llamado ***aplicar.lsp*** que contiene una función aplicar que realiza la operación aplicar sobre las expresiones pasadas como parámetro.
- Un fichero llamado ***componer.lsp*** que contiene una función componer que realiza la operación componer sobre las expresiones pasadas como parámetro.
- Un fichero llamado ***pruebas*** que contiene instrucciones para cargar todos los modulos .lsp para implementar el algoritmo de unificación junto con una serie de pruebas del algoritmo de unificación con distintas expresiones de entrada.
 
# - Pasos necesarios para ejecutar el programa

**Paso 1: Ejecutar el entorno de clisp**  

Para ello, se debe introducir el siguiente comando:    

```clisp```

Al ejecutar este comando, si iniciará el entorno de clisp correctamente.

**Paso 2: Cargar todos los ficheros .lsp en el entorno clisp**  

Para ello, se debe introducir el siguiente comando:    

```(load "pruebas")```

Tras ejecutar este comando, se ejecutarán las ordenes necesarias para cargar todos los modulos del programa (*unificacion.lsp*, *atomo.lsp*, *comprobaciones.lsp*, *aplicar.lsp* y *componer.lsp*) en el entorno de clisp.

**Paso 3: Ejecutar el algoritmo de unificación con 2 expresiones cualesquiera**  

Para ello, se debe introducir el siguiente comando:    

```(unificar <expresion1> <expresion2>)```

Tras ejecutar este comando, se ejecutará el algoritmo de unificación sobre las expresiones pasadas como parámetro. Se devolverá NIL en el caso de que las expresiones no sean unificables y una lista con las sustituciones necesarias para la unificación en el caso de que las expresiones sean unificables.

# - Ejemplo de ejecución


