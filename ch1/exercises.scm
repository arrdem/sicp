;; -*- geiser-scheme-implementation: guile; fill-column: 100; -*-

;; Exercise 1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
10
;; => 10

(+ 5 3 4)
;; => 12

(- 9 1)
;; => 8

(/ 6 2)
;; => 3

(+ (* 2 4)
	 (- 4 6))
;; => 8

(define a 3)
;; => nil

(define b (+ a 1))
;; => nil

;; Exercise 2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(/ (+ 5 4 (0 2 (- 3 (+ 6 (/ 4 5)))))
	 (* 3 (- 6 2) (- 2 7)))

;; Exercise 3
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (max a b)
	(if (> a b) a b))

(define (square x)
	(* x x))

(define (sum-of-squares x y)
	(+ (square x) (square y)))

(define (sum-of-squares-of-largest x y z)
  ;; Note that `let*` hasn't been introduced yet.
	;; This implementation is sort of cheating.
	(let* ((a (max x y))
				 (b (if (= y a)
								(max x z)
								(max y z))))
		(sum-of-squares a b)))

;; Exercise 4
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (a-plus-abs-b a b)
	;; The expression (> b 0) is used as a test to decide which function (+ or -) will be applied to
	;; the two arguments a and b. This function isn't itself higher order because it takes no function
	;; arguments, but it is indirect as it metaprograms over which function will be called.
	((if (> b 0) + -) a b))

;; Exercise 5
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (p) (p))

(define (test x y)
	(if (= x 0) 0 y))

(test 0 (p))

;; Under strict (applicative) evaluation, the first form `(test 0 (p))` doesn't terminate because
;; the definition of `p` is infinitely recursive. We don't make it any farther.

;; Under normal form evaluation, we rewrite `(test 0 (p))` to be `(if (= 0 0) 0 (p))`, which reduces
;; to `(if #'t 0 (p))` which reduces to `0` without ever forcing the evaluation of the omega
;; function p.
