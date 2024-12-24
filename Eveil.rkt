#lang racket/base

(require (only-in racket/cmdline command-line)
         (only-in racket/list in-combinations check-duplicates)
         (only-in racket/string string-join)
         "data/Numbers.rkt"
         )


(define *banlist?* (make-parameter 'tcg))
(define (get-banlist)
  (case (*banlist?*)
    ('tcg TCG-banned-cards)
    ('ocg OCG-banned-cards)
    (else '())))


; List<NumberCard> -> NumberCard -> Bool
; A valid Eveil target combination requires that the Numbers
; can add up to the target number (A+B+C+D=E), and that all the
; numbers themselves are not of the same rank (cannot be Rank3 x 4)
(define (valid-eveil? numbers target)
  (define all-ranks (map NumberCard-rank numbers))
  (define all-nums (map NumberCard-number numbers))
  (and (= (NumberCard-number target) (foldl + 0 all-nums))
       (not (check-duplicates all-ranks))))


; debug only
(define (print-eveil numbers target)
  (printf "~a is made of =========\n" (NumberCard-name target))
  (for ([num numbers])
    (printf "+ ~a\n" (NumberCard-name num))))


; Defaults to a tab-separated file (because these names have commas)
(define (write-eveil nums target #:sep [sep "\t"])
  (printf "~a~a~a\n" (NumberCard-name target) sep
   (string-join (map NumberCard-name nums) sep)))
  

; Create a function to filter the list of Numbers under a certain threshold
; Use this to pass to `filter` to get a valid list of candidates
; (by Number at least)
; target number > candidate number
; target name != candidate name
(define (by target)
  (λ (candidate)
    (and (< (NumberCard-number candidate)
            (NumberCard-number target))
         (not (string=? (NumberCard-name candidate)
                        (NumberCard-name target)))
         ;(not (= (NumberCard-rank candidate)
         ;        (NumberCard-rank target)))
         )))


; Check a card's legality against current parameter
(define (is-legal? card)
  (eqv? #f (member (NumberCard-name card)
                   (get-banlist))))


; Main program run
(define (Numbers-Eveil file-path)
  (displayln ">>> Numbers Eveil computer <<<")
  (call-with-output-file file-path #:exists 'replace
    (λ (outport)
      (parameterize ([current-output-port outport])
        (printf "Target\tA\tB\tC\tD\n")
        (for ([target-card Numbers-list])
          (define candidates  (filter (by target-card) Numbers-list))
          (define combos      (in-combinations candidates 4))
          (for ([combo combos])
            (when (valid-eveil? combo target-card)
              (write-eveil combo target-card)))))))
  (displayln ">>> Done! >>>"))


; Entrypoint
(module+ main
  (command-line
   #:program "NumbersEveil"
   #:once-any
   [("--ocg") "Use the OCG banlist"
              (*banlist?* 'ocg)]
   [("--no-banlist") "Use no banlist"
                     (*banlist?* 'none)]
   #:args (file-path)
   (Numbers-Eveil file-path)))

; end Eveil.rkt


