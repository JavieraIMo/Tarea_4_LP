#lang scheme

;; -------------------------------------------- busqueda-almacen --------------------------------------------

;; Busca todas las rutas hacia un producto en un árbol que representa un almacén
;;
;; arbol : Estructura de datos que representa el almacén como un árbol N-ario
;; producto : Símbolo que representa el producto a buscar
(define (busqueda-almacen arbol producto)
  (letrec ((ruta-menor? (lambda (ruta1 ruta2);; letrec para la función local
                         (cond
                           ((null? ruta1) #t);; Si la primera ruta está vacía, tiene prioridad
                           ((null? ruta2) #f);; Si la segunda ruta está vacía, la primera no tiene prioridad
                           ((< (car ruta1) (car ruta2)) #t);; Comparamos los car
                           ((> (car ruta1) (car ruta2)) #f)
                           (else (ruta-menor? (cdr ruta1) (cdr ruta2)))))))
    (let ((rutas (buscar-rutas (cdr arbol) producto)));; ordenamos las rutas ya que si no se muestran al revéz
      (sort rutas ruta-menor?))))

;; Función auxiliar para buscar todas las rutas hacia un producto
;;
;; lista : Lista en la que buscar el producto
;; producto : Producto que estamos buscando
(define (buscar-rutas lista producto)
  (letrec ((pasillo (lambda (productos indice acumulador);; letrec para la función local
              (if (null? productos)
                  acumulador  ;; Si no hay más productos, devolvemos lo acumulado
                  (let ((producto-actual (car productos))
                        (resto-productos (cdr productos)))
                    (cond
                      ((list? producto-actual);; Si el elemento actual es una lista (una sala o estante)
                       ;; Verificamos si comienza con un símbolo (nombre de sección)
                       (let ((parte-resultado
                              (if (and (not (null? producto-actual)) (symbol? (car producto-actual)))
                                  ;; Si tiene nombre de sección, buscamos en su contenido
                                  (map (lambda (ruta) (cons indice ruta))
                                       (buscar-rutas (cdr producto-actual) producto))
                                  ;; Si no tiene nombre, buscamos directamente
                                  (map (lambda (ruta) (cons indice ruta))
                                       (buscar-rutas producto-actual producto)))))
                         ;; Combinamos resultados y continuamos con el siguiente elemento
                         (pasillo resto-productos (+ indice 1) 
                                 (append parte-resultado acumulador))))
                      
                      ((eq? producto-actual producto);; Si el elemento actual es el producto que buscamos
                       (pasillo resto-productos (+ indice 1)
                               (cons (list indice) acumulador)))        
                      (else (pasillo resto-productos (+ indice 1) acumulador)))))))))
    (pasillo lista 1 ''))

;; Definición de la estructura de la bodega para los ejemplos
(define bodega
  '(bodega
    (pasillo1 leche pan)
    (pasillo2 (estanteA pan queso) (estanteB manzana pan))
    (pasillo3 fruta)))