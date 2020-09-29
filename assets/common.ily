#(define-markup-command (No layout props n) (string?)
  ; Create and stylize a No. string before a number
  (define (format-char c)
    (let ((s (string c)))
      (if (number? (string->number s))
          (markup #:hspace 0.125 #:number s #:hspace 0.125)
          (markup #:hspace 0 #:fontsize 2 s))))
  (define (format-string s i)
    (let ((n (string-length s)))
      (if (= n 0)
          (markup #:null)
          (markup (format-char (string-ref s i))
                  (if (= (1+ i) n)
                      (markup #:null)
                      (format-string s (1+ i)))))))
  (let ((i (string-length n)))
    (interpret-markup layout props
     (markup
      #:concat
       (#:concat
        (#:fontsize 2
         "N"
         #:hspace 0
         #:override '(baseline-skip . 0.825)
         #:override '(direction . 1)
         #:dir-column (#:fontsize 2 #:center-align "."
                       #:fontsize 1 #:center-align "o"))
         #:hspace 0.5
         #:concat ((format-string n 0)
                   #:hspace -.8
                   #:fontsize 2 "."))
         #:hspace -2))))


u = \change Staff = "top"
l = \change Staff = "bottom"


scoreLayout = \layout {
  \context {
    \Score
    \consists "Span_arpeggio_engraver"
  }
  \context {
    \PianoStaff
    \remove Span_bar_engraver
  }
  \context {
    \Staff
    \omit TimeSignature
    \omit BarLine
    \override Beam.beam-thickness = #0.32
    \override Beam.length-fraction = #0.75
    \override TupletBracket.bracket-visibility = ##f
  }
  \context {
    \Voice
    \consists #COLORED_NOTEHEAD_BY_VOICE_ENGRAVER
  }
}
