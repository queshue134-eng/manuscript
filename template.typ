// =============================================================================
// THESIS TEMPLATE - template.typ
// Defines document styling, page layout, and formatting rules
// =============================================================================

#let thesis(
  title: none,
  author: none,
  date: none,
  institution: none,
  department: none,
  degree: none,
  adviser: none,
  co_adviser: none,
  body,
) = {
  // Document metadata
  set document(
    title: title,
    author: author,
    date: auto,
  )

  // Page settings (A4, 1-inch margins, 1.5-inch left margin)
  set page(
    paper: "a4",
    margin: (top: 1in, bottom: 1in, left: 1.5in, right: 1in),
    numbering: "1",
    header: context {
      if counter(page).get().first() > 1 {
        align(right, text(size: 10pt, style: "italic")[#title])
      }
    },
  )

  // Text settings (Times New Roman, 12pt, double-spaced)
  set text(
    font: "Times New Roman",
    size: 12pt,
    lang: "en",
  )

  // Paragraph settings
  set par(
    justify: true,
    leading: 1.5em,
    first-line-indent: 0.5in,
  )

  // Link styling for interactive PDF
  show link: set text(fill: rgb("#0000EE"))

  // Citation references (bibliography) - blue
  // Table/Figure references - black (still clickable)
  show ref: it => {
    let el = it.element
    if el != none and el.func() == figure {
      // Table/Figure references: black text
      text(fill: black, it)
    } else if el != none and el.func() == heading {
      // Section references: black text
      text(fill: black, it)
    } else {
      // Citations and other references: blue
      text(fill: rgb("#0000EE"), it)
    }
  }

  // Heading styles
  set heading(numbering: none)

  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    v(0.4in)
    align(center, text(weight: "bold", size: 14pt, upper(it.body)))
    v(0.2in)
  }

  // Prevent headings from being orphaned at bottom of page
  // Using block with enough height to force page break if near bottom
  show heading.where(level: 2): it => {
    v(0.3in)
    block(breakable: false, below: 2em)[
      #text(weight: "bold", size: 12pt, it.body)
    ]
  }

  show heading.where(level: 3): it => {
    block(breakable: false, below: 1.5em)[
      #v(0.12in)
      #text(weight: "bold", size: 12pt, style: "italic", it.body)
    ]
  }

  show heading.where(level: 4): it => {
    block(breakable: false, below: 1em)[
      #v(0.1in)
      #text(weight: "bold", size: 12pt, it.body)
    ]
  }

  // Figure styling
  show figure.caption: set text(size: 10pt)

  // Keep figures and tables together with their captions
  show figure: set block(breakable: false)

  // Table styling
  set table(
    stroke: 0.5pt + black,
    inset: 6pt,
  )

  body
}

// Helper function for appendix sections
#let appendix(title, body) = {
  pagebreak()
  heading(level: 2, title)
  body
}
