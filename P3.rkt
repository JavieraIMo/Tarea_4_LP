#lang racket

;; Aplica una secuencia de funciones a una lista de ingredientes, acumulando resultados
;;
;; fs : Lista de funciones que se aplicarán a los ingredientes
;; inicio : Valor inicial del acumulador (el "plato" base)
;; xs : Lista de ingredientes o insumos a procesar en secuencia
(define (secuencia-rotacional fs inicio xs)
  (define lista-funciones-vacia (null? fs));; verificamos si la lista de funciones está vacía
  
  (if lista-funciones-vacia
      (begin
        (display "Osjo: no hay funciones para aplicar\n")
        '())
      
      (begin
        (let ((lista-resultados-inicial '()))
          (procesar-secuencialmente fs inicio xs lista-resultados-inicial))))) ;; Llamamos a la función auxiliar que procesará los ingredientes

;; Función auxiliar que procesa todos los ingredientes de la lista uno por uno
;;
;; funciones : Lista de funciones a aplicar en cada paso
;; producto-actual : valor del producto actual
;; ingredientes : Lista de ingredientes pendientes por procesar
;; resultados : Lista de resultados acumulados hasta ahora
(define (procesar-secuencialmente funciones producto-actual ingredientes resultados)
  ;; Primero verificamos si quedan ingredientes por procesar
  (define quedan-ingredientes (not (null? ingredientes)))
  
  ;; Si no quedan ingredientes termina
  (if (not quedan-ingredientes)
      ;; no quedan ingredientes
      (begin
        (let ((resultados-invertidos (reverse resultados)))
          resultados-invertidos))
      
      ;; quedan ingredientes por procesar
      (begin
        (let* ((primera-funcion (car funciones))
               (primer-ingrediente (car ingredientes))
               (resto-de-ingredientes (cdr ingredientes)))
          
          ;; Mostramos información sobre el procesamiento actual
          (display "Procesando ingrediente: ")
          (display primer-ingrediente)
          (display " con acumulador: ")
          (display producto-actual)
          (display "\n")
          
          (let* ((resultado-funcion 
                  (primera-funcion producto-actual primer-ingrediente))
                  (nueva-lista-resultados 
                  (cons resultado-funcion resultados)))
            
            ;; Mostramos el resultado obtenido
            (display "Nuevo acumulador: ")
            (display resultado-funcion)
            (display "\n")
            
            ;; procesamos el resto de ingredientes
            (procesar-secuencialmente 
             funciones                
             resultado-funcion         
             resto-de-ingredientes     
             nueva-lista-resultados))))))  