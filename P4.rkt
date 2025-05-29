#lang racket

;; Busca todas las rutas hacia un producto en un árbol que representa un almacén
;;
;; arbol : Estructura de datos que representa el almacén como un árbol N-ario
;; producto : Símbolo que representa el producto a buscar
(define (busqueda-almacen arbol producto)
  ;; Saltamos el nombre del almacén (primer elemento) y comenzamos la búsqueda
  (let ((rutas (buscar-rutas (cdr arbol) producto)))
    ;; Ordenamos las rutas primero por longitud y luego lexicográficamente
    (sort rutas (lambda (ruta1 ruta2)
                  (let ((len1 (length ruta1))
                        (len2 (length ruta2)))
                    (if (= len1 len2)
                        ;; Si tienen la misma longitud, comparamos elemento por elemento
                        (lex-compare ruta1 ruta2)
                        ;; Si tienen longitudes diferentes, ordenamos por longitud
                        (< len1 len2)))))))

;; Comparación lexicográfica de listas de números
;; Devuelve #t si lista1 es lexicográficamente menor que lista2
(define (lex-compare lista1 lista2)
  (cond
    ;; Si la primera lista está vacía, es menor
    ((null? lista1) #t)
    ;; Si la segunda lista está vacía, la primera no es menor
    ((null? lista2) #f)
    ;; Comparamos los primeros elementos
    ((< (car lista1) (car lista2)) #t)
    ((> (car lista1) (car lista2)) #f)
    ;; Si son iguales, seguimos con el resto
    (else (lex-compare (cdr lista1) (cdr lista2)))))

;; Función auxiliar para buscar todas las rutas hacia un producto
;;
;; lista : Lista en la que buscar el producto
;; producto : Producto que estamos buscando
(define (buscar-rutas lista producto)
  ;; Función interna que realiza la búsqueda recursiva
  (define (buscar-en-nivel elementos indice acumulador)
    (if (null? elementos)
        acumulador  ;; Si no hay más elementos, devolvemos lo acumulado
        (let ((elemento-actual (car elementos))
              (resto-elementos (cdr elementos)))
          (cond
            ;; Si el elemento actual es una lista (una sala o estante)
            ((list? elemento-actual)
             ;; Verificamos si comienza con un símbolo (nombre de sección)
             (let ((resultados-internos
                    (if (and (not (null? elemento-actual)) (symbol? (car elemento-actual)))
                        ;; Si tiene nombre de sección, buscamos en su contenido
                        (map (lambda (ruta) (cons indice ruta))
                             (buscar-rutas (cdr elemento-actual) producto))
                        ;; Si no tiene nombre, buscamos directamente
                        (map (lambda (ruta) (cons indice ruta))
                             (buscar-rutas elemento-actual producto)))))
               ;; Combinamos resultados y continuamos con el siguiente elemento
               (buscar-en-nivel resto-elementos (+ indice 1) 
                               (append resultados-internos acumulador))))
            
            ;; Si el elemento actual es el producto que buscamos
            ((eq? elemento-actual producto)
             ;; Añadimos esta ruta a los resultados y continuamos
             (buscar-en-nivel resto-elementos (+ indice 1) 
                             (cons (list indice) acumulador)))
            
            ;; En cualquier otro caso, continuamos con el siguiente elemento
            (else (buscar-en-nivel resto-elementos (+ indice 1) acumulador))))))
  
  ;; Iniciamos la búsqueda en el primer nivel (índice 1) con acumulador vacío
  (buscar-en-nivel lista 1 '()))

;; Ejemplo de uso:
#|
(define bodega
  '(bodega
    (pasillo1 leche pan)
    (pasillo2 (estanteA pan queso) (estanteB manzana pan))
    (pasillo3 fruta)))

(busqueda-almacen bodega 'pan)
;; Resultado: '((1 2) (2 1 1) (2 2 2))
|#