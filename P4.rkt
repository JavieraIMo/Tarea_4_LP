#lang scheme

;; -------------------------------------------- busqueda-almacen --------------------------------------------

;; Determina si una ruta tiene prioridad sobre otra en el ordenamiento, si no quedan ordenadas al revés
;;
;; ruta1 : Primera ruta a comparar
;; ruta2 : Segunda ruta a comparar
(define (ruta-menor? ruta1 ruta2)
  (cond
    ((null? ruta1) #t) ;;  #t si ruta1 es menor o igual, #f si no
    ((null? ruta2) #f) 
    ((< (car ruta1) (car ruta2)) #t) ;; comparamos los car
    ((> (car ruta1) (car ruta2)) #f)
    (else (ruta-menor? (cdr ruta1) (cdr ruta2)))))

;; Busca todas las rutas hacia un producto en una lista o estructura anidada
;;
;; productos : Lista de productos a examinar
;; indice : Índice actual de la posición en el pasillo
;; acumulador : Lista de rutas encontradas hasta el momento
;; producto : Producto que se está buscando
(define (pasillo productos indice acumulador producto)
  ;; vamos acumulando las rutas encontradas
  (if (null? productos)
      acumulador
      (let* ((producto-actual (car productos))
             (resto-productos (cdr productos))
             (nuevo-acumulador
              (cond
                ((list? producto-actual)
                 (let ((rutas-encontradas
                        (if (and (not (null? producto-actual)) 
                                 (symbol? (car producto-actual)))
                            (map (lambda (ruta) (cons indice ruta))
                                 (pasillo (cdr producto-actual) 1 '() producto))
                            (map (lambda (ruta) (cons indice ruta))
                                 (pasillo producto-actual 1 '() producto)))))
                   (append rutas-encontradas acumulador)))
                ((eq? producto-actual producto)
                 (cons (list indice) acumulador))
                (else acumulador))))
        (pasillo resto-productos (+ indice 1) nuevo-acumulador producto))));; Continuamos con el resto de productos

;; Busca todas las rutas hacia un producto en un árbol N-ario que representa un almacén
;;
;; arbol : Estructura de datos que representa el almacén como un árbol N-ario
;; producto : Símbolo que representa el producto a buscar
(define (busqueda-almacen arbol producto)
  (list 'quote (sort (pasillo (cdr arbol) 1 '() producto) ruta-menor?)))

;; Definición de la estructura de la bodega para los ejemplos
;;
;; bodega : Estructura de ejemplo para pruebas
(define bodega
  '(bodega
    (pasillo1 leche pan)
    (pasillo2 (estanteA pan queso) (estanteB manzana pan))
    (pasillo3 fruta)))