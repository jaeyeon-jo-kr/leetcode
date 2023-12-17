(define (parse s stack)
    (cond 
    [(and (empty? s) (empty? stack)) #t]
    [(empty? s) #f]
    [else 
    (match (list s stack)
        [(list (list (or #\( #\[ #\{ ) h ...) (list _ ...)) (parse h (cons (car s) stack)) ]
        [(list (list #\) coll ...) (list #\( stk ... )) (parse coll stk)]
        [(list (list #\] coll ...) (list #\[ stk ... )) (parse coll stk)]
        [(list (list #\} coll ...) (list #\{ stk ... )) (parse coll stk)]
        [else #f])]))

(define/contract (is-valid s)
  (-> string? boolean?)
  (parse (string->list s) '()))
