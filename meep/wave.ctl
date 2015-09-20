(reset-meep)
;
(set! geometry-lattice (make lattice (size 16 16 no-size)))

(set! geometry (list
                (make block (center -2 -1.62) (size 12 1 no-size)
                      (material (make dielectric (epsilon 12))))
                ;(make block (center 3.5 2) (size 1 12 infinity)
                ;      (material (make dielectric (epsilon 12))))
                (make block (center -2  0) (size 12 1 no-size)
                      (e1 -0.9962 0.0872 0) (e2 0.0872 0.9962 0) (e3 0 0 1)
                      (material (make dielectric (epsilon 12))))
                (make block (center -2  1.62) (size 12 1 no-size)
                      (material (make dielectric (epsilon 12))))
                      ))

(set! pml-layers (list (make pml (thickness 1.0))))
(set! resolution 10)
;
(set! sources (list
               (make source
                 (src (make continuous-src
                        (wavelength (* 2 (sqrt 12))) (width 20)))
                 (component Ey)
                 (center -7 -1.62) (size 0 1))
               (make source
                 (src (make continuous-src
                        (wavelength (* 2 (sqrt 12))) (width 20)))
                 (component Ex)
                 (center -7 -1.62) (size 0 1))
               ))
;
;(run-until 200 
;   (to-appended "ez-slice" 
;     (at-every 0.6 
;       (in-volume (volume (center 0 -3.5) (size 16 0))
;         output-efield-z))))
(run-until 500
           (at-beginning output-epsilon)
           (to-appended "ez" (at-every 1.5 output-efield-z)))
