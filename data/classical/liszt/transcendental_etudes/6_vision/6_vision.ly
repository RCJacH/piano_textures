\version "2.20.0"

\include "..\..\..\..\..\assets\main.ily"
\include "header.ily"


motifOriginal = \markup \justify-line {
  \column {
    \score {
      \motifSingle { \time 1/8} "a " "Original" "6" { \tuplet 6/4 { r32 e'32 c'' g'' c'' e' }}
      \scoreLayout
    }
  }
  \column {
    \score {
      \motifSingle { \time 1/8 } "a1 " "Double time with fifth" "6" { c'64 g' c'' g'' c''' g'' c'' g' }
      \scoreLayout
    }
  }
  \column {
      \score {
      \motifSingle { \time 1/8 } "a1' " "Double time with thirds" "6" { r64 g' e'' g'' e''' g'' e'' g' }
      \scoreLayout
    }
  }
}

motifLonger = \markup \justify-line {
  \null
  \column {
    \score {
      \motifSingle { \time 1/4 } "a2 " "Quarter Arpeggio" "6" {
        \tuplet 12/8 { e'32 g' c'' e'' g'' c''' e''' c''' g'' e'' c'' g' }
      }
      \scoreLayout
    }
  }
  \null
  \column {
    \score {
      \motifSingle { \time 1/4 } "a2' " "Quarter Skewed" "6" \relative c'' {
        \tuplet 9/8 { c32 [e g c g e c g e }  <c g' c>16]
      }
      \scoreLayout
    }
  }
  \null
}

motifAccent = \markup \justify-line {
  \null
  \column {
    \score {
      \motifSingle { \time 1/4 } "a3 " "Accented Note" "6"
      \relative c' {\tuplet 6/4 { r32 c e g c e } \tuplet 7/4 { c' e, c g e c g } }
      \scoreLayout
    }
  }
  \null
  \column {
    \score {
      \motifMultiple { \time 1/4 } "a3' " "Chord Accent" 3/6
      {r8 \tuplet 6/4 { g'''32 c''' g'' e'' c'' g' }}
      {\tuplet 6/4 { g c' e' g' c'' e'' } <e''' g''>8 }
      \scoreLayout
    }
  }
  \null
}

motifChords = \markup \justify-line {
  \column {
    \score {
      \motifSingle { \time 1/4 } "a4 " "Diads" "6" \relative c {
        \tuplet 9/8 { e'32 g <c e> <e g> \ottava 1 <c' e> <e g> <c' e> <e, g> <c' e> }
      }
      \scoreLayout
    }
  }
  \column {
    \score {
      \motifSingle { \time 1/4 } "a4' " "Diad Octaves" "6" \relative c {
        <c e c'>16 <c' e c'> <c' e c'> <c, e c'>
      }
      \scoreLayout
    }
  }
  \column {
    \score {
      \motifSingle { \time 1/4 } "a4'' " "Triads" "6" \relative c' {
        <c e g c>16 <c' e g c> <c' e g c> <c, e g c>
      }
      \scoreLayout
    }
  }
}


combinationThreea = \markup {
  \score {
    \combinationPiano 1 { \time 3/4 } "Melody + a + Bass "
    { \key g \minor }
    <<
      \clef bass
      \new Voice = "1" \relative c {
        <bes d>4 <a cis> <bes d>
      }
    >>
    \voices 6, 2 <<
      {
        \voiceOne
        r8 \tuplet 6/4 { r32 bes, g d' g bes, }
        r8 \tuplet 6/4 { r32 a, g cis' g a, }
        r8 \tuplet 6/4 { r32 bes, g d' g bes, }
      } \\
      { \repeat unfold 3 { r8 g,,8 }}
    >>
    \scoreLayout
  }
}


combinationThreeb = \markup {
  \score {
    \combinationPiano 8 { \time 2/4 } "Melody + a1 + Bass "
    { \key g \minor }
    { \clef bass \new Voice = "1" { <d, f, bes,>4 r }}
    \voices 6, 2 <<
      { \voiceOne r8 bes,,64 f, bes, f bes f bes, f, bes,,8 r } \\
      { r8 bes,, bes,, r }
    >>
    \scoreLayout
  }
}


combinationThreec = \markup {
  \score {
    \combinationPiano 38 { \time 2/4 } "Melody + a3' + Chord "
    { \key g \major }
    \voices 6, 1 <<
      {
        \relative c' \tuplet 12/8 {
          b32 d g b d g \ottava 1 <b g' b> d b g \ottava 0 d b
        }
        \ottava 0
        \relative c' \tuplet 12/8 {
          b d fis b d fis \ottava 1 <b fis' b> d b \ottava 0 f d b
        }
        \ottava 0
      } \\
      { <b b'>4 <b b'> }
    >>
    \new Voice = "5" {
      <d, g, b, d>8 <d g b d'>
      <d, fis, c d> <d fis c' d'>
    }
    \scoreLayout
  }
}


combinationThreed = \markup {
  \score {
    \combinationPiano 40 { \time 2/4 } "Melody + a4 + Tremolo "
    { \key g \major }
    \voices 6, 1 <<
      {
        \relative c' \tuplet 12/8 {
          g32 bes <ees g> <g bes> <ees' g> <g bes>
          \ottava 1 <ees' g> <g, bes> <ees' g> r16.
        }
        \ottava 0
        \relative c' \tuplet 12/8 {
          g32 c <ees g> <g c> <ees' g>
          \ottava 1 <g c> <ees' g> <g, c> <ees' g> r16.
        }
        \ottava 0
      } \\
      { <g g'>4 <g g'> }
    >>
    \new Voice = "5" {
      \repeat tremolo 4 { \tuplet 12/12 { <ees, g, bes,>32 ees }}
      \repeat tremolo 4 { \tuplet 12/12 { <c, ees, g, >32 c }}
    }
    \scoreLayout
  }
}


