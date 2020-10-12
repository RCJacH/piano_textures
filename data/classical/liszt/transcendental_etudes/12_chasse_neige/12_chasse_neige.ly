\version "2.20.0"

\include "..\..\..\..\..\assets\main.ily"
\include "header.ily"


motifa = \markup \justify-line {
  \column {
    \score {
      \motifSingle { \time 1/8 } "a " "Original" "6" { \repeat unfold 4 { c'64 e' }}
      \scoreLayout
    }
    \vspace #1
    \score {
      \motifSingle { \time 1/8 } "a' " "Inversion" "6" { \repeat unfold 4 { e'64 c' }}
      \scoreLayout
    }
  }
  \column {
    \score {
      \motifSingle { \time 1/8 } "a1 " "Doubling on accent" "6" { \repeat unfold 4 { <c' e'>64 g' }}
      \scoreLayout
    }
    \vspace #1
    \score {
      \motifSingle { \time 1/8 } "a1' " "Doubling on accent" "6" { \repeat unfold 4 { <e' g'>64 c' }}
      \scoreLayout
    }
  }
  \column {
    \score {
      \motifSingle { \time 1/8 } "a2 " "Doubling on syncropation" "6" { \repeat unfold 4 { c'64 <e' g'> }}
      \scoreLayout
    }
    \vspace #1
    \score {
      \motifSingle { \time 1/8 } "a2' " "Doubling on syncropation" "6" { \repeat unfold 4 { g'64 <e' c'> }}
      \scoreLayout
    }
  }
}


motifaTwoHanded = \markup \justify-line {
  \null
  \column {
    \score {
      \motifPiano { \time 1/8 } "a'' " "Split voicing" "6" { \stemUp \repeat unfold 4 { \l <g c'>64 \u <e' g'> }} { s8 }
      \scoreLayout
    }
  }
  \column {
    \score {
      \motifPiano { \time 1/8 } "a1'' " "Identical voicing" "6" { \stemUp \repeat unfold 4 { \l <e g c'>64 \u <e' g' c''> }} { s8 }
      \scoreLayout
    }
  }
  \null
}


motifbSetting = {
  \time 2/4
  \clef bass
}


motifb = \markup \justify-line {
  \null
  \column {
    \score {
      \motifMultiple \motifbSetting "b " "Original" 5/2 { r16 <g e'> r <g e'> } { c,8 c, }
      \scoreLayout
    }
  }
  \column {
    \score {
      \motifMultiple \motifbSetting "b1 " "Thicker" 5/2 { \repeat unfold 2 { r16 <g e' g'> }} { c,8 c, }
      \scoreLayout
    }
  }
  \column {
    \score {
      \motifMultiple \motifbSetting "b2 " "Octaves" 5/2 { \repeat unfold 2 { r16 <g c' e'> }} { \repeat unfold 2 { <c, c>8 }}
      \scoreLayout
    }
  }
  \null
}


combinationTwoa = \markup {
  \score {
    \combinationPiano 2 { \time 3/8 } "a + Bass "
    { \key bes \minor }
    \new Voice = "6" {
      \set subdivideBeams = ##t
      \set baseMoment = #(ly:make-moment 1/8)
      \repeat unfold 12 { ees'64 ges' }
    }
    \new Voice = "2" { \autoBeamOff bes8 ges bes, }
    \scoreLayout
  }
}


combinationTwob = \markup {
  \score {
    \combinationPiano 3 { \time 3/8 } "Melody + a|a2 "
    { \key bes \minor }
    \voices 6, 1 <<
      \set Staff.connectArpeggios = ##t
      \relative c' {
        \autoBeamOn
        \set subdivideBeams = ##t
        \set baseMoment = #(ly:make-moment 1/8)
        ees64\arpeggio ges
        \repeat unfold 7 { ees64 ges }
        \repeat unfold 4 { ees <ges a> }
      } \\
      \relative c'''{ \autoBeamOff ges8\arpeggio f ees }
    >>
    { s4. }
    \scoreLayout
  }
}


combinationTwoc = \markup {
  \score {
    \combinationPiano 25 { \time 3/8 } "Melody + a "
    { \key e \major }
    \voices 6, 1 <<
      \clef bass
      \set Timing.beamExceptions = #'()
      \set Timing.baseMoment = #(ly:make-moment 1/8)
      \set Timing.beatStructure = #'(1 1 1)
      {
        \tuplet 5/4 8 {
          fis32 \repeat unfold 2 { gis b }
          e \repeat unfold 2 { gis b }
          dis \repeat unfold 2 { gis b }
        }
      } \\
      { <fis fis'>8 <e e'> <dis dis'> }
    >>
    { s4. }
    \scoreLayout
  }
}


combinationThreea = \markup {
  \score {
    \combinationPiano 5 { \time 3/8 \set PianoStaff.connectArpeggios = ##t } "Melody + a + a' "
    { \key bes \minor }
    \voices 6, 1 <<
      \set Timing.beamExceptions = #'()
      \set Timing.baseMoment = #(ly:make-moment 1/8)
      \set Timing.beatStructure = #'(1 1 1)
      {
        f'64\arpeggio des''
        \repeat unfold 3 { f' des'' }
        f'\arpeggio c''
        \repeat unfold 3 { f' c'' }
        f'\arpeggio bes'
        \repeat unfold 3 { f' bes' }
      } \\
      { des'''8\arpeggio c'''\arpeggio bes''\arpeggio }
    >>
    \new Voice = "6" {
      \voiceOne
      <f des'>64\arpeggio f
      \repeat unfold 3 { des' f }
      <ees c'>\arpeggio ees
      \repeat unfold 3 { c' ees }
      <des bes>\arpeggio des
      \repeat unfold 3 { bes des }
    }
    \scoreLayout
  }
}


combinationThreeb = \markup {
  \score {
    \combinationPiano 6 { \time 3/8 } "a1 + a1' + Bass "
    { \key bes \minor }
    \new Voice = "6" {
      \set subdivideBeams = ##t
      \tuplet 6/4 8 \repeat unfold 9 { <ges' bes'>32 ees'' }
    }
    \voices 6, 2 <<
      {
        \voiceOne
        \tuplet 6/4 8 \repeat unfold 3 { r ees' \repeat unfold 2 { <ges bes> ees' }}
      } \\
      { \autoBeamOff a,8 bes, ges, }
    >>
    \scoreLayout
  }
}


combinationThreec = \markup {
  \score {
    \combinationPiano 10 { \time 2/8 } "Melody + a'' + Bass "
    { \key bes \minor }
    \voices 6, 1<<
      {
        \set subdivideBeams = ##t
        \set Timing.beamExceptions = #'()
        \set Timing.baseMoment = #(ly:make-moment 1/8)
        \set Timing.beatStructure = #'(2)
        \tuplet 6/4 8 { r16 \repeat unfold 5 { \l <aes des'>32 \u <f' aes'> }}
      } \\
      { <f'' f'''>4 }
    >>
    \new Voice = "2" { \voiceTwo des,8 s }
    \scoreLayout
  }
}


combinationThreed = \markup {
  \score {
    \combinationPiano 25 { \time 2/8 } "Melody + a1'' + Bass "
    { \key e \major }
    \voices 6, 1 <<
      {
        \override Beam.auto-knee-gap = #1
        \tuplet 6/4 8 {
          r16 \repeat unfold 2 { \l <gis b e'>32 \u <gis' b' e''> }
          r16 \repeat unfold 2 { \l <b e' gis'>32 \u <b' e''> }
        }
      } \\
      { \autoBeamOff <b'' b'''>8 <gis'' gis'''> }
    >>
    \new Voice = "2" { \voiceTwo \autoBeamOff <b,, b,>8 <gis, gis> }
    \scoreLayout
  }
}


combinationFoura = \markup {
  \score {
    \combinationPiano 22 { \time 3/8 } "Melody + a1 + a1' + Bass "
    { \key e \major }
    \voices 6, 1 <<
      {
        \tuplet 6/4 8 { \repeat unfold 3 {
          r32 b'
          \repeat unfold 2 { <dis'' fis''> b' }
        }}
      } \\
      { \autoBeamOff fis''' dis''' b'' }
    >>
    \voices 6, 2 <<
      {
        \voiceOne
        \set subdivideBeams = ##t
        \tuplet 6/4 8 {
          r32 fis'
          \repeat unfold 8 { <a dis'> fis' }
        }
      } \\
      { a,4. }
    >>
    \scoreLayout
  }
}


combinationFourb = \markup {
  \score {
    \combinationPiano 9 { \time 3/8 } "Melody + a2 + b1 "
    {
      \key bes \minor
      \set Timing.beamExceptions = #'()
      \set Timing.baseMoment = #(ly:make-moment 1/8)
    }
    \voices 6, 1 <<
      {
        \tuplet 6/4 8 {
          \repeat unfold 3 { bes'32 <ees'' ges''> }
          \repeat unfold 3 { g'! <ees'' ges''!> }
          \repeat unfold 3 { aes' <c'' ees''> }
        }
      } \\
      { <bes' bes''>8 <g' g''> <aes' aes''> }
    >>
    \voices 5, 2 <<
      {
        r16 <ges ees' ges'>
        r16 <ges ees' ges'>
        r <ges c' ees'>
      } \\
      { c,8 ees, aes, }
    >>
    \scoreLayout
  }
}


combinationFourc = \markup {
  \score {
    \combinationPiano 29 { \time 3/8 } "Melody + a "
    {
      \key e \major
      \set Timing.beamExceptions = #'()
      \set Timing.baseMoment = #(ly:make-moment 1/8)
    }
    \voices 6, 1 <<
      {
        \tuplet 6/4 { \repeat unfold 3 { cis''32 e'' }}
        \tuplet 5/4 8 {
          c'' \repeat unfold 2 { e'' a'' }
          b' \repeat unfold 2 { cis'' e'' }
        }
      } \\
      { r8 <c'' c'''> <b' b''> }
    >>
    \voices 6, 3 <<
      {
        \tuplet 5/4 8 {
          e,32 \repeat unfold 2 { a, cis }
          a, \repeat unfold 2 { cis e }
        }
        \tuplet 6/4 { \repeat unfold 3 { cis e }}
      } \\
      { <e, e>8 <a, a>4 }
    >>
    \scoreLayout
  }
}


combinationFourd = \markup {
  \score {
    \combinationPiano 34 { \time 3/8 } "Melody + a2 "
    {
      \key bes \minor
      \set Timing.beamExceptions = #'()
      \set Timing.baseMoment = #(ly:make-moment 1/8)
    }
    \voices 6, 1 <<
      {
        \repeat unfold 2 { bes'32 <des'' f''> }
        \repeat unfold 2 { c'' <ees'' aes''> }
        \repeat unfold 2 { des'' <f'' bes''> }
      } \\
      { <bes' bes''>8 <c'' c'''> <des'' des'''> }
    >>
    \voices 6, 3 <<
      {
        des32 <f bes> des' <f bes>
        c <f aes> c' <f aes>
        bes, <des f> bes <des f>
      } \\
      { <des des'>8 <c c'> <bes, bes> }
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
    \large \bold "A. Tremolo"
    \vspace #1
    \motifa
    \vspace #2
    \bold "Two-Handed Tremolo"
    \vspace #1
    \motifaTwoHanded
    \vspace #3
    \large \bold "B. Stride"
    \vspace #1
    \motifb
  }
}


\book {
  \bookOutputSuffix "2_part_combinations"
  \header {
    piece = \markup { \bold \large "2-part Combinations" }
  }
  \markup \left-column {
    \combinationTwoa
    \vspace #1
    \combinationTwob
    \vspace #0.5
    "Use arpeggio to extend range."
    \vspace #1
    \combinationTwoc
    \vspace #0.5
    "Tuplets with optional doublings is also possible."
  }
}


\book {
  \bookOutputSuffix "3_part_combinations"
  \header {
    piece = \markup { \bold \large "3-part Combinations" }
  }
  \markup \left-column {
    \combinationThreea
    \vspace #0.5
    "1. LH and RH top note doubles melody."
    "2. Inverted tremolo on the other hand with thirds as main interval in between."
    \vspace #1
    \combinationThreeb
    \vspace #0.5
    "1. Omit first note of tremolo to extend reach."
    "2. Middle voices double in octave."
    \vspace #1
    \line {
      \column {
        \combinationThreec
        \vspace #0.8
        "Use two-handed tremolo for louder passages."
      }
      \hspace #10
      \column {
        \combinationThreed
        \vspace #0.5
        "Thicken voicing for climax."
      }
    }
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
    "Layer tremolos for wider but not necessarily louder passages."
    \vspace #1
    \combinationFourb
    \vspace #0.5
    "Combinable with other articulations."
    \vspace #1
    \combinationFourc
    \vspace #0.5
    "Layer tremolo in different tuplets for a more complex texture."
    \vspace #1
    \combinationFourd
    \vspace #0.5
    "Tremolo can also alternate between bass and octave with chord tones in between."
  }
}


\book {
  \trimmedPaper
  \header {}
  \bookpart { \combinationTwoa }
  \bookpart { \combinationTwob }
  \bookpart { \combinationTwoc }
  \bookpart { \combinationThreea }
  \bookpart { \combinationThreeb }
  \bookpart { \combinationThreec }
  \bookpart { \combinationFoura }
  \bookpart { \combinationFourb }
  \bookpart { \combinationFourc }
  \bookpart { \combinationFourd }
}
