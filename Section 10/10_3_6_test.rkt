;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 10_3_6_test) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
(define-struct circle (center radius color))
(define-struct rectangle (tl width height color))

(define shape-1 (make-circle (make-posn 50 50) 40 'red))
(define shape-2 (make-rectangle (make-posn 30 20) 5 5 'blue))
(define shape-3 (make-rectangle (make-posn 65 20) 5 5 'blue))
(define shape-4 (make-rectangle (make-posn 40 75) 20 10 'red))
(define shape-5 (make-rectangle (make-posn 45 35) 10 30 'blue))

(define FACE (cons shape-1 (cons shape-2 (cons shape-3 (cons shape-4 (cons shape-5 empty))))))

;; draw-shape : struct
;; consumes a struct of either circle or rectangle and draws it
(define (draw-shape s)
  (cond
    [(circle? s) (draw-circle (circle-center s)
                              (circle-radius s)
                              (circle-color s))]
    
    [(rectangle? s) (draw-solid-rect (rectangle-tl s)
                                     (rectangle-width s)
                                     (rectangle-height s)
                                     (rectangle-color s))]))

(define (draw-losh lofs)
  (cond
    [(empty? lofs) true]
    [(and (draw-shape (first lofs))
          (draw-losh (rest lofs))) true]))

;; destructure make-posn
;(define (translate-and-draw-shape delta s)
;  (cond
;    [(circle? s) (draw-circle (make-posn (+ (posn-x (circle-center s)) delta) (posn-y (circle-center s)))
;                              (circle-radius s)
;                              (circle-color s))]
;    
;    [(rectangle? s) (draw-solid-rect (make-posn (+ (posn-x (rectangle-tl s)) delta) (posn-y (rectangle-tl s)))
;                                     (rectangle-width s)
;                                     (rectangle-height s)
;                                     (rectangle-color s))]
;    [else true]))


;; translate-losh : number list -> list
(define (translate-losh delta lofs)
  (cond
    [(empty? lofs) empty]
    [(circle? (first lofs)) (cons (make-circle (make-posn (+ (posn-x (circle-center (first lofs))) delta)
                                     (posn-y (circle-center (first lofs))))
                          (circle-radius (first lofs))
                          (circle-color (first lofs))) (translate-losh delta (rest lofs)))]
    
    [(rectangle? (first lofs)) (cons (make-rectangle (make-posn (+ (posn-x (rectangle-tl (first lofs))) delta)
                                        (posn-y (rectangle-tl (first lofs))))
                             (rectangle-width (first lofs))
                             (rectangle-height (first lofs))
                             (rectangle-color (first lofs))) (translate-losh delta (rest lofs)))]
    [else (translate-losh delta (rest lofs))]))

(define (clear-shape s)
  (cond
    [(circle? s) (draw-circle (circle-center s)
                              (circle-radius s)
                              'white)]
    [(rectangle? s) (draw-solid-rect (rectangle-tl s)
                                     (rectangle-width s)
                                     (rectangle-height s)
                                     'white)]))
(define (clear-losh lofs)
  (cond
    [(empty? lofs) true]
    [(and (clear-shape (first lofs))
          (clear-losh (rest lofs))) true]))

(define (draw-and-clear-picture picture)
  (and (draw-losh picture)
       (sleep-for-a-while 1)
       (clear-losh picture)))

(define (move-picture delta picture)
  (draw-and-clear-picture (translate-losh delta picture)))

(start 500 100)
(draw-losh FACE)
;(translate-losh 150 FACE)
;(clear-losh FACE)
;(draw-and-clear-picture FACE)

;(draw-losh
; (move-picture -5
;               (move-picture 23
;                             (move-picture 10 FACE))
