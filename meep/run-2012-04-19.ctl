(reset-meep)
;
(set! geometry-lattice (make lattice (size 16 16 no-size)))

(set! geometry (list
                (make block (center -2 -1.62) (size 12 1 1)
                      (material (make dielectric (epsilon 12))))
                (make block (center -2  0) (size 12 1 1)
                      (e1 -0.9986 0.0523 0) (e2 0.0523 0.9986 0) (e3 0 0 1)
                      (material (make dielectric (epsilon 12))))
                (make block (center -2  1.62) (size 12 1 1)
                      (material (make dielectric (epsilon 12))))
                      ))

(set! pml-layers (list (make pml (thickness 1.0))))
(set! resolution 10)
;
(set! sources (list
               (make source
                 (src (make continuous-src
                        (wavelength 2) (width 20)))
                 (component Ez)
                 (center -7 -1.62) (size 0 1))
               ))
;
(run-until 500
           (at-beginning output-epsilon)
           (to-appended "ez" (at-every 1.5 output-efield-z)))