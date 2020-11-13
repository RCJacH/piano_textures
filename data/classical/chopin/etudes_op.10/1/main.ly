\version "2.20.0"

\include "..\..\..\..\..\assets\main.ily"
\include "header.ily"


motifA = \motifSingle { \time 1/4 } "*" "Original" "6" { c'16 g' b' e'' }

motifB = \motifSingle { \time 2/4 } "a" "Displaced" "6" { r16 c' g' b' e'' s8. }

motifC = \motifSingle { \time 1/4 } "a'" "Retrograde" "6" { e''16 b' g' c' }


combinationTwoA =
  \combinationPiano 1 { \time 4/4} "a + a' + Bass " {}
  \new Voice = "6" {
    \voiceOne
    \relative {
      \l r16 c g' c \u e c g' c e c g' c \ottava #1 e c g' c |
      e c g c, \ottava #0 e c g c, e c g c, e c g c, |
    }
  }
  \new Voice = "2" { <c, c>1~ <c, c> }


combinationTwoB = {
  \combinationPiano 3 { \time 4/4 } "a + a' + Bass " {}
  \new Voice = "6" {
    \voiceOne
    \relative {
      \l r16 c a' c \u f c a' c f c a' c \ottava #1 f c a' c |
      f c a c, \ottava #0 f c a c, f c a c, f c a c, |
    }
  }
  \new Voice = "2" { <c, c>1~ <c, c> }
}


combinationTwoC = {
  \combinationPiano 55 { \time 4/4 } "a + a' + Bass " {}
  \new Voice = "6" {
    \voiceOne
    \relative {
      \l r16 c f aes \u d c f aes d c f aes \ottava #1 d c f aes |
      d g, f b, \ottava #0 d g, f b, d g, f b, dis g f b, |
    }
  }
  \new Voice = "2" { <c, c>1~ <c, c> }
}


combinationTwoD = {
  \combinationPiano 42 { \time 4/4 } "a + a' + Bass " { }
  \new Voice = "6" {
    \voiceOne
    \relative {
      g'''16 d b e, g d b e, a c g' e a c g' e |
      f c a d, f c a d, g b f' d g b f' d |
    }
  }
  \new Voice = "2" { <e,, e,>2 <a,, a,> <d,, d,> <g,, g,> }
}



\book {
  \bookOutputSuffix "motives"
  \header {
    piece = \markup { \bold \large "Motives" }
  }
  \markup \center-column {
    \large \bold "A. 1573 Voiced Arpeggio"
    \vspace #1
    \justify-line {
      \null
      \column { \scoreMarkup ##{ \motifA #} }
      \null
      \column { \scoreMarkup ##{ \motifB #} }
      \null
      \column { \scoreMarkup ##{ \motifC #} }
    }
  }
}


\book {
  \bookOutputSuffix "2_part_combinations"
  \header {
    piece = \markup { \bold \large "2-part Combinations" }
  }
  \markup \left-column {
    \scoreMarkup ##{ \combinationTwoA #}
    \vspace #1
    \scoreMarkup ##{ \combinationTwoB #}
    \vspace #0.5
    "Triad in inversion."
    \vspace #1
    \scoreMarkup ##{ \combinationTwoC #}
    \vspace #0.5
    "1. Drop-2 voicing for seventh."
    "2. Harmony can change during single direction arpeggio."
    \vspace #1
    \scoreMarkup ##{ \combinationTwoD #}
    \vspace #0.5
    "1. Diminution of arpeggio length."
    "2. In this case seventh can also be closed-voiced."
  }
}


\book {
  \trimmedPaper
  \bookOutputSuffix "motif"
  \bookpart { \scoreWithLayout \motifA }
  \bookpart { \scoreWithLayout \motifB }
  \bookpart { \scoreWithLayout \motifC }
}


\book {
  \trimmedPaper
  \header {}
  \bookpart { \scoreWithLayout \combinationTwoA }
  \bookpart { \scoreWithLayout \combinationTwoB }
  \bookpart { \scoreWithLayout \combinationTwoC }
  \bookpart { \scoreWithLayout \combinationTwoD }
}

\book {
  \bookOutputSuffix "midi"
  \bookpart { \scoremidi \motifA }
  \bookpart { \scoremidi \motifB }
  \bookpart { \scoremidi \motifC }
}
