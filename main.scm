(load "kruskal.scm")
(load "prim.scm")

; Nodes are our points and edges are the distance
; between two nodes. 
(define nodes '("A" "B" "C" "D" "E" "F" "G"))
(define edges '((7 "A" "B")
                (5 "A" "D")
                (8 "B" "C")
                (9 "B" "D")
                (7 "E" "B")
                (5 "C" "E")
                (15 "D" "E")
                (6 "D" "F")
                (8 "E" "F")
                (9 "E" "G")
                (11 "F" "G")))

; Call the kruskal algorithm with the nodes and edges above
(print "Kruskal algo")
(print (kruskal nodes edges))

; Call the kruskal algorithm with the nodes and edges above
(print "Prim algo")
(print (prim nodes edges))
