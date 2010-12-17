;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 10_1_3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define (fahrenheit->celsius temperature)
  (* (- temperature 32) 5/9))

(define (convertFC alon)
  (cond
    [(empty? alon) empty]
    [else (cons (fahrenheit->celsius (first alon)) (convertFC (rest alon)))]))

;; test cases
(convertFC '(0))
(convertFC '(-10 0 10))