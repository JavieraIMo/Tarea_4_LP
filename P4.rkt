#lang scheme

;; -------------------------------------------- busqueda-almacen --------------------------------------------

;; Función auxiliar para contar elementos de una lista recursivamente
;; lista: La lista cuyos elementos queremos contar
;; acum: Acumulador para el conteo (inicialmente 0)
(define (contar-elementos lista acum)
  (if (null? lista)
      acum
      (contar-elementos (cdr lista) (+ acum 1))))

;; Busca todas las rutas hacia un producto en un árbol que representa un almacén
;;
;; arbol : Estructura de datos que representa el almacén como un árbol N-ario
;; producto : Símbolo que representa el producto a buscar
(define (busqueda-almacen arbol producto)
  ;; Saltamos el nombre del almacén (primer elemento) y comenzamos la búsqueda
  (let ((rutas (buscar-rutas (cdr arbol) producto)))
    ;; Ordenamos las rutas primero por longitud y luego lexicográficamente
    (sort rutas (lambda (ruta1 ruta2)
                  (let ((len1 (contar-elementos ruta1 0))
                        (len2 (contar-elementos ruta2 0)))
                    (if (= len1 len2)
                        ;; Si tienen la misma longitud, comparamos elemento por elemento
                        (ruta-menor ruta1 ruta2)
                        ;; Si tienen longitudes diferentes, ordenamos por longitud
                        (< len1 len2)))))))

;; Determina si una ruta tiene prioridad sobre otra en el ordenamiento
;; Devuelve #t si ruta1 debe aparecer antes que ruta2
(define (ruta-menor? ruta1 ruta2)
  (cond
    ;; Si la primera ruta está vacía, tiene prioridad
    ((null? ruta1) #t)
    ;; Si la segunda ruta está vacía, la primera no tiene prioridad
    ((null? ruta2) #f)
    ;; Comparamos los primeros índices de cada ruta
    ((< (car ruta1) (car ruta2)) #t)
    ((> (car ruta1) (car ruta2)) #f)
    (else (ruta-menor? (cdr ruta1) (cdr ruta2)))))

;; Función auxiliar para buscar todas las rutas hacia un producto
;;
;; lista : Lista en la que buscar el producto
;; producto : Producto que estamos buscando
(define (buscar-rutas lista producto)
  (letrec ((pasillo (lambda (productos indice acumulador);;función local usando letrec
              (if (null? productos)
                  acumulador  ;; Si no hay más productos, devolvemos lo acumulado
                  (let ((producto-actual (car productos))
                        (resto-productos (cdr productos)))
                    (cond
                      ;; Si el elemento actual es una lista (una sala o estante)
                      ((list? producto-actual)
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
                      
                      ;; Si el elemento actual es el producto que buscamos
                      ((eq? producto-actual producto)
                       (pasillo resto-productos (+ indice 1)
                               (cons (list indice) acumulador)))        
                      (else (pasillo resto-productos (+ indice 1) acumulador)))))))))
    
    (pasillo lista 1 ''));; Llamamos a la función local pasillo con los valores iniciales

;; Definición de la estructura de la bodega para los ejemplos
(define bodega
  '(bodega
    (pasillo1 leche pan)
    (pasillo2 (estanteA pan queso) (estanteB manzana pan))
    (pasillo3 fruta)))