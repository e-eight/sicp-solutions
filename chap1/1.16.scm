;; Fast iterative exponentiation
;;
;; We have to devise an iterative algorithm that uses
;; successive squaring to compute the n-th power of a 
;; number b.
;;
;; The idea is to have two state variables a, and count, in
;; addition to n and b, such that ab^n remains unchanged at
;; each step. Since (b^(n/2))^2 = (b^2)^(n/2). For even n,
;; starting with a = 1, and count = n/2, the transformation
;; will be a -> ab^2 and count -> count-1. The process will
;; stop when count=0. And the anwer will be given by the
;; then value of a. This can be easily generalized to odd n
;; as, b^n = b*b^(n-1).

(define (fast-iter-exp b n)
  (define (even? x) (= (remainder n 2) 0))
  (define (iter a count)
    (cond ((= count 0) a)
	  (else (iter (* a (square b)) (- count 1)))))
  (cond ((even? n) (iter 1 (/ n 2)))
	(else (* b (iter 1 (/ (- n 1) 2))))))
