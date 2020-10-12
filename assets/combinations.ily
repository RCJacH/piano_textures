combinationPiano =
#(define-music-function
  (bar setting label key top bottom)
  (number? ly:music? string? ly:music? ly:music? ly:music?)
  #{<<
      \new PianoStaff {
        \set Score.currentBarNumber = $bar
        \bar ""
        $setting
        <<
          \new Staff = "top" \with {\consists "Span_arpeggio_engraver"} {
            \clipName $label
            $key $top
          }
          \new Staff = "bottom" \with {\consists "Span_arpeggio_engraver"} { \clef bass $key $bottom }
        >>
      }
    >>
  #})
