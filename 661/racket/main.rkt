
(define (avg lst)
  (floor
   (/ (foldl + 0 lst)
      (length lst))))

(define (nei row col rsize csize)
  (for*/list ([r (range (- row 1) (+ row 2))]
             [c (range (- col 1) (+ col 2))]
             #:when (and (<= 0 r (- rsize 1))
                         (<= 0 c (- csize 1))))
    (list r c)))

(define (pick-cell cmap indexes)
  (map (lambda (i)
         (let ([row (first i)]
               [col (second i)])
              (list-ref 
               (list-ref cmap row)
               col))) indexes))

(define (smooth-cell img row col rsize csize)
  (avg
   (pick-cell img
    (nei row col rsize csize))))

(define (cycle buf lst size)
  (if (< size (length lst))
      (cycle (append buf (list (take lst size)))
             (drop lst size)
             size)
  (append buf (list lst))))

(define (smooth img)
  (let* ([rsize (length img)]
         [csize (foldl max 0 (map length img))])
    (cycle
     (list)
     (for*/list ([r (range rsize)]
                [c (range csize)])
       (smooth-cell img r c rsize csize))
     csize)))

; (smooth '((1 2 3) (3 4 5) (9 9 9)))

(define/contract (image-smoother img)
  (-> (listof (listof exact-integer?)) (listof (listof exact-integer?)))
  (smooth img))
