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
> 📁 Tarea4LP_202273624-0
  > 📄 **P1.rkt**: Función `coincide?` que verifica si un número dado coincide con la cantidad de elementos en una lista.
  > 
  > 📄 **P2.rkt**: Implementación de dos funciones de procesamiento de listas:
  > - `mezclador-gourmet-simple`: Procesa elementos de adentro hacia afuera
  > - `mezclador-gourmet-cola`: Procesa elementos de izquierda a derecha
  > 
  > 📄 **P3.rkt**: Función `secuencia-rotacional` que aplica una secuencia de funciones a una lista de ingredientes, acumulando resultados.
  > 
  > 📄 **P4.rkt**: Función `busqueda-almacen` que busca todas las rutas hacia un producto en un árbol que representa un almacén.
  > 
  > 📄 **README.md**: Este archivo con documentación general del proyecto.

## 🧩 Estructuras de Datos y Patrones de Diseño
- **Listas simples y anidadas**: Estructuras fundamentales utilizadas en todos los problemas.
- **Recursión simple**: Utilizada para recorrer y procesar listas lineales.
- **Recursión en estructuras de árbol**: Implementada para navegar árboles N-arios en P4.
- **Funciones de orden superior**: Aplicadas como argumentos para abstraer operaciones.
- **Recursión de cola**: Implementada en P2 y P3 para optimizar el proceso recursivo.
- **Acumuladores**: Utilizados para mantener resultados parciales durante la recursión.

## 🚀 Ejecución

### Usando DrRacket
1. Abra DrRacket
2. Cargue cualquiera de los archivos `.rkt`
3. Presione el botón "Run" para evaluar todas las definiciones
4. Utilice la ventana de interacción para probar las funciones implementadas
