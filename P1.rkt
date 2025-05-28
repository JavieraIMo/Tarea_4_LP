#lang racket

;; Determinar si un número coincide exactamente con la cantidad de elementos en una lista
;;
;; n : Un número entero no negativo que representa la cantidad esperada
;; ls : Una lista de cualquier tipo de elementos
(define (coincide? n ls)
  ;; Validamos que n sea un número no negativo
  (if (< n 0)
      (error "El número n debe ser no negativo")
      ;; Iniciamos el proceso de verificación recursiva
      (verificar-coincidencia n ls)))

;; Función auxiliar que verifica si un número coincide con el tamaño de una lista
;;
;; n : El contador de elementos restantes que deben coincidir
;; lista-restante : La porción de lista que falta por examinar
(define (verificar-coincidencia n lista-restante)
  ;; Caso 1: Si la lista está vacía
  (if (null? lista-restante)
      ;; n debe ser exactamente 0 para coincidir
      (= n 0)
      
      ;; Caso 2: La lista no está vacía
      (if (= n 0)
          ;; Si n ya llegó a 0 pero quedan elementos, no coincide
          #f
          
          ;; Caso recursivo: Procesar el siguiente elemento
          (verificar-coincidencia (- n 1) (cdr lista-restante)))))