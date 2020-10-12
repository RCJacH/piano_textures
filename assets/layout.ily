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
