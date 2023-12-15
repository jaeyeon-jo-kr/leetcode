(define (parse roman num)
   (match roman
      [(list #\I #\V r ...) (parse r (+ num 4))]
      [(list #\I #\X r ...) (parse r (+ num 9))]
      [(list #\X #\L r ...) (parse r (+ num 40))]
      [(list #\X #\C r ...) (parse r (+ num 90))]
      [(list #\C #\D r ...) (parse r (+ num 400))]
      [(list #\C #\M r ...) (parse r (+ num 900))]
      [(list #\I r ...) (parse r (+ num 1))]
      [(list #\V r ...) (parse r (+ num 5))]
      [(list #\X r ...) (parse r (+ num 10))]
      [(list #\L r ...) (parse r (+ num 50))]
      [(list #\C r ...) (parse r (+ num 100))]
      [(list #\D r ...) (parse r (+ num 500))]
      [(list #\M r ...) (parse r (+ num 1000))]
      [(list) num]
      [else 'error]))

(define/contract (roman-to-int s)
  (-> string? exact-integer?)
  (parse (string->list s) 0)
  )
