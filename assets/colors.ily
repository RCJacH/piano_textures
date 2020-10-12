#(define (NOTEHEAD-COLORS id)
  (let
    ((color
      (case id
        ((1) (rgb-color 0.968627 0.341176 0.509804)) ; Highest RGB(247, 87, 130)
        ((2) (rgb-color 0.443137 0.611765 0.960784)) ; Lowest RGB(113, 156, 245)
        ((3) (rgb-color 0.854902 0.368627 0.101961)) ; Second-Highest RGB(218, 94, 26)
        ((5) (rgb-color 0.247059 0.8 0.780392)) ; Third-Highest RGB(63, 204, 199)
        ((6) (rgb-color 0.733333 0.443137 0.913725)) ; Third-Lowest RGB(187, 113, 233)
        (else black))))
    color))


#(define COLORED_NOTEHEAD_BY_VOICE_ENGRAVER
  (make-engraver
    (acknowledgers
     ((note-head-interface engraver grob source-engraver)
      (let* (
            (context (ly:translator-context engraver))
            (id (ly:context-id context))
            (color (NOTEHEAD-COLORS (string->number id))))
        (ly:grob-set-property! grob 'color color))))))
