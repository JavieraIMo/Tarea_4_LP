#lang racket

;; -------------------------------------------- mezclador-gourmet-simple ------------------------------------------

;; Aplica una función a cada elemento de la lista, procesando de adentro hacia afuera
;;
;; f : Función de dos argumentos que se aplicará a cada elemento
;; e-esperado : cantidad de elementos esperada
;; ls : Lista de elementos a procesar
(define (mezclador-gourmet-simple f e-esperado ls)
  (let ((listavacia (null? ls))) ;; verificamos si está vacía la lista
    (if listavacia
        e-esperado
        
        (let* ((primer-elemento (car ls)) ;; si no está vacía
               (resto-lista (cdr ls))
               (resultado (mezclador-gourmet-simple f e-esperado resto-lista)))
          
          (let ((resultado-final (f primer-elemento resultado)))
            resultado-final)))))

;; -------------------------------------------- mezclador-gourmet-cola ------------------------------------------

;; Procesa la lista aplicando una función de izquierda a derecha
;;
;; f : Función de dos argumentos que se aplicará a cada elemento
;; e-esperado : cantidad de elementos esperada
;; lista-restante : Lista de elementos pendientes por procesar
(define (procesar-lista-cola f e-esperado lista-restante)
  
  (let ((quedan-elementos (not (null? lista-restante)))) ;; Verificamos si quedan elementos por procesar
    
    (if (not quedan-elementos);; si no hay, termina
        e-esperado
        
        (let ((elemento-actual (car lista-restante))) ;; si hay, continua tomando el car de lo que queda por procesar.
          
          (let* ((contador (f e-esperado elemento-actual))
                 (nuevo-restante (cdr lista-restante)))
            
            (procesar-lista-cola f contador nuevo-restante))))))

;; Aplica una función a cada elemento de la lista, procesando de izquierda a derecha
;;
;; f : Función de dos argumentos que se aplicará a cada elemento
;; e-esperado : cantidad de elementos esperada
;; ls : Lista de elementos a procesar
(define (mezclador-gourmet-cola f e-esperado ls)
  (procesar-lista-cola f e-esperado ls))