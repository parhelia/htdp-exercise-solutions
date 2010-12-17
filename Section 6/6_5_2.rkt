#lang racket

(define-struct time (hours minutes seconds))
(define (time->seconds a-time)
  (+ (* (time-hours a-time) 3600)
     (* (time-minutes a-time) 60)
     (time-seconds a-time)))

(time->seconds (make-time 12 30 2))

;;equivalent to
;;(define mytime (make-time 12 30 2))
;;(time->seconds mytime)