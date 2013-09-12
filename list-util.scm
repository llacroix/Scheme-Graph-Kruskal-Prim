; Sort edges in increasing order
; the first element of each edges should be the 
; weight of the edge
; (5 "A" "B") is an edge of weight 5 connecting
; the node A and B
(define (sort-nodes nodes)
  (sort! nodes (lambda (x y)
    (< (car x) (car y)))))

; Fill the forest of nodes in our DisjointSet
;
; Each node added to the tree points to itself
;
(define (fill-forest forest nodes)
  (for-each (lambda (node)
    (ds-add forest node)) nodes))
