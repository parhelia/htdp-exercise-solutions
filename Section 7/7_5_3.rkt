;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 7_5_3) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
(define-struct square (nw length))
(define-struct circle (center radius))

;; perimeter : shape -> number
;; to compute the perimeter of a-shape
(define (perimeter a-shape)
  (cond
    [(square? a-shape)(* (square-length a-shape) 4)]
    ;    (square-nw a-shape) (square-length a-shape)]
    [(circle? a-shape)(* 2 (circle-radius a-shape) pi)]))
;     (circle-center a-shape) (circle-radius a-shape)]

(define (area a-shape)
  (cond
    [(square? a-shape)(* square-length square-length)]
    [(circle? a-shape)(* (circle-radius a-shape) (circle-radius a-shape) pi)]))

;; Exercise 7.5.3
(define-struct vec (x y))

(define (checked-make-vec x y)
  (cond
    [(or (symbol? x)
         (symbol? y)
         (struct? x)
         (struct? y)
         (< x 0)
         (< y 0))(error 'checked-make-vec "only positive numbers")]
    [else (make-vec x y)]))
