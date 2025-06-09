#lang scheme

;; -------------------------------------------- secuencia-rotacional --------------------------------------------

;; Aplica una secuencia de funciones a una lista de ingredientes, acumulando resultados
;;
;; fs : lista de funciones unarias (cada estación aplica un paso de la receta).
;; inicio : valor inicial del acumulador (por ejemplo, el “plato” base).
;; xs : ista de insumos o ingredientes que llegarán en secuencia.
(define (secuencia-rotacional fs inicio xs)
  (define lista-funciones-vacia (null? fs))
  (if lista-funciones-vacia
      (begin
        (display "Osjo no pusiste funciones e-e\n")
        (quote-it '())) 
      (begin
        (let ((lista-resultados-inicial '()))
          (quote-it (procesar-secuencialmente fs inicio xs lista-resultados-inicial))))))  ;; Modificado: envolver el resultado con quote-it

;; Función auxiliar que procesa todos los ingredientes de la lista uno por uno
;;
;; funciones : Lista de funciones a aplicar
;; producto-actual : valor del producto actual
;; ingredientes : Lista de ingredientes pendientes por procesar
;; resultados : Lista de resultados acumulados hasta ahora
(define (procesar-secuencialmente funciones producto-actual ingredientes resultados)
  ;; Primero ver si quedan ingredientes por procesar
  (let ([quedan-ingredientes (not (null? ingredientes))])
    (if (not quedan-ingredientes)
        (begin
          (let ((resultados-invertidos (reverse resultados)))
            resultados-invertidos))
        
        (begin ;; quedan ingredientes 
          (let* ((primera-funcion (car funciones))
                 (primer-ingrediente (car ingredientes))
                 (resto-de-ingredientes (cdr ingredientes)))
            
            (let* ((resultado-funcion 
                    (primera-funcion producto-actual primer-ingrediente))
                   (nueva-lista-resultados 
                    (cons resultado-funcion resultados)))
              
              (display "acumulador nuevo: ") ;; DEGUB
              (display resultado-funcion)
              (display "\n")
              
              ;; procesamos el resto de ingredientes
              (procesar-secuencialmente 
               (cdr (append funciones (list (car funciones))))
               resultado-funcion         
               resto-de-ingredientes     
               nueva-lista-resultados)))))))

;; Convierte un resultado en una expresión citada (con comilla), es para que quede igual como en los ejemplos del pdf
;;
;; resultado : Valor o lista a convertir en una expresión citada
(define (quote-it resultado)
  (list 'quote resultado))