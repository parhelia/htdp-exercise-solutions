;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 11_5_2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; add-to-pi : n -> number
;; to compute n + 3.14 without using +
(define (add-to-pi n)
  (cond
    [(zero? n) 3.14]
    [else (add1 (add-to-pi (sub1 n)))]))

;; multiply-by-pi : n -> number
;; to compute n * 3.14 without using *
(define (multiply-by-pi n)
  (cond
    [(equal? 0 n) 0]
    [else (+ 3.14 (multiply-by-pi (sub1 n)))]))

;; test cases
;(= (multiply-by-pi 0) 0)
;(= (multiply-by-pi 2) 6.28)
;(= (multiply-by-pi 3) 9.42)

;; multiply : number, number -> number
(define (multiply n x)
  (cond
    [(zero? n) 0]
    [else (add-to-x (multiply (sub1 n) x) x)]))

;; add-to-x : number, number -> number
;; n is an accumulator/counter
;; y is the value we wish to add
(define (add-to-x n y)
  (cond
    [(zero? n) y]
    [else (add1 (add-to-x (sub1 n) y))]))


(= (multiply 4 2) 8)