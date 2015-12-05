#|
Advent of code 2015. Day 4 Problem 2
|#
#lang racket
(require file/md5)

;; test-hash string -> bool
(define (advent-coin-found key d)
  (equal? (subbytes (md5 (string-append key (number->string d))) 0 6) #"000000"))


(define (find-advent-coin key [d 0])
  (if (advent-coin-found key d) d (find-advent-coin key (+ d 1))))

(display (find-advent-coin "bgvyzdsv"))