;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 11_2_4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; Exercise 11.2.4
;; depth : list -> number
;; counts the number of cons calls in a deep list

(define (depth al)
  (cond
    [(empty? al) 0]
    [else (+ 1 (depth (rest al)))]))

;; make-deep : symbol number -> list
;; consumes a symbol s and a number n and produces a list
;; e.g. (make-deep 'hello 3) produces (cons 'hello (cons 'hello (cons 'hello empty)))

(define (make-deep s n)
  (cond
    [(zero? n) empty]
    [else (cons s (make-deep s (sub1 n)))]))