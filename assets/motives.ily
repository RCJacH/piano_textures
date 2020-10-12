#(define (ly:append-property! m prop newEvent placeFirst? )
   (let (
          (front (if placeFirst? (list newEvent) (ly:music-property m prop)))
          (tail (if placeFirst? (ly:music-property m prop) (list newEvent)))
          )
   (set! (ly:music-property m prop)
         (append front tail))))

#(define (ly:append-articulation-to-event! m newEvent ifFirst?)
   (case (ly:music-property m 'name)
     ((NoteEvent) (ly:append-property! m 'articulations newEvent ifFirst?) m)
     ((EventChord) (ly:append-property! m 'elements newEvent ifFirst?) m)
     (else #f)))

#(define (group-notes group-name music)
   "Place music in an annotative group with HorizontalBracket, with group-name as text."
   (define (add-group event isLast?)
     "Add 'NoteGroupingEvent to selected event."
     (define (note-grouping-event isLast?)
       (make-music
          'NoteGroupingEvent
          'span-direction (if isLast? 1 -1)
          'tweaks (list
             (cons (cons 'HorizontalBracketText 'text) group-name)
             (cons (cons 'HorizontalBracket 'color) black)
             (cons (cons 'HorizontalBracketText 'color) black)
                   )))

     (map-some-music
       (lambda (mus)
         (ly:append-articulation-to-event! mus
           (note-grouping-event isLast?) #t))
        event))

   (define (get-inner-event muslist isLast?)
     "Retrive very first or very last note of the group."
     (let*(
            (elms (ly:music-property (if isLast? (last muslist) (first muslist)) 'elements))
            (event (car (if isLast? (reverse elms) elms)))
           )
     (if
      (eqv? (ly:music-property event 'name) 'SequentialMusic)
        (get-inner-event elms isLast?)
        event)))

   (let* (
        (muslist (list music))
        (first-event (get-inner-event muslist #f))
        (last-event (get-inner-event muslist #t))
      )
      (add-group first-event #f)
      (add-group last-event #t)
     music))

motif = #(define-music-function (parser layout group-name music) (string? ly:music?)
       (group-notes group-name music))


motifSingle =
#(define-music-function
  (setting mark label voice notes)
  (ly:music? string? string? string? ly:music?)
  #{<<
      \new Staff { \clipName #mark $setting \new Voice = $voice $notes }
      \new Dynamics { s1^$label }
    >>
  #})


motifPiano =
#(define-music-function
  (setting mark label voice top bottom)
  (ly:music? string? string? string? ly:music? ly:music?)
  #{<<
      \new PianoStaff {
        <<
          \new Staff = "top" { \clipName #mark $setting \new Voice = $voice $top }
          \new Staff = "bottom" { \clef bass  $bottom }
        >>
      }
      \new Dynamics { s1^$label }
    >>
  #})


motifMultiple =
#(define-music-function
  (setting mark label voices notes1 notes2)
  (ly:music? string? string? list ly:music? ly:music?)
  (let
   (
     (voice1 (number->string (car voices)))
     (voice2 (number->string (cdr voices)))
   )
  #{<<
      \new Staff {
        \clipName $mark
        $setting
        <<
          \new Voice = $voice1 { \voiceOne $notes1 }
          \new Voice = $voice2 { \voiceTwo $notes2 }
        >>
      }
      \new Dynamics { s1^$label }
    >>
  #}))
