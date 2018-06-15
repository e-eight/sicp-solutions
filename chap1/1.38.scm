(define (approx-e terms)
  (define (denom index)
    (if (= (remainder index 3) 2)
	(* 2 (/ 3 (+ index 1)))
	1))
  (define (cont-frac num denom terms)
    (define (iter index result)
      (if (= index 0)
	  result
	  (iter (- index 1) (/ (num index) (+ (denom index) result)))))
    (iter terms 0))
  (+ 2 (cont-frac (lambda(index) 1.0) denom terms)))