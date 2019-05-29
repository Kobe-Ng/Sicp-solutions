;;; 2.1

(define (make-rat n d)
  (define (sign x)
    (if (> x 0)
      +
  	  -))
	(let ((g (gcd n d)))
		(cons ((sign (* n d)) (abs (/ n g))) (abs (/ d g)))))

;;; 2.2

(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

(define (make-line point1 point2)
  (cons point1 point2))

(define (start-segment line)
  (car line))

(define (end-segment line)
  (cdr line))

(define (midpoint-segment line)
  (make-point
  	(/ 
  	  (+ 
  		(x-point (start-segment line)) 
  		(x-point (end-segment line))) 
  	 2)
    (/ 
      (+ 
        (y-point (start-segment line))
    	(y-point (end-segment line)))
     2)))