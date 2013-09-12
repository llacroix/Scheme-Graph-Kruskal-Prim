; Author: Loïc Faure-Lacroix
(require-extension extras)
(require-extension srfi-69)

(load "disjoint-set.scm")
(load "list-util.scm")

; Prim algorithm we have to copy
(define (prim nodes edges)
  (define (prim-forest forest mst edges)
    edges)

  ; Code starts here
  (sort-nodes edges)
  (let ((forest (make-hash-table)) (mst (list)))
    (fill-forest forest nodes)
    (prim-forest forest mst edges)))
