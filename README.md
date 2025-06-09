# Tarea 4: Scheme

## Autor
Javiera Constanza Ibaca Morales  
Rol: 202273624-0

## Descripción
Esta tarea consiste en la implementación de varias funciones en el lenguaje Scheme (Racket), con diferentes técnicas de programación funcional como recursión, procesamiento de listas y funciones de orden superior.

## 🛠️ Requisitos del Sistema

### Dependencias
- DrRacket (versión 8.0+)

## 📁 Estructura del Código

El proyecto está organizado de la siguiente manera:  
```
> 📁 Tarea4LP_202273624-0  
   ┣ 📄 P1.rkt                       Función `coincide?` que verifica si un número dado coincide con la cantidad de elementos en una lista.
   ┃
   ┣ 📄 P2.rkt                      ;;Implementación de dos funciones de procesamiento de listas:  
   ┃  ┣ `mezclador-gourmet-simple`   ;;Procesa elementos de adentro hacia afuera
   ┣  ┗ `mezclador-gourmet-cola`     ;; Procesa elementos de izquierda a derecha  
   ┃ 
   ┣ 📄 P3.rkt                      ;; Función `secuencia-rotacional` que aplica una secuencia de funciones a una lista de ingredientes, acumulando resultados.   
   ┃
   ┣ 📄 P4.rkt                      ;; Función `busqueda-almacen` que busca todas las rutas hacia un producto en un árbol que representa un almacén.
   ┃
   ┣ 📄 README.md                   ;; Este archivo
   ┃
   ┗ 📄 Ejemplos.txt                ;; ejemplos utilizados para cada archivo .rkt
```
## 🧩 Estructuras de Datos y Patrones de Diseño
- **Listas simples y anidadas**: utilizadas en todos los problemas.
- **Recursión simple**: Utilizada para recorrer y procesar listas lineales.
- **Recursión en estructuras de árbol**: Usada para navegar árboles N-arios en P4.
- **Funciones de orden superior**: Aplicadas como argumentos para abstraer operaciones.
- **Recursión de cola**: Implementada en P2 y P3.

##  ✏️ Consideraciones 
- En P1 no se utiliza length, list-ref, member, for-each ni ninguna construcción imperativa.
- En P2 se implementan dos enfoques distintos para el procesamiento de listas, además no se utiliza foldl, foldr, for-each, length, etc.
- En P3 se maneja la acumulación incremental de resultados intermedios. Listas simples, expresiones lambda, recursión simple.
- En P4 se utiliza recursión para explorar una estructura de árbol n-ario. Listas anidadas, recursión en árboles N-arios, funciones simples, recursión simple.
- En todos los archivos se utiliza el apóstrofe simple (') para la notación de listas y símbolos, ya que es la única variante disponible en mi distribución de teclado, aunque en algunos ejemplos del pfd se muestraran otro tipo de comillas, ambas son funcionalmente equivalente es scheme.

## 🚀 Ejecución

### Usando DrRacket
1. Abre DrRacket
2. Desde la barra superior de opciones abre cualquiera de los archivos `.rkt`
3. Presionar "Run" para evaluar todas las definiciones
4. Se puede usar la ventana de interacción para probar las funciones implementadas

## 📦 Uso de la Función `busqueda-almacen` (P4)

### Estructura de la Bodega
La función trabaja con una estructura de árbol N-ario que representa un almacén, donde:
- El primer elemento es el nombre del almacén
- Cada lista anidada representa un pasillo o un estante
- Los símbolos son nombres de productos

### Definición de la Bodega
Al final del archivo P4.rkt (línea -) se encuentra la definición de una bodega de ejemplo:

```scheme
(define bodega
  '(bodega
    (pasillo1 leche pan)
    (pasillo2 (estanteA pan queso) (estanteB manzana pan))
    (pasillo3 fruta)))
```
Para probar diferente ejecuciones, se puede modificar

## 🔍 Problemas y Lógica de Implementación

### P1: Función `coincide?`
Implementada usando recursión simple que verifica si un número coincide con la cantidad de elementos en una lista. La implementación verifica casos base (lista vacía, n=0) y reduce el problema en cada llamada recursiva.

### P2: Funciones Mezclador Gourmet
- **mezclador-gourmet-simple**: Procesa la lista de adentro hacia afuera usando recursión simple. Aplica la función de forma que el resultado es equivalente a `f(x1, f(x2, f(x3, inicio)))`.
- **mezclador-gourmet-cola**: Utiliza recursión de cola para procesar de izquierda a derecha. Aplica la función de forma que el resultado es equivalente a `f(f(f(inicio, x1), x2), x3)`.
- **Comportamiento con listas vacías**: Ambas funciones devuelven el valor inicial cuando se les pasa una lista vacía, cumpliendo con la propiedad fundamental de las operaciones de plegado (fold).

### P3: Función `secuencia-rotacional`
Implementada para acumular resultados intermedios mientras aplica una función repetidamente a cada elemento de la lista, guardando cada estado intermedio. Con una lista vacía de elementos, devuelve una lista vacía ya que no hay resultados intermedios que acumular.

### P4: Función `busqueda-almacen`
Implementada con técnicas de recorrido de árboles n-arios para encontrar productos en una estructura jerárquica de almacén, generando rutas completas hacia cada producto encontrado. Cuando no se encuentra el producto buscado, devuelve una lista vacía. Los resultados se presentan con notación de lista citada (con apóstrofe inicial) para mayor claridad.

## 📋 Ejemplos de Uso

El archivo `Ejemplos.txt` contiene 10 ejemplos detallados para cada una de las funciones implementadas:
- 13 ejemplos para `coincide?` (P1)
- 16 ejemplos para las funciones de mezclador gourmet (P2)
- 12 ejemplos para `secuencia-rotacional` (P3)
- 7 ejemplos para `busqueda-almacen` (P4)

Estos ejemplos ilustran diferentes casos de uso y comportamientos de las funciones, mostrando tanto los valores de entrada como los resultados esperados.