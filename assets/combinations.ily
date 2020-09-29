combinationPiano =
#(define-music-function
  (parser location bar setting label key top bottom)
  (number? ly:music? string? ly:music? ly:music? ly:music?)
  #{<<
      \new PianoStaff {

        \set PianoStaff.instrumentName = $label
        \set Score.currentBarNumber = $bar
        \bar ""
        $setting
        <<
          \new Staff = "top" \with {\consists "Span_arpeggio_engraver"} { $key $top }
          \new Staff = "bottom" \with {\consists "Span_arpeggio_engraver"} { \clef bass $key $bottom }
        >>
      }
    >>
  #})
