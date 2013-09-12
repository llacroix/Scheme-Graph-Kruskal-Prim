(define (sort-nodes nodes)
  (sort! nodes (lambda (x y)
    (< (car x) (car y)))))

; Fill the forest of nodes in our DisjointSet
(define (fill-forest forest nodes)
  (ds-add forest (car nodes))
  (if (null? (cdr nodes))
    #t
    (fill-forest forest (cdr nodes))))
