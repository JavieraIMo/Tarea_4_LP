#lang scheme

;; -------------------------------------------- busqueda-almacen --------------------------------------------

;; Determina si una ruta tiene prioridad sobre otra en el ordenamiento, si no quedan ordenadas al revés
;;
;; ruta1 : Primera ruta a comparar
;; ruta2 : Segunda ruta a comparar
(define (ruta-menor? ruta1 ruta2)
  (cond
    ((null? ruta1) #t) ;; Si la primera ruta está vacía, tiene prioridad
    ((null? ruta2) #f) ;; Si la segunda ruta está vacía, la primera no tiene prioridad
    ((< (car ruta1) (car ruta2)) #t) ;; Comparamos los primeros índices
    ((> (car ruta1) (car ruta2)) #f)
    (else (ruta-menor? (cdr ruta1) (cdr ruta2)))))

;; Recorre un pasillo o sección del almacén buscando un producto específico
;;
;; productos : Lista de productos a examinar
;; indice : Índice actual de la posición en el pasillo
;; acumulador : Lista de rutas encontradas hasta el momento
;; producto : Producto que se está buscando
(define (pasillo productos indice acumulador producto)
  (if (null? productos)
      acumulador  ;; Si no hay más productos, devolvemos lo acumulado
      (let ((producto-actual (car productos))
            (resto-productos (cdr productos)))
        (let ((nuevo-acumulador
               (cond
                 ((list? producto-actual);; Si es una lista (pasillo o estante)
                  (let ((rutas-encontradas
                         (if (and (not (null? producto-actual)) 
                                  (symbol? (car producto-actual)))
                             
                             (map (lambda (ruta) (cons indice ruta));; Si tiene nombre de sección, buscamos en su contenido
                                  (buscar-rutas (cdr producto-actual) producto))
                             
                             (map (lambda (ruta) (cons indice ruta));; Si no tiene nombre, buscamos directamente
                                  (buscar-rutas producto-actual producto)))))
                    (append rutas-encontradas acumulador)))
                 
                 ((eq? producto-actual producto);; Si es el producto buscado
                  (cons (list indice) acumulador))
                 
                 (else acumulador))));; En otro caso, no cambia el acumulador
            (pasillo resto-productos (+ indice 1) nuevo-acumulador producto)))));; Continuamos con el resto de productos

;; Busca todas las rutas hacia un producto en una lista o estructura anidada
;;
;; lista : Lista en la que buscar el producto
;; producto : Producto que estamos buscando
(define (buscar-rutas lista producto)
  (pasillo lista 1 '() producto))

;; Busca todas las rutas hacia un producto en un árbol N-ario que representa un almacén
;;
;; arbol : Estructura de datos que representa el almacén como un árbol N-ario
;; producto : Símbolo que representa el producto a buscar
(define (busqueda-almacen arbol producto)
  (let ((rutas (buscar-rutas (cdr arbol) producto)))
    (quote-it (sort rutas ruta-menor?))))

;; Convierte un resultado en una expresión citada (con comilla)
;;
;; resultado : Valor o lista a convertir en una expresión citada
(define (quote-it resultado)
  (list 'quote resultado))

;; Definición de la estructura de la bodega para los ejemplos
(define bodega
  '(bodega
    (pasillo1 leche pan)
    (pasillo2 (estanteA pan queso) (estanteB manzana pan))
    (pasillo3 fruta)))