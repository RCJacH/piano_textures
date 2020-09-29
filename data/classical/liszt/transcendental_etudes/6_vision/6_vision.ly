\version "2.20.0"

\include "..\..\..\..\..\assets\main.ily"
\include "header.ily"


motifOriginal = \markup \fill-line {
  \column {
    \score {
      \motifSingle { \time 1/8} "a " "Original" "2" { \tuplet 6/4 { r32 e'32 c'' g'' c'' e' }}
      \scoreLayout
    }
  }
  \column {
    \score {
      \motifSingle { \time 1/8 } "a1 " "Double time with fifth" "2" { c'64 g' c'' g'' c''' g'' c'' g' }
      \scoreLayout
    }
  }
  \column {
      \score {
      \motifSingle { \time 1/8 } "a1' " "Double time with thirds" "2" { r64 g' e'' g'' e''' g'' e'' g' }
      \scoreLayout
    }
  }
}

motifLonger = \markup \fill-line {
  \hspace #1
  \column {
    \score {
      \motifSingle { \time 1/4 } "a2 " "Quarter Arpeggio" "2" {
        \tuplet 12/8 { e'32 g' c'' e'' g'' c''' e''' c''' g'' e'' c'' g' }
      }
      \scoreLayout
    }
  }
  \hspace #1
  \column {
    \score {
      \motifSingle { \time 1/4 } "a2' " "Quarter Skewed" "2" \relative c'' {
        \tuplet 9/8 { c32 [e g c g e c g e }  <c g' c>16]
      }
      \scoreLayout
    }
  }
  \hspace #1
}

motifAccent = \markup \fill-line {
  \hspace #1
  \column {
    \score {
      \motifSingle { \time 1/4 } "a3 " "Accented Note" "2"
      \relative c' {\tuplet 6/4 { r32 c e g c e } \tuplet 7/4 { c' e, c g e c g } }
      \scoreLayout
    }
  }
  \hspace #1
  \column {
    \score {
      \motifMultiple { \time 1/4 } "a3' " "Chord Accent" 0/2
      {r8 \tuplet 6/4 { g'''32 c''' g'' e'' c'' g' }}
      {\tuplet 6/4 { g c' e' g' c'' e'' } <e''' g''>8 }
      \scoreLayout
    }
  }
  \hspace #1
}

motifChords = \markup \fill-line {
  \column {
    \score {
      \motifSingle { \time 1/4 } "a4 " "Diads" "2" \relative c {
        \tuplet 9/8 { e'32 g <c e> <e g> \ottava 1 <c' e> <e g> <c' e> <e, g> <c' e> }
      }
      \scoreLayout
    }
  }
  \column {
    \score {
      \motifSingle { \time 1/4 } "a4' " "Diad Octaves" "2" \relative c {
        <c e c'>16 <c' e c'> <c' e c'> <c, e c'>
      }
      \scoreLayout
    }
  }
  \column {
    \score {
      \motifSingle { \time 1/4 } "a4'' " "Triads" "2" \relative c' {
        <c e g c>16 <c' e g c> <c' e g c> <c, e g c>
      }
      \scoreLayout
    }
  }
}


combinationThreea = \markup \column {
  \score {
    \combinationPiano 1 { \time 3/4 } "Melody + a + Bass "
    { \key g \minor }
    <<
      \clef bass
      \new Voice = "0" \relative c {
        <bes d>4 <a cis> <bes d>
      }
    >>
    <<
      \new Voice = "2" {
        \voiceOne
        r8 \tuplet 6/4 { r32 bes, g d' g bes, }
        r8 \tuplet 6/4 { r32 a, g cis' g a, }
        r8 \tuplet 6/4 { r32 bes, g d' g bes, }
      }
      \new Voice = "4" { \voiceTwo \repeat unfold 3 { r8 g,,8 }}
    >>
    \scoreLayout
  }
}


combinationThreeb = \markup \column {
  \score {
    \combinationPiano 8 { \time 2/4 } "Melody + a1 + Bass "
    { \key g \minor }
    { \clef bass \new Voice = "0" { <d, f, bes,>4 r }}
    <<
      \new Voice = "2" { \voiceOne r8 bes,,64 f, bes, f bes f bes, f, bes,,8 r }
      \new Voice = "4" { \voiceTwo r8 bes,, bes,, r }
    >>
    \scoreLayout
  }
}


combinationThreec = \markup \column {
  \score {
    \combinationPiano 38 { \time 2/4 } "Melody + a3' + Chord "
    { \key g \major }
    <<
      \new Voice = "2" {
        \voiceTwo
        \relative c' \tuplet 12/8 { b32 d g b d g \ottava 1 <b g' b> d b g \ottava 0 d b }
        \ottava 0
        \relative c' \tuplet 12/8 { b d fis b d fis \ottava 1 <b fis' b> d b \ottava 0 f d b }
        \ottava 0
      }
      \new Voice = "0" { \voiceOne <b b'>4 <b b'> }
    >>
    <<
      \new Voice = "3" {
        <d, g, b, d>8 <d g b d'>
        <d, fis, c d> <d fis c' d'>
      }
    >>
    \scoreLayout
  }
}


combinationThreed = \markup \column {
  \score {
    \combinationPiano 40 { \time 2/4 } "Melody + a4 + Tremolo "
    { \key g \major }
    <<
      \new Voice = "2" {
        \voiceTwo
        \relative c' \tuplet 12/8 { g32 bes <ees g> <g bes> <ees' g> <g bes> \ottava 1 <ees' g> <g, bes> <ees' g> r16. }
        \ottava 0
        \relative c' \tuplet 12/8 { g32 c <ees g> <g c> <ees' g> \ottava 1 <g c> <ees' g> <g, c> <ees' g> r16. }
        \ottava 0
      }
      \new Voice = "0" { \voiceOne <g g'>4 <g g'> }
    >>
    <<
      \new Voice = "3" {
        \repeat tremolo 4 { \tuplet 12/12 { <ees, g, bes,>32 ees }}
        \repeat tremolo 4 { \tuplet 12/12 { <c, ees, g, >32 c }}
      }
    >>
    \scoreLayout
  }
}


