#lang scheme

;; -------------------------------------------- mezclador-gourmet-simple ------------------------------------------

;; Aplica una función a cada elemento de la lista, procesando con recursión simple
;;
;; f : función de 2 argumentos ((lambda (acum elem) ...).
;; inicio : valor inicial del “plato” en construcción.
;; ls : Lista de elementos a procesar
(define (mezclador-gourmet-simple f inicio ls)
  (let ((listavacia (null? ls))) ;; verificamos si está vacía la lista
    (if listavacia
        inicio
        
        (let* ((primer-elemento (car ls)) ;; si no está vacía
               (resto-lista (cdr ls))
               (resultado (mezclador-gourmet-simple f inicio resto-lista)))
          
          (let ((resultado-final (f primer-elemento resultado)))
            resultado-final)))))

;; -------------------------------------------- mezclador-gourmet-cola ------------------------------------------

;; Aplica una función a cada elemento de la lista, procesando en cola (de izquierda a derecha o fifo)
;;
;; f : Función de dos argumentos que se aplicará a cada elemento ((lambda (acum elem) ...))
;; inicio : Valor inicial del "plato" en construcción
;; ls : Lista de elementos a procesar
(define (mezclador-gourmet-cola f inicio ls)
  (let ((quedan-elementos (not (null? ls)))) ;; Verificamos si quedan elementos
    
    (if (not quedan-elementos) ;; Si no hay, termina
        inicio
        
        (let ((elemento-actual (car ls))) ;; Si hay, continúa tomando el car de lo que queda
          
          (let* ((resultado (f inicio elemento-actual))
                 (resto-lista (cdr ls)))
            
            (mezclador-gourmet-cola f resultado resto-lista))))))