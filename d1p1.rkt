#|
Advent of Code 2015 day 1 problem 1
|#
#lang racket

;; move-santa List -> Int
(define (move-santa instr-list [current-floor 0])
  (cond
    [(eq? instr-list `()) current-floor]
    [else (move-santa (cdr instr-list) (+ current-floor (if (char=? (car instr-list) #\) ) -1 1)))]))

(display (move-santa (string->list (read-line (open-input-file "d1p1.data.txt")))))