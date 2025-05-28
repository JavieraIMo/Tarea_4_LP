# Tarea 4: Programación Funcional en Scheme

## Autor
Javiera Constanza Ibaca Morales  
Rol: 202273624-0

## Descripción
Esta tarea consiste en la implementación de varias funciones en el lenguaje de programación funcional Scheme.

## 🛠️ Requisitos del Sistema

### Dependencias
- Un intérprete de Scheme (recomendado):
  - DrRacket (versión 8.0+)
  - MIT Scheme
  - Guile Scheme
- Conocimientos básicos de programación funcional y Scheme

## 📁 Estructura del Código
> 📄 **main.scm**: Archivo principal que contiene todas las funciones implementadas
> 📄 **tests.scm**: Conjunto de pruebas para verificar el funcionamiento correcto de las funciones
> 📄 **README.md**: Este archivo 
> 📄 **examples.scm**: Ejemplos de uso de las funciones implementadas

## 🧩 Estructuras de Datos y Patrones de Diseño
- **Listas**: Estructura de datos fundamental en Scheme, utilizada extensivamente en la implementación de las funciones.
- **Recursión**: Patrón de diseño principal para el procesamiento de estructuras de datos en programación funcional.
- **Funciones de orden superior**: Utilizadas para abstraer patrones comunes de recursión y manipulación de datos.
- **Funciones puras**: Implementación sin efectos secundarios siguiendo el paradigma funcional.

## 🚀 Compilación y Ejecución

### Usando DrRacket (Recomendado)
1. Abra DrRacket
2. Cargue el archivo `main.scm`
3. Seleccione el lenguaje "Pretty Big" o "R5RS" en la parte inferior de la ventana
4. Presione el botón "Run" para evaluar todas las definiciones
5. Utilice la ventana de interacción para probar las funciones implementadas

### Ejecución en línea de comandos
Para MIT Scheme:
```bash
mit-scheme --load main.scm
```
Para Guile Scheme:
```bash
guile -c "(load \"main.scm\")"
```

## 📝 Notas
- La documentación de cada función se encuentra en forma de comentarios dentro del código fuente.