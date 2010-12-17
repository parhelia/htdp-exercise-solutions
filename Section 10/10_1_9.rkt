;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 10_1_9) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; dollar-amount : number -> list
;; consumes a number and returns a cons'ed list
(define (dollar-amount amt)
  (cond
    [(< (quotient amt 100) 1) empty]
    [(< (quotient amt 100) 2) (cons (quotient amt 100)  (cons 'dollar (cons 'and empty)))]
    [else (cons (quotient amt 100) (cons 'dollars (cons 'and empty)))]))

;; cent-amount : number -> list
;; consumes a number and returns a cons'ed list
(define (cent-amount amt)
  (cond
    [(= (remainder amt 100) 1) (cons '1 (cons 'cent empty))]
    [else (cons (remainder amt 100) (cons 'cents empty))]))

(define (controller amt)
  (cond
    [(empty? amt) empty]
    [else (cons (dollar-amount amt) (cons (cent-amount amt) empty))]))

(define (amount amt)
  (controller (* 100 amt)))

;; test cases
(amount 0.0)
(amount 1.0)
(amount 0.99)
(amount 1.00)
(amount 1.01)
(amount 1.50)
(amount 1.99)
(amount 2.00)
(amount 2.01)
(amount 3.00)