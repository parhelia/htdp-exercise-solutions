;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 6_6_7) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
;; struct definition: a rect is a rectangle.
;; upper-left is a posn
;; width and height are numbers
;; fill is a symbol
(define-struct a-rect (upper-left width height fill))
;;test
(define my-rect (make-a-rect (make-posn 10 10) 40 20 'blue))
;;(a-rect-upper-left my-rect)
;;expected output
;;(make-posn 10 10)

;; template
;; (define (fun-for-rect)
;;  (make-a-rect (make-posn x y)
;;               (width)
;;               (height)
;;               (fill)))

;; draw-a-rectangle: rect
(start 300 300)

(define (draw-a-rectangle a-rect)
  (draw-solid-rect
   (a-rect-upper-left a-rect)
   (a-rect-width a-rect)
   (a-rect-height a-rect)
   (a-rect-fill a-rect)))

(define (in-rectangle? a-rect posn1)
  (cond
    [(and (< (- (posn-x posn1) (posn-x (a-rect-upper-left a-rect))) (a-rect-width a-rect))
          (< (- (posn-y posn1) (posn-y (a-rect-upper-left a-rect))) (a-rect-height a-rect))) "within rect"]
    [else "outside rect"]))

(define (translate-rectangle a-rect delta)
  (make-a-rect
   (make-posn (+ (posn-x (a-rect-upper-left a-rect)) delta)
              (posn-y (a-rect-upper-left a-rect)))
   (a-rect-width a-rect)
   (a-rect-height a-rect)
   (a-rect-fill a-rect)))

(define (clear-a-rectangle a-rect)
  (draw-solid-rect
   (make-posn (posn-x (a-rect-upper-left a-rect))
              (posn-y (a-rect-upper-left a-rect)))
   (a-rect-width a-rect)
   (a-rect-height a-rect)
   'white))

(define (draw-and-clear-rectangle a-rect)
  (and (draw-a-rectangle a-rect)
       (sleep-for-a-while 1)
       (clear-a-rectangle a-rect)))

;; move-rectangle : number rectangle -> rectangle
;; to draw and clear a rectangle, translate it by delta pixels
(define (move-rectangle delta a-rectangle)
  (cond
    [(draw-and-clear-rectangle a-rectangle)
     (translate-rectangle a-rectangle delta)]
    [else a-rectangle]))

(draw-a-rectangle
 (move-rectangle 10
                 (move-rectangle 10
                                 (move-rectangle 10
                                                 (move-rectangle 10 my-rect)))))