#lang racket/base

(require (only-in racket/cmdline command-line)
         (only-in racket/list combinations in-combinations check-duplicates)
         "data/Numbers.rkt"
         )


; List<NumberCard> -> NumberCard -> Bool
(define (valid-eveil? numbers target)
  (define all-ranks (map NumberCard-rank numbers))
  (define all-nums (map NumberCard-number numbers))
  (and (= (NumberCard-number target) (foldl + 0 all-nums))
       (not (check-duplicates all-ranks))))

(define (print-eveil numbers target)
  (printf "~a is made of =========\n" (NumberCard-name target))
  (for ([num numbers])
    (printf "+ ~a\n" (NumberCard-name num))))


(define (filter-numbers nums)
  0)
       

(command-line
 #:program "NumbersEveil"
 #:args ()
 (begin
   (displayln "Beginning Numbers Eveil!")
   (for ([target Numbers-list])
     (printf "Processing on ~a\n" (NumberCard-name target)))
   (displayln "Done!")))
