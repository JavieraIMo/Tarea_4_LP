#lang scheme

;; -------------------------------------------- coincide? ------------------------------------------

;; Esta función recibe un número entero no negativo n y una lista ls. La función debe devolver #t si n coincide con la cantidad real de elementos de ls y #f en caso contrario
;;
;; n : Corresponde a un número entero no negativo que representa la cantidad de elementos esperados.
;; lista : Una lista de cualquier tipo de elementos
(define (coincide? n lista)
  (let ((resultado 
         (cond 
           ((< n 0) (error "Ojito: n debe ser positivo."))
           ((null? lista) (= n 0))
           ((= n 0) #f);; si la lista aún tiene elementos entonces #f
           (else (coincide? (- n 1) (cdr lista))))))
    (if resultado #t #f)))