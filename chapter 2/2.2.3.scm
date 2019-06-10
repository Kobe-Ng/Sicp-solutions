;;; Useful functions from the chapter


(define (accumulate op initial sequence) 
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

 (define (enumerate-tree tree) 
   (cond ((null? tree) '()) 
         ((not (pair? tree)) (list tree)) 
         (else (append (enumerate-tree (car tree)) 
                       (enumerate-tree (cdr tree)))))) 

(define (dot-product v w)
      (accumulate + 0 (map* '() * v w)))

(define (fold-left op initial sequence) 
  (define (iter result rest)
    (if (null? rest) 
      result
      (iter (op result (car rest))
            (cdr rest))))
  (iter initial sequence))

;;; 2.33

(define (map-2 p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) '() sequence))
(define (append seq1 seq2) 
  (accumulate cons seq2 seq1))
(define (length sequence)
 (accumulate (lambda (x y) (+ 1 y)) 0 sequence))

;;; 2.34

(define (horner-eval x coefficient-sequence) 
  (accumulate (lambda (this-coeff higher-terms) 
                (+ this-coeff (* x higher-terms)))
              0
              coefficient-sequence))

;;; 2.35

 (define (count-leaves t) 
   (accumulate + 
               0 
               (map (lambda (x) 1)  
                    (enumerate-tree t)))) 

;;; 2.36

(define (accumulate-n op init seqs) 
  (if (null? (car seqs))
      '()
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

;;; 2.37

(define (matrix-*-vector m v) 
  (map (lambda (x) (dot-product x v)) m))

(define (transpose mat)
  (accumulate-n (lambda (x y) (cons x y)) '() mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (x)
            (matrix-*-vector cols x)) m)))

;;; 2.38

(define fold-right accumulate)

(fold-right / 1 (list 1 2 3))      ; 3/2
(fold-left / 1 (list 1 2 3))       ; 1/6
(fold-right list '() (list 1 2 3)) ; (1 (2 (3 ())))
(fold-left list '() (list 1 2 3))  ; (((() 1) 2) 3)

;;; I'd imagine that the op must be commutative 
;;; ie (op a b) = (op b a)



