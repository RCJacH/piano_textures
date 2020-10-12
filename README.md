# PIANO TEXTURES

## WHAT IS THIS

This repo is a collection of piano accompaniment textures found in classical or other genres of music, designed to be a pool of inspiration to ~steal~ learn from, written in [Lilypond](http://lilypond.org/) language.

## WHAT IS IT GOOD FOR

There are really very little textures that are involved in the pop, rock, or even jazz context in terms of piano playing.
Most of the materials involves either block chords, arpeggios, chorale lines, rhythms, or chords + melody with occasional doublings.
Thus incorporating other textures from time to time can be helpful to sustain interest.

## HOW SHOULD I USE IT

The data is organized by genre, composer, opus - piece, then movement.
Within each folder, there are three type of files:

1. A .ly file which is the main project.
2. A header.ily file containing information about the piece.
3. Many image files which is the rendered result of the project, including *motives* and *combinations* of textures used in the movement.

### MOTIVES

Motives page lists a set of basic texture patterns used in the piece, transposed to a C major chord.

Example:

![Franz Liszt - Transcendante Études - 6. Vision - Motives](./data/classical/liszt/transcendental_etudes/6_vision/6_vision-motives.png?raw=true)

Each motif is given a short name with three parts:

1. Alphabet: The name of the super-category of the texture, in the case above is *Arpeggio*.
2. Number: The main variation of the texture in concept.
3. Apostrophes: The minor applied variation with the same concept. For example a1 is a 64th-note arpeggio with only C and G, and a1' differs by one note. Each variation may have different voicing, rhythm, or notes, but should share the core concept. For example a4 differs completely from a4' and a4'', but they are all based on the concept of arpeggio with multiple notes.

### COMBINATIONS

Combinations are how motives are combined in the actual music, usually with an extra melody and/or a bass layer.
However, since this is not music analysis, not all contents are covered, some combinations or even motives might be left out to simply and shorten the result.

![Franz Liszt - Transcendante Études - 12. Chasse Neige - 2 part Combinations](./data/classical/liszt/transcendental_etudes/12_chasse_neige/12_chasse_neige-2_part_combinations.png?raw=true)

Indicated in the upper-left corner, combinations are categorized by the number of voices within a measure, or part measures.
Each combination has its motivic elements listed in a box above the staff, with **"+"** representing motives happening simultaneously, and **"|"** representing otherwise.

Different voices are colored differently, with red being the melody, blue the bass, and others the accompaniment voices.

Two hand playing the identical motif or variations are considered as two voices:

![Melody and motif on right hand, variation of motif on left hand](./data/classical/liszt/transcendental_etudes/12_chasse_neige/12_chasse_neige-page4.png?raw=true)

However, them contributing to a single motif are considered as one voice.

![Melody on right hand, bass on left, with both hands splitting the middle voice](./data/classical/liszt/transcendental_etudes/12_chasse_neige/12_chasse_neige-page6.png?raw=true)

Sometimes, I may include some observations of things to consider as comments below the staff.
