(import :scheme/base
	:std/srfi/1)
(export #t)

(define (mod-exp a n mod)
  (cond ((= n 0) 1)
        ((even? n)
         (remainder (square (mod-exp a (/ n 2) mod))
                    mod))
        (else (remainder (* a (mod-exp a (- n 1) mod))
                         mod))))
(define (egcd a b)
  (if (zero? a)
      (values b 0 1)
      (let-values (((g y x) (egcd (modulo b a) a)))
        (values g (- x (* (quotient b a) y)) y))))

(define (modinv a m)
  (let-values (((g x y) (egcd a m)))
    (if (not (= g 1))
        #f
        (modulo x m))))

(define (zip-with f ls1 ls2)
  (map (lambda (x) (f (car x) (cadr x))) (zip ls1 ls2)))

(define (any-false ls)
  (> (length (filter (lambda (x) (equal? #f x)) ls)) 0))

(define (crt res mod)
  (let* ((modpi (fold-right * 1 mod))
	 (crtmod (map (lambda (x) (/ modpi x)) mod))
	 (mi (zip-with modinv crtmod mod)))
    (if (any-false mi)
      (begin (display "Moduli are not coprime\n")
	     #f)
      (modulo (fold-right + 0 (zip-with *
					crtmod
					(zip-with *
						  res
						  mi)))
	      modpi))))