#|
Advent of code 2015. Day 4 Problem 1
|#
#lang racket
(require file/md5)

;; test-hash string -> bool
(define (advent-coin-found key d)
  (equal? (subbytes (md5 (string-append key (number->string d))) 0 5) #"00000"))


(define (find-advent-coin key [d 0])
  (if (advent-coin-found key d) d (find-advent-coin key (+ d 1))))

;;(display (find-advent-coin "abcdef"))
;;(display (find-advent-coin "pqrstuv"))
(display (find-advent-coin "bgvyzdsv"))