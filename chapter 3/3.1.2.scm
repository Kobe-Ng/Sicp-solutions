;;; 3.5

(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
            (/ trials-passed trials))
          ((experiment)
           (iter (- trials-remaining 1)
                 (+ trials-passed 1)))
          (else
           (iter (- trials-remaining 1)
                 trials-passed))))
  (iter trials 0))

(define (random-in-range low high)
 (let ((range (- high low)))
    (+ low (random range))))

(define (monte-integral P x1 x2 y1 y2 n)
  (define (experiment)
    (P (random-in-range x1 x2) (random-in-range y1 y2)))
  (* (- x2 x1)
     (- y2 y1) 
     (monte-carlo n experiment)))

(define (pi-test n)
  (define (in-circle? x y)
    (< (+ 
          (* x x)
          (* y y))
        1))
  (monte-integral in-circle? -1.0 1.0 -1.0 1.0 n))