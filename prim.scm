; Author: Loïc Faure-Lacroix
(require "extras")
(require "srfi-69")
(require "srfi-1")

(require "disjoint-set")
(require "list-util")

; Check of tree of a contains b
; Check if both tree roots are the same
(define (contains forest a b)
  (let ((root (ds-find forest a))
        (node (ds-find forest b)))
    (equal? root node)))

; Get first edge in the list of edges that has
; at least one node in the tree but not both
; it returns the first match
(define (get-edge forest root edges)
  (find (lambda (edge)
    (let ((nodeA (list-ref edge 1))
          (nodeB (list-ref edge 2)))
      (and (not (contains forest nodeA nodeB))
           (or (contains forest root nodeA)
               (contains forest root nodeB)))))
    edges))

; Prim algorithm we have to copy
(define (prim nodes edges)
  (define (prim-forest forest result root edges)
    (let ((edge (get-edge forest root edges)))
      (if edge
        (begin
            (ds-union forest root (list-ref edge 1))
            (ds-union forest root (list-ref edge 2))
            (prim-forest forest (append result (list edge)) root edges))
        result)))

  ; Code starts here
  (sort-nodes edges)
  (let ((forest (make-hash-table)) (mst (list)) (root (car nodes)))
    (fill-forest forest nodes)
    (prim-forest forest mst root edges)))
