#lang racket

(define *DATA* '())

(define file-name "/Users/eddy/Github/advent-of-code/2015/data/day1")
(for ([line (file->lines file-name)]) 
    (set! *DATA* (string->list line)))

(define the-list-of-instructions *DATA*)

(define current-position   0)
(define go-up            #\()
(define go-down          #\))

(define (increase-current-position)
    (set! current-position (+ current-position 1)))

(define (decrease-current-position)
    (set! current-position (- current-position 1)))

(define get-the-next-instruction-from       car)
(define get-the-remaining-instructions-from cdr)

(define (is-the-next-instruction-to-go-up? instructions)
    (equal? (get-the-next-instruction-from instructions) go-up))

(define (then-return-the x) x)


; Attempt to make the code as English-like as possible
(define (find-position-from the-list-of-instructions)
    (if (empty? the-list-of-instructions)
        (then-return-the current-position)
        (if (is-the-next-instruction-to-go-up? the-list-of-instructions)
            (begin
                (increase-current-position)
                (find-position-from 
                    (get-the-remaining-instructions-from the-list-of-instructions)))
            (begin
                (decrease-current-position)
                (find-position-from 
                    (get-the-remaining-instructions-from the-list-of-instructions))))))

(find-position-from the-list-of-instructions)