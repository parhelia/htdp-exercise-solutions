;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 10_1_2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; hours->wages : list-of-numbers -> list-of-numbers
;; to create a list of weekly wages from a list of weekly hours (alon)
(define (hours->wages alon)
  (cond
    [(empty? alon) empty]
    [else (cons (wage (first alon)) (hours->wages (rest alon)))]))

;; Exercise 10.1.1 and 10.1.2
;; wage : number -> number
;; to compute the total wage (at $12 per hour)
;; of someone who worked for h hours
(define (wage h)
  (cond
    [(equal? h 'empty) (error 'wage "Input was '(empty)")]
    [(> h 100) (error 'wage "too many hours")]
    [else (+ (* 12 h) 14)]))

;; test cases for wage
;(hours->wages '(empty)) ;signal error
(hours->wages empty) ;empty
(hours->wages '(1 0)) ;'(26 14)
(hours->wages '(0 1)) ;'(14 26)
(hours->wages '(100)) ;'(1214)
;(hours->wages '(100 101)) ;'too many hours
;(hours->wages '(101)) ;'too many hours
(hours->wages '(1 2 3 4)) ;'(26 38 50 62)
