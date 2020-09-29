\paper {
  indent = 0\mm
  line-width = 180\mm
  % offset the left padding, also add 1mm as lilypond creates cropped
  % images with a little space on the right
  line-width = #(- line-width (* mm 2.000000))
  tagline = ##f
  print-page-number = ##f
  bookTitleMarkup = \markup {
    \column {
      \fill-line {
        \fontsize #4 \bold \fromproperty #'header:title
      }
      \fill-line {
        \fontsize #1 \fromproperty #'header:subtitle
      }
      \vspace #1
      \fill-line {
        \fromproperty #'header:piece
        \column {
          \general-align #X #CENTER
          \fontsize #2 \bold \fromproperty #'header:composer
          \general-align #X #CENTER
          \fromproperty #'header:opus
        }
      }
      \vspace #1
    }
  }
  scoreTitleMarkup = \markup {}
}
