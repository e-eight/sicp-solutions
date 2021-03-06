;; Fast multiplication
;;
;; This is a recursive algorithm is for integer
;; multiplication, using repeated addition. Using successive
;; doubling the multiplication can be done in a logarithmic
;; number of steps.
;;
;; In a nutshell, the idea is
;; a*b = (a*2)*(b/2) = (a + a)*(b/2).

(define (fast-mul a b)
  (define (even? x)
    (= (remainder x 2) 0))
  (define (double x)
    (* x 2))
  (define (half x)
    (/ x 2))
  (cond ((= b 0) 0)
	((even? b) (double (fast-mul a (half b))))
	(else (+ a (fast-mul a (- b 1))))))