combinationFoura = \markup {
  \score {
    \combinationPiano 21 { \time 1/4 } "Melody + a2 "
    { \key d \major }
    \voices 6, 1 <<
      { \tuplet 12/8 \relative c' { d32 f bes d f bes d bes f d bes f }} \\
      { <d' d''>4 }
    >>
    \voices 6, 3 <<
      { \tuplet 12/8 \relative c { d32 f bes d f bes d bes f d bes f }} \\
      { d4 }
    >>
    \scoreLayout
  }
}


combinationFourb = \markup {
  \score {
    \combinationPiano 24 { \time 1/4 } "Melody + a2 "
    { \key d \major }
    \voices 6, 1 <<
      {
        \tuplet 12/8 \relative c' {
          fis32 ais cis fis ais cis fis cis ais fis cis ais
        } r8
      } \\
      { <fis' fis''>4 }
    >>
    \voices 6, 3 <<
      {
        \tuplet 12/8 \relative c {
          fis32 cis' ais fis cis ais fis ais cis fis ais cis fis8
        }
      } \\
      { fis4 }
    >>
    \scoreLayout
  }
}


combinationFourc = \markup {
  \score {
    \combinationPiano 26 { \time 1/4 } "Melody + a2' "
    { \key d \major }
    \voices 6, 1 <<
      {
        \tuplet 9/8 \relative c'' {
          bes32 f' d bes d f \ottava 1 bes d f
        }
        <bes'' d''' bes'''>8
      } \\
      { <bes' bes''>4 }
    >>
    \voices 6, 3 <<
      {
        \tuplet 9/8 \relative c { bes32 d f bes f d bes f d } <bes,, f, bes,>8
      } \\
      { <bes, bes>4 }
    >>
    \scoreLayout
  }
}


combinationFourd = \markup {
  \score {
    \combinationPiano 53 { \time 3/4 } "Melody + a4' + a4'' "
    { \key g \major }
    \voices 1, 6 <<
      \set Timing.beamExceptions = #'()
      \set Timing.baseMoment = #(ly:make-moment 1/8)
      \set Timing.beatStructure = #'(2 1 1 1 1)
      { <d' b' >4 <b' g''>8 <g' e''> <e' c''> <c' a'> } \\
      {
        b16 <b' d'' b''> <b'' d''' b'''> <b' d'' b''>
        g' <g'' b'' g'''> e' <e'' g'' e'''> c' <c'' e'' c'''> a <a' c'' a''>
      }
    >>
    \voices 2, 5 <<
      { s4 <e, e>8 <g, g> <a,, a,> <c, c> } \\
      {
        <g, d g>16 \clef treble <b d' g'> <b' d'' g''> <b d' g'>
        \clef bass
        r <b g'> r <b e'> r <e c'> r <e a>
      }
    >>
    \scoreLayout
  }
}


combinationFivea = \markup {
  \score {
    \combinationPiano 17 { \time 1/4 } "Melody + a1' + Chord + a + Bass "
    { \key d \major }
    \voices 6, 1 <<
      { r64 fis' d'' fis'' d''' fis'' d'' fis' r8 } \\
      { s16 d'''8 }
    >>
    \voices 2, 5, 6 <<
      { s8 b,, } \\
      { <d fis d'>4 } \\
      { \voiceOne s8 \tuplet 6/4 { r32 b, fis d' fis b, }}
    >>
    \scoreLayout
  }
}


combinationFiveb = \markup {
  \score {
    \combinationPiano 32 { \time 2/4 } "Melody + a1 + Chord + Bass "
    { \key g \major }
    \voices 1, 3, 6 <<
      { <d' d''>4 <cis' cis''>} \\
      {
        \ottava 0 s8 \ottava 1 \relative c'''' \tuplet 6/4 { d32 g, d b g d }
        \ottava 0 s8 \ottava 1 \relative c''''  \tuplet 6/4 {
          cis32 g cis, \ottava 0 a g cis,
        }
      } \\
      {
        \relative c' \tuplet 6/4 { d32 [g b d g b } <d''' b'''>8]
        \relative c' \tuplet 6/4 { cis32 [g' ais cis g' ais } <cis''' ais''' >8]
      }
    >>
    \voices 2, 5 <<
      { s8 <g,, b,, d, g,>8 s8 <g,, ais,, cis, e, g,>8 } \\
      { <b, d g b>4 <ais, cis e g ais>}
    >>
    \scoreLayout
  }
}


\book {
  \bookOutputSuffix "motives"
  \header {
    piece = \markup { \bold \large "Motives" }
  }
  \markup \center-column {
    \large \bold "A. Open-voicing Arpeggio"
    \vspace #1
    \motifOriginal
    \vspace #1
    \motifLonger
    \vspace #1
    \motifAccent
    \vspace #1
    \motifChords
  }
}


\book {
  \bookOutputSuffix "3_part_combinations"
  \header {
    piece = \markup { \bold \large "3-part Combinations" }
  }
  \markup \left-column {
    \combinationThreea
    \vspace #1
    \combinationThreeb
    \vspace #1
    \combinationThreec
    \vspace #1
    \combinationThreed
  }
}


\book {
  \bookOutputSuffix "4_part_combinations"
  \header {
    piece = \markup { \bold \large "4-part Combinations" }
  }
  \markup \left-column {
    \combinationFoura
    \vspace #0.5
    "Arpeggio in parallel octave."
    \vspace #1
    \combinationFourb
    \vspace #0.5
    "Layered with inversion."
    \vspace #1
    \combinationFourc
    \vspace #0.5
    "Scewed to switch or expand octaves."
    \vspace #1
    \combinationFourd
  }
}


\book {
  \bookOutputSuffix "5_part_combinations"
  \header {
    piece = \markup { \bold \large "5-part Combinations" }
  }
  \markup \left-column {
    \combinationFivea
    \vspace #1
    \combinationFiveb
  }
}


\book {
  \trimmedPaper
  \header {}
  \bookpart { \combinationThreea }
  \bookpart { \combinationThreeb }
  \bookpart { \combinationThreec }
  \bookpart { \combinationThreed }
  \bookpart { \combinationFoura }
  \bookpart { \combinationFourb }
  \bookpart { \combinationFourc }
  \bookpart { \combinationFourd }
  \bookpart { \combinationFivea }
  \bookpart { \combinationFiveb }
}
