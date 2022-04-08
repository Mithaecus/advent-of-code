#lang racket

(define *DATA* '())

(define file-name "/Users/eddy/Github/advent-of-code/2015/data/day1")
(for ([line (file->lines file-name)]) 
    (set! *DATA* (string->list line)))

(define list-of-instructions *DATA*)

(define current-position   0)
(define go-up            #\()
(define go-down          #\))

(define (increase-current-position)
    (set! current-position (+ current-position 1)))

(define (decrease-current-position)
    (set! current-position (- current-position 1)))

(define get-next-instruction-from       car)
(define get-remaining-instructions-from cdr)

(define (next-instruction-is-go-up? instructions)
    (equal? (get-next-instruction-from instructions) go-up))

(define (find-position-from list-of-instructions)
    (if (empty? list-of-instructions)
        current-position
        (if (next-instruction-is-go-up? list-of-instructions)
            (begin
                (increase-current-position)
                (find-position-from (get-remaining-instructions-from list-of-instructions)))
            (begin
                (decrease-current-position)
                (find-position-from (get-remaining-instructions-from list-of-instructions))))))

(find-position-from list-of-instructions)