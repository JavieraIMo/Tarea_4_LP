#lang racket

;; Aplica una secuencia de funciones a una lista de ingredientes, acumulando resultados
;;
;; fs : Lista de funciones que se aplicarán a los ingredientes
;; inicio : Valor inicial del acumulador (el "plato" base)
;; xs : Lista de ingredientes o insumos a procesar en secuencia
(define (secuencia-rotacional fs inicio xs)
  ;; Primero debemos verificar si la lista de funciones está vacía
  (define lista-funciones-vacia (null? fs))
  
  ;; Si la lista de funciones está vacía, no podemos procesar nada
  (if lista-funciones-vacia
      ;; Caso sin funciones: mostramos un mensaje y devolvemos lista vacía
      (begin
        ;; Mostramos un mensaje de advertencia
        (display "Advertencia: No hay funciones para aplicar\n")
        ;; Devolvemos una lista vacía como resultado
        '())
      
      ;; Si hay al menos una función disponible, podemos procesar los ingredientes
      (begin
        ;; Mostramos un mensaje informativo
        (display "Iniciando procesamiento de ingredientes...\n")
        
        ;; Usamos let en lugar de define dentro de begin
        (let ((lista-resultados-inicial '()))
          ;; Llamamos a la función auxiliar que procesará los ingredientes
          (procesar-secuencialmente fs inicio xs lista-resultados-inicial)))))

;; Definimos un alias para la función principal para compatibilidad con ejemplos
(define secuenciarotacional secuencia-rotacional)

;; Función auxiliar que procesa todos los ingredientes de la lista uno por uno
;;
;; funciones : Lista de funciones a aplicar en cada paso
;; acumulador-actual : El valor acumulado hasta el momento
;; ingredientes : Lista de ingredientes pendientes por procesar
;; resultados : Lista de resultados acumulados hasta ahora
(define (procesar-secuencialmente funciones acumulador-actual ingredientes resultados)
  ;; Primero verificamos si quedan ingredientes por procesar
  (define quedan-ingredientes (not (null? ingredientes)))
  
  ;; Si no quedan ingredientes, hemos terminado
  (if (not quedan-ingredientes)
      ;; Caso final: no quedan ingredientes
      (begin
        ;; Mostramos un mensaje de finalización
        ;;(display "Procesamiento completado.\n")
        
        ;; Usamos let en lugar de define
        (let ((resultados-invertidos (reverse resultados)))
          ;; Devolvemos la lista de resultados en el orden correcto
          resultados-invertidos))
      
      ;; Caso recursivo: todavía quedan ingredientes por procesar
      (begin
        ;; Usamos let* para múltiples definiciones relacionadas
        (let* ((primera-funcion (car funciones))
               (primer-ingrediente (car ingredientes))
               (resto-de-ingredientes (cdr ingredientes)))
          
          ;; Mostramos información sobre el procesamiento actual
          (display "Procesando ingrediente: ")
          (display primer-ingrediente)
          (display " con acumulador: ")
          (display acumulador-actual)
          (display "\n")
          
          ;; Usamos otro let* para más definiciones
          (let* ((resultado-funcion 
                  (primera-funcion acumulador-actual primer-ingrediente))
                 (nueva-lista-resultados 
                  (cons resultado-funcion resultados)))
            
            ;; Mostramos el resultado obtenido
            (display "Nuevo acumulador: ")
            (display resultado-funcion)
            (display "\n")
            
            ;; Continuamos procesando recursivamente el resto de ingredientes
            (procesar-secuencialmente 
             funciones                 ; Seguimos usando la misma lista de funciones
             resultado-funcion         ; El nuevo acumulador
             resto-de-ingredientes     ; El resto de ingredientes por procesar
             nueva-lista-resultados))))))  ; La lista actualizada de resultados

;; Ejemplos de uso:
;; (secuencia-rotacional (list (lambda (ac x) (+ ac x))) 0 '(1 2 3 4))
;; Resultado esperado: '(1 3 6 10)
;;
;; (secuencia-rotacional (list (lambda (ac x) (* ac x))) 1 '(2 3 4))
;; Resultado esperado: '(2 6 24)
;;
;; (secuencia-rotacional (list (lambda (ac x) (string-append ac x "-"))) "" '("pan" "queso" "tomate"))
;; Resultado esperado: '("pan-" "pan-queso-" "pan-queso-tomate-")