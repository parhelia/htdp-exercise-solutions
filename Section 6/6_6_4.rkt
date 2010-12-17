;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 6_6_4) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
;#lang racket

;; structure definition and data definition for representing colored circles
;; a circle has 3 pieces of information: center, radius and color of its
;; perimeter. The first is a posn structure, second a number, third a color
;; symbol.

(define-struct a-circle (center radius color))

;;(define my-circle (make-a-circle (make-posn 30 30) 2 'red))
;;(a-circle-color my-circle) ;output: 'red
;;(a-circle-center my-circle) ;output: (make-posn 30 30)

;; develop the template fun-for-circle, which outlines a function that consumes
;; circles. Its result is undetermined.

(define my-circle (make-a-circle (make-posn 30 30) 30 'red))

(start 300 300)
;(draw-circle (make-posn 30 30) 3 'red)
;(define my-circle (make-a-circle (make-posn 30 30) 30 'red))

(define (draw-my-circle this-circle)
  (draw-circle
   (a-circle-center this-circle)
   (a-circle-radius this-circle)
   (a-circle-color this-circle)))

(draw-my-circle my-circle) ;draw the circle

;;calculate the Euclidean distance between two points
(define (distance posn1 posn2)
  (sqrt
   (+ (sqr (- (posn-x posn1) (posn-x posn2)))
      (sqr (- (posn-y posn1) (posn-y posn2))))))

(define (in-circle? this-circle posn)
  (cond
    [(> (distance posn (a-circle-center this-circle)) (a-circle-radius this-circle)) "not in circle"]
    [else "within circle"]))

(define (translate this-circle delta)
  (make-a-circle
   (make-posn
    (+ (posn-x (a-circle-center this-circle)) (posn-x delta))
    (+ (posn-y (a-circle-center this-circle)) (posn-y delta)))
   (a-circle-radius this-circle)
   (a-circle-color this-circle)))

;(define delta (make-posn 30 30))
;(translate my-circle delta)