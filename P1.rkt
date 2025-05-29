#lang racket

;; Esta función determina si el número ingresado coincide con la cantidad de elementos en una lista dada.
;;
;; n : Corresponde a un número entero no negativo que representa la cantidad de elementos esperados.
;; ls : Una lista de cualquier tipo de elementos
(define (coincide? n ls)
  (if (< n 0);; Validamos que n sea un número no negativo
      (error "Ojito: El número n tiene que ser positivo.")
      (verificar-coincidencia n ls)));; Llamamos a la función aux para verificar la coincidencia o no.

;; Función auxilia que verifica si un número coincide con el tamaño de una lista.
;;
;; n : contador de elementos restantes que deben coincidir.
;; lista-restante : La parte restante de la lista que falta por examinar.
(define (verificar-coincidencia n lista-restante)
  ;; Si la lista está vacía
  (if (null? lista-restante)
      (= n 0);; n = 0 para que sea #t
      
      (if (= n 0) ;; caso contrario #f
          #f
          (verificar-coincidencia (- n 1) (cdr lista-restante))))) ;; recursividad para procesar cada elemento que siga