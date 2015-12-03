#|
Advent of Code 2015 day 1 problem 2
|#
#lang racket

;; move-santa List -> Int
(define (move-santa-count instr-list [current-floor 0] [instr-pos 0])
  (cond
    [(eq? current-floor -1) instr-pos]   
    [(eq? instr-list `()) -1]  ; Error condition actually
    [else (move-santa-count (cdr instr-list) (+ current-floor (if (char=? (car instr-list) #\) ) -1 1)) (+ instr-pos 1))]))

(display (move-santa-count (string->list (read-line (open-input-file "d1p1.data.txt")))))