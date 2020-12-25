\version "2.20.0"

\include "..\..\..\..\..\assets\main.ily"
\include "header.ily"


motifA = \motifSingle { \time 1/4 } "a" "Ascending" "6" { c'16 cis' d' dis' }

motifB = \motifSingle { \time 1/4 } "a'" "Descending" "6" { c''16 b' bes' a' }

motifC = \motifSingle { \time 1/4 } "a''" "Other variants" "6" { c'' b' des'' c'' }

stride = \motifMultiple { \time 4/4 \clef bass } "Stride " "" 2/5 { \repeat unfold 2 {c8 r s r} } { \repeat unfold 2 { s4 <g c' e'>8 s } }

combinationFourA =
  \combinationPiano 1 { \time 4/4} "a + Chord + Stride " {}
  \voices 1, 6 <<
    \relative a' {
      a16 ais b c cis d dis e f fis g gis a ais b c
    } \\
    { <c' e'>16 s8. <e' a'>16 s8. <a' d''>16 s8. <d'' f''>16 s8. }
  >>
  \voices 2, 5 <<
    { \voiceOne \repeat unfold 2 { a,8 r s r }} \\
    { \voiceTwo s4 <e a c'>8 s s4 <f a d'>8 s }
  >>


combinationFourB =
  \combinationPiano 3 { \time 4/4} "a'|a'' + Chord + Stride " {}
  \voices 1, 6 <<
    \relative c'' {
      gis'16 g! fis f e dis f e dis d! cis c! b c d c
    } \\
    \relative c'' {
      <b e>16 s8. <gis b>16 s8. <a c>16 s8. <e a>16 s8.
    }
  >>
  \voices 2, 5 <<
    { \voiceOne e,8 r s r a, r s r} \\
    { \voiceTwo s4 <e b d'>8 s s4 <e a c'>8 s }
  >>


combinationFourC =
  \combinationPiano 6 { \time 4/4} "a|a'|a'' + Chord + Stride " {}
  \voices 1, 6 <<
    \relative c''' {
      cis16 d dis e f e dis d cis c b bes a gis b! a
    } \\
    \relative c'' {
      <e a>16 s8. <a c>16 s8. <e a>16 s8. <c e>16 s8.
    }
  >>
  \voices 2, 5 <<
    { \voiceOne <a,, a,>8 r s r s r r4} \\
    { \voiceTwo s4 <e a c'>8 s <a c' e'>8 s4. }
  >>


combinationFourD =
  \combinationPiano 6 { \time 4/4} "a|a'|a'' + Chord + Stride " {}
  \voices 1, 6 <<
    \relative c'' {
      f16 e ees d cis d f d b! c! e! c ais! b e b
    } \\
    \relative c'' {
      <bes d>16 s8. <f bes>16 s8. <e! a>16 s8. <d gis>16 s8.
    }
  >>
  \voices 2, 5 <<
    { \voiceOne d,8 r s4 s e } \\
    { \voiceTwo s4 <d f bes d'> <e a c'> s4 }
  >>


\book {
  \bookOutputSuffix "motives"
  \header {
    piece = \markup { \bold \large "Motives" }
  }
  \markup \center-column {
    \large \bold "A. Chromatic Scale"
    \vspace #1
    \justify-line {
      \null
      \column { \scoreMarkup ##{ \motifA #} }
      \null
      \column { \scoreMarkup ##{ \motifB #} }
      \null
      \column { \scoreMarkup ##{ \motifC #} }
    }
    \vspace #1
    \large \bold "B. Stride"
    \vspace #1
    \column { \scoreMarkup ##{ \stride #}}
  }
}


\book {
  \bookOutputSuffix "4_part_combinations"
  \header {
    piece = \markup { \bold \large "4-part Combinations" }
  }
  \markup \left-column {
    \scoreMarkup ##{ \combinationFourA #}
    \vspace #0.5
    "Create chords by using the melody as top note."
    \vspace #1
    \scoreMarkup ##{ \combinationFourB #}
    \vspace #0.5
    "Change directions and accents using melodic variations."
    \vspace #1
    \scoreMarkup ##{ \combinationFourC #}
    \vspace #0.5
    "Double octave to thicken the bass."
    "Break out stride pattern to emphasize."
    \vspace #1
    \scoreMarkup ##{ \combinationFourD #}
    \vspace #0.5
    "Semi-arpeggios can be used to add interest."
  }
}


\book {
  \trimmedPaper
  \bookOutputSuffix "motif"
  \bookpart { \scoreWithLayout \motifA }
  \bookpart { \scoreWithLayout \motifB }
  \bookpart { \scoreWithLayout \motifC }
  \bookpart { \scoreWithLayout \stride }
}


\book {
  \trimmedPaper
  \header {}
  \bookpart { \scoreWithLayout \combinationFourA }
  \bookpart { \scoreWithLayout \combinationFourB }
  \bookpart { \scoreWithLayout \combinationFourC }
  \bookpart { \scoreWithLayout \combinationFourD }
}

\book {
  \bookOutputSuffix "midi"
  \bookpart { \scoremidi \motifA }
  \bookpart { \scoremidi \motifB }
  \bookpart { \scoremidi \motifC }
  \bookpart { \scoremidi \stride }
}
