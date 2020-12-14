\version "2.20.0"

\include "..\..\..\..\..\assets\main.ily"
\include "header.ily"


motifA = \motifSingle { \time 1/4 } "a" "Original" "6" { c'16 d' b c' }

motifB = \motifSingle { \time 1/4 } "a'" "Chromatic" "6" { c'16 des' b c' }

motifC = \motifSingle { \time 1/4 } "b" "Original" "6" { c'16 d' c' c'' }

motifD = \motifSingle { \time 1/4 } "b'" "Inversion" "6" { c''16 b' c'' c' }

motifE = \motifSingle { \time 1/4 } "b''" "Retrograde" "6" { c'16 c'' d'' c'' }

motifF = \motifSingle { \time 1/4 } "c" "Original 3751" "6" { e'16 b' g'' c'' }

motifG = \motifSingle { \time 1/4 } "c'" "3157 voicing" "6" { e'16 c'' g'' b
' }
motifH = \motifSingle { \time 1/4 } "c1" "Ascending" "6" { c'16 g' b' e'' }

motifI = \motifSingle { \time 1/4 } "c1'" "Descending" "6" { e''16 b' g' c' }


combinationTwoA =
  \combinationPiano 1 { \time 4/4} "a + Chord " { \key e \major }
  \new Voice = "1" {
    \relative {
      <cis'' cis'>16 dis bis cis dis e cis dis e fis dis e fis gis e fis
    }
  }
  \new Voice = "2" {
    <cis, cis>8 r
    \clef treble
    \relative {
      <fis' a> r <e gis> r <dis fis> r
    }
  }

combinationTwoB =
  \combinationPiano 2 { \time 4/4} "b + Chord " { \key e \major }
  \new Voice = "1" {
    \relative {
      gis''16 a gis cis fis, gis fis cis' e, fis e cis' dis, e dis cis'
    }
  }
  \new Voice = "2" {
    \clef treble
    <cis' e'>8 r
    \clef bass
    \relative {
      <a cis fis> r <gis cis e> r <fis cis' dis> r
    }
  }

combinationTwoC =
  \combinationPiano 3 { \time 4/4} "c + Chord " { \key e \major }
  \voices 1, 3 <<
  {
    \voiceTwo
    \relative {
      cis''16 gis' e' a, bis, fis' dis' gis, gis, e' cis' fis, gis, dis' bis' e,
    }
  } \\
  {
    \voiceOne
    {
      s16 gis''8 s16 s fis''8 s16 s e''8 s16 s dis''8 s16
    }
  }
  >>
  \new Voice = "2" {
    <cis gis e'>8 r <gis, fis bis> r <cis e cis'> r <gis, gis> r
  }

combinationTwoD =
  \combinationPiano 5 { \time 2/4} "Chord + a" { \key e \major }
  \new Voice = "6" {
    \relative {
      <b dis gis b>8 r <cis dis fisis> r
    }
  }
  \new Voice = "1" {
    \relative {
      gis,16 ais fis gis ais b gis ais
    }
  }

combinationTwoE =
  \combinationPiano 6 { \time 2/4} "Chord + b" { \key e \major }
  \new Voice = "6" {
    \relative {
      <b dis gis>8 r <cis e gis> r
    }
  }
  \new Voice = "1" {
    \relative {
      dis16 e dis gis cis, dis cis gis'
    }
  }

combinationTwoF =
  \combinationPiano 7 { \time 2/4} "Chord + c" { \key e \major }
  \new Voice = "6" {
    <b dis' gis' b'>8 r <dis'' ais'' dis'''>4
  }
  \voices 1, 3 <<
  {
    \voiceTwo
    \relative {
      gis,16 e' b' dis, fisis, e' ais dis,
    }
  } \\
  {
    \voiceOne
    {
      s16 e8 s16 s e8 s16
    }
  }
  >>

combinationTwoG =
  \combinationPiano 35 { \time 3/4} "b + c1'" { \key e \major }
  \new Voice = "1" {
    \relative {
       b''16 cis b gis' gis, ais gis eis' eis, fis eis d'
    }
  }
  \new Voice = "6" {
    \clef treble
    \relative {
      gis''16 d b eis, eis' b gis d d' gis, e b
    }
  }

combinationTwoH =
  \combinationPiano 75 { \time 4/4 } "b + b'" { \key e \major }
  \new Voice = "1" {
    \relative {
      cis''16 d cis ais' bis, cis bis a' b, c b gis' ais, b ais g'
    }
  }
  \new Voice = "6" {
    cis'16 bis cis' gis, bis b bis gis, b ais b gis, ais gisis ais gis,
  }



combinationThreeA =
  \combinationPiano 29 { \time 4/4 } "a|a' + b' + Chord" { \key e \major }
  \voices 1, 5 <<
    {
      \relative {
        dis''16 e cisis dis e fis dis e a b gis a d, e cis d |
        g a fis g c, d b c fis g eis fis b, c ais b
      }
    } \\
    {
      \voiceTwo
      r4 b' e'' a' | d'' g' cis'' fis'
    }
  >>
  \new Voice = "3" {
    {
      \clef treble
      <b b'>4 g'16 fis' g' b c'4 fis'16 eis' fis' a |
      b4 \clef bass e'16 dis' e' g a4 dis'16 cis' dis fis
    }
  }

combinationThreeB =
  \combinationPiano 31 { \time 4/4 } "a|a' + Melody" { \key e \major }
  \voices 1, 6 <<
    { \relative { e''4 d c b a g fis e } } \\
    {
      \relative {
        b'16 c a b a b g a g a fis g fis g e fis |
        e fis d e d e c d c d b c b c a b
      }
    }
  >>
  \new Voice = "6" {
    \relative {
      g16 a fis g fis g e fis e fis d e d e c d |
      c d b c b c a b a b g a g a fis g
    }
  }

combinationThreeC =
  \combinationPiano 41 { \time 4/4 } "b'' + b + c1'" { \key e \major }
  \new Voice = "1" {
    \relative {
      dis'16 dis' e dis cis b ais gis fisis gis fis e' e, fis e cis |
      dis16 dis' e dis cis b ais gis gisis ais gisis fis' fis, gis fis dis |
    }
  }
  \new Voice = "6" {
    \relative {
      b, dis fisis gis ais b cis dis e a, fisis cis cis' fisis, e ais, |
      b dis fisis gis ais b cis dis fis bis, gisis dis dis' gisis, fis bis, |
    }
  }

combinationThreeD =
  \combinationPiano 71 { \time 4/4 } "b + Chord + Bass" { \key e \major }
  \new Voice = "1" {
    \relative {
      s4 gis''16 a gis e' fisis, gis fisis e' fis, gis fis dis' |
      eis, fis eis d' e, fis e cis' dis, e dis cis' dis, e dis bis'
    }
  }
  {
    \set Timing.beamExceptions = #'()
    \set Timing.baseMoment = #(ly:make-moment 1/4)
    \set Timing.beatStructure = #'(1 1 1 1)
    \partcombine
    \new Voice = "2" {
      \hide Stem
      s4 s8 e, s e, s e, | s e, s e, s e, s e,
    }
    \new Voice = "5" {
      \voiceOne
      \override NoteColumn.ignore-collision = ##t
      s4 <gis gis'>8 e, <ais ais'> e, <a a'> e, |
      <gis gis'> e, <gis g'> e, <gis fis'> e, <gis dis'>
      \override NoteColumn.ignore-collision = ##f e,
    }

  }


\book {
  \bookOutputSuffix "motives"
  \header {
    piece = \markup { \bold \large "Motives" }
  }
  \markup \center-column {
    \large \bold "A. Neighbor Group"
    \vspace #1
    \justify-line {
      \null
      \column { \scoreMarkup ##{ \motifA #} }
      \null
      \column { \scoreMarkup ##{ \motifB #} }
      \null
    }
    \vspace #1
    \large \bold "B. Neighbor Note Octave"
    \vspace #1
    \justify-line {
      \null
      \column { \scoreMarkup ##{ \motifC #} }
      \null
      \column { \scoreMarkup ##{ \motifD #} }
      \null
      \column { \scoreMarkup ##{ \motifE #} }
    }
    \vspace #1
    \large \bold "C. Open-Voiced Arpeggio"
    \vspace #1
    \justify-line {
      \null
      \column { \scoreMarkup ##{ \motifF #} }
      \null
      \column { \scoreMarkup ##{ \motifG #} }
      \null
      \column { \scoreMarkup ##{ \motifH #} }
      \null
      \column { \scoreMarkup ##{ \motifI #} }
      \null
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
    \vspace #0.5
    "Stack motif to form displaced ascending melody."
    \vspace #1
    \scoreMarkup ##{ \combinationTwoB #}
    \vspace #0.5
    "A pedal note can be included."
    \vspace #1
    \scoreMarkup ##{ \combinationTwoC #}
    \vspace #0.5
    "The essence of this motif is the motion from the 2nd to the 4th note."
    \vspace #1
    \line {
      \scoreMarkup ##{ \combinationTwoD #}
      \scoreMarkup ##{ \combinationTwoE #}
      \scoreMarkup ##{ \combinationTwoF #}
    }
    "All three combinations above can be played by the left hand as well."
    \vspace #1
    \line {
      \scoreMarkup ##{ \combinationTwoG #}
      \scoreMarkup ##{ \combinationTwoH #}
    }
    "Variation or arpeggio to add expansion and movement to the sequence."
  }
}


\book {
  \bookOutputSuffix "3_part_combinations"
  \header {
    piece = \markup { \bold \large "3-part Combinations" }
  }
  \markup \left-column {
    \scoreMarkup ##{ \combinationThreeA #}
    \vspace #0.5
    "b' motif works as bass line with non-chordal notes."
    \vspace #1
    \scoreMarkup ##{ \combinationThreeB #}
    \vspace #0.5
    "Parallel motives can be used with a melody line."
    \vspace #1
    \scoreMarkup ##{ \combinationThreeC #}
    \vspace #0.5
    "Use scales to connect different motif variations."
    \vspace #1
    \scoreMarkup ##{ \combinationThreeD #}
    \vspace #0.5
    "Eighth note reverse stride (or forward stride) as accompaniment."
  }
}


\book {
  \trimmedPaper
  \bookOutputSuffix "motif"
  \bookpart { \scoreWithLayout \motifA }
  \bookpart { \scoreWithLayout \motifB }
  \bookpart { \scoreWithLayout \motifC }
  \bookpart { \scoreWithLayout \motifD }
  \bookpart { \scoreWithLayout \motifE }
  \bookpart { \scoreWithLayout \motifF }
  \bookpart { \scoreWithLayout \motifG }
  \bookpart { \scoreWithLayout \motifH }
  \bookpart { \scoreWithLayout \motifI }
}


\book {
  \trimmedPaper
  \header {}
  \bookpart { \scoreWithLayout \combinationTwoA }
  \bookpart { \scoreWithLayout \combinationTwoB }
  \bookpart { \scoreWithLayout \combinationTwoC }
  \bookpart { \scoreWithLayout \combinationTwoD }
  \bookpart { \scoreWithLayout \combinationTwoE }
  \bookpart { \scoreWithLayout \combinationTwoF }
  \bookpart { \scoreWithLayout \combinationTwoG }
  \bookpart { \scoreWithLayout \combinationTwoH }
  \bookpart { \scoreWithLayout \combinationThreeA }
  \bookpart { \scoreWithLayout \combinationThreeB }
  \bookpart { \scoreWithLayout \combinationThreeC }
  \bookpart { \scoreWithLayout \combinationThreeD }
}


\book {
  \bookOutputSuffix "midi"
  \bookpart { \scoremidi \motifA }
  \bookpart { \scoremidi \motifB }
  \bookpart { \scoremidi \motifC }
  \bookpart { \scoremidi \motifD }
  \bookpart { \scoremidi \motifE }
  \bookpart { \scoremidi \motifF }
  \bookpart { \scoremidi \motifG }
  \bookpart { \scoremidi \motifH }
  \bookpart { \scoremidi \motifI }
}