combinationFoura = \markup \column {
  \score {
    \combinationPiano 21 { \time 1/4 } "Melody + a2 "
    { \key d \major }
    <<
      \new Voice = "0" { \voiceOne <d' d''>4 }
      \new Voice = "2" { \voiceTwo
        \tuplet 12/8 \relative c' { d32 f bes d f bes d bes f d bes f }
      }
    >>
    <<
      \new Voice = "2" { \voiceTwo
        \tuplet 12/8 \relative c { d32 f bes d f bes d bes f d bes f }
      }
      \new Voice = "1" { \voiceOne d4 }
    >>
    \scoreLayout
  }
  \vspace #0.5
  "Arpeggio in parallel octave."
}


combinationFourb = \markup \column {
  \score {
    \combinationPiano 24 { \time 1/4 } "Melody + a2 "
    { \key d \major }
    <<
      \new Voice = "0" { \voiceOne <fis' fis''>4 }
      \new Voice = "2" { \voiceTwo
        \tuplet 12/8 \relative c' { fis32 ais cis fis ais cis fis cis ais fis cis ais } r8
      }
    >>
    <<
      \new Voice = "2" { \voiceTwo
        \tuplet 12/8 \relative c { fis32 cis' ais fis cis ais fis ais cis fis ais cis fis8 }
      }
      \new Voice = "1" { \voiceOne fis4 }
    >>
    \scoreLayout
  }
  \vspace #0.5
  "Layered with inversion."
}


combinationFourc = \markup \column {
  \score {
    \combinationPiano 26 { \time 1/4 } "Melody + a2' "
    { \key d \major }
    <<
      \new Voice = "0" { \voiceOne <bes' bes''>4 }
      \new Voice = "2" { \voiceTwo
        \tuplet 9/8 \relative c'' { bes32 f' d bes d f \ottava 1 bes d f} <bes'' d''' bes'''>8
      }
    >>
    <<
      \new Voice = "2" { \voiceTwo
        \tuplet 9/8 \relative c { bes32 d f bes f d bes f d } <bes,, f, bes,>8
      }
      \new Voice = "1" { \voiceOne <bes, bes>4 }
    >>
    \scoreLayout
  }
  \vspace #0.5
  "Scewed to switch or expand octaves."
}


combinationFourd = \markup \column {
  \score {
    \combinationPiano 53 { \time 3/4 } "Melody + a4' + a4'' "
    { \key g \major }
    <<
      \set Timing.beamExceptions = #'()
      \set Timing.baseMoment = #(ly:make-moment 1/8)
      \set Timing.beatStructure = #'(2 1 1 1 1)
      \new Voice = "0" {
        \voiceOne <d' b' >4 <b' g''>8 <g' e''> <e' c''> <c' a'>
      }
      \new Voice = "2" { \voiceTwo
        b16 <b' d'' b''> <b'' d''' b'''> <b' d'' b''>
        g' <g'' b'' g'''> e' <e'' g'' e'''> c' <c'' e'' c'''> a <a' c'' a''>
      }
    >>
    <<
      \new Voice = "4" { \voiceTwo s4 <e, e>8 <g, g> <a,, a,> <c, c> }
      \new Voice = "3" { \voiceOne
        <g, d g>16 \clef treble <b d' g'> <b' d'' g''> <b d' g'>
        \clef bass
        r <b g'> r <b e'> r <e c'> r <e a>
      }
    >>
    \scoreLayout
  }
  \vspace #0.5
}


combinationFivea = \markup \column {
  \score {
    \combinationPiano 17 { \time 1/4 } "Melody + a1' + Chord + a + Bass "
    { \key d \major }
    <<
      \new Voice = "2" { \voiceTwo r64 fis' d'' fis'' d''' fis'' d'' fis' r8 }
      \new Voice = "0" { \voiceOne s16 d'''8 }
    >>
    <<
      \new Voice = "3" { \voiceOne <d fis d'>4 }
      \new Voice = "2" { \voiceOne s8 \tuplet 6/4 { r32 b, fis d' fis b, }}
      \new Voice = "4" { \voiceTwo s8 b,, }
    >>
    \scoreLayout
  }
}


combinationFiveb = \markup \column {
  \score {
    \combinationPiano 32 { \time 2/4 } "Melody + a1 + Chord + Bass "
    { \key g \major }
    <<
      \new Voice = "0" { <d' d''>4 <cis' cis''>}
      \new Voice = "1" { \voiceOne
        \ottava 0 s8 \ottava 1 \relative c'''' \tuplet 6/4 { d32 g, d b g d }
        \ottava 0 s8 \ottava 1 \relative c''''  \tuplet 6/4 { cis32 g cis, \ottava 0 a g cis, }
      }
      \new Voice = "2" { \voiceTwo 
        \relative c' \tuplet 6/4 { d32 [g b d g b } <d''' b'''>8]
        \relative c' \tuplet 6/4 { cis32 [g' ais cis g' ais } <cis''' ais''' >8]
      }
    >>
    <<
      \new Voice = "3" { \voiceOne <b, d g b>4 <ais, cis e g ais>}
      \new Voice = "4" { \voiceTwo s8 <g,, b,, d, g,>8 s8 <g,, ais,, cis, e, g,>8 }
    >>
    \scoreLayout
  }
}


\book {
  \bookpart {
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
  \bookpart {
    \header {
      piece = \markup { \bold \large "2-part Combinations" }
    }

  }
  \bookpart {
    \header {
      piece = \markup { \bold \large "3-part Combinations" }
    }
    \markup \center-column {
      \column {
        \combinationThreea
        \vspace #1
        \combinationThreeb
        \vspace #1
        \combinationThreec
        \vspace #1
        \combinationThreed
      }
    }
  }
  \bookpart {
    \header {
      piece = \markup { \bold \large "4-part Combinations" }
    }
    \markup \center-column {
      \column {
        \combinationFoura
        \vspace #1
        \combinationFourb
        \vspace #1
        \combinationFourc
        \vspace #1
        \combinationFourd
      }
    }
  }
  \bookpart {
    \header {
      piece = \markup { \bold \large "5-part Combinations" }
    }
    \markup \center-column {
      \column {
        \combinationFivea
        \vspace #1
        \combinationFiveb
      }
    }
  }
}
