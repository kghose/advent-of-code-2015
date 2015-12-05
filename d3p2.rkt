#|
Advent of Code 2015 day 3 problem 2

Algorithm: Hashtable

|#
#lang racket
(require racket/block)

; A house coordinate address 
(struct pos (x y) #:inspector #f)


;; Return next-house
(define (visit-next-house h move-instr)
  (match move-instr
    [#\^ (struct-copy pos h [y (- (pos-y h) 1)])]
    [#\v (struct-copy pos h [y (+ (pos-y h) 1)])]
    [#\< (struct-copy pos h [x (- (pos-x h) 1)])]
    [#\> (struct-copy pos h [x (+ (pos-x h) 1)])]))


;; move-santa List -> Int
;; The only difference here is that we now keep track of two houses
(define (move-santa h0 h1 instr-list [visited-houses-hash (make-hash)])
  (cond
    [(eq? instr-list `()) (hash-count visited-houses-hash)]
    [else
     (block
      (hash-set! visited-houses-hash h0 1)
      (hash-set! visited-houses-hash h1 1)
      (move-santa  (visit-next-house h0 (first instr-list))
                   (visit-next-house h1 (second instr-list))
                   (cddr instr-list) visited-houses-hash))]))

(display (move-santa (pos 0 0) (pos 0 0) (string->list (read-line (open-input-file "d3p1.data.txt")))))
