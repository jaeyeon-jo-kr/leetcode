(define (findprefix strs prefix)
    (if (ormap empty? strs)
        ((compose list->string reverse) prefix)
        (let* ([heads (map car strs)]
               [h (car heads)])
            (if (andmap (lambda (x) (equal? x h)) heads)
                (findprefix (map cdr strs) (cons h prefix))
                ((compose list->string reverse) prefix)))))  



(define/contract (longest-common-prefix strs)
    (-> (listof string?) string?)
        (findprefix (map string->list strs) (list)))
