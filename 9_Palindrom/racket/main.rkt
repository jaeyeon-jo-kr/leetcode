(define (compare x)
  (-> exact-integer? boolean?)
  (string=? 
    (number->string x)
    (list->string 
        (reverse 
                (string->list
                    (number->string x)))))) 

(define/contract (is-palindrome x)
  (-> exact-integer? boolean?)
  (compare x))
