; Author: Loïc Faure-Lacroix
(require-extension extras)
(require-extension srfi-69)

(load "disjoint-set.scm")
(load "list-util.scm")

; Kruskal algorithm is done here
(define (kruskal nodes edges)
  ; Loop that will check each element in the graph and add them
  ; or not to the shortest path
  (define (kruskal-forest forest result edges)
  
    (let* ((item (car edges))
           (t1 (ds-find forest (list-ref item 1)))
           (t2 (ds-find forest (list-ref item 2))))
      (if (null? (cdr edges))
        result
        (if (equal? t1 t2)
          (kruskal-forest forest result (cdr edges))
          (begin
            (ds-union forest t1 t2)
            (kruskal-forest forest (append result (list item)) (cdr edges)))))))

  ; Code starts here
  (sort-nodes edges)
  (let ((forest (make-hash-table)) (mst (list)))
    (fill-forest forest nodes)
    (kruskal-forest forest mst edges)))
