clipName =
#(define-music-function
(label)
(string?)
#{
  \once \override Score.RehearsalMark.self-alignment-X = #LEFT
  \once \override Score.RehearsalMark.font-size = #1.5
  \once \override Score.RehearsalMark.extra-offset = #`(0 . 0.6)
  \once \override Score.RehearsalMark.break-align-symbols = #'(key-signature)
  \mark \markup { \box \bold \pad-markup #0.2 $label }
#})
