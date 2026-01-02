# Thesis Template

A Typst-based thesis template for undergraduate/graduate research papers.

## 📁 Project Structure

```
thesis_template/
├── main.typ                    # Entry point - compile this file
├── template.typ                # Document styling and formatting
├── references.bib              # Bibliography in BibTeX format
├── chapters/
│   ├── 00-front-matter/        # Title page, abstract, TOC, etc.
│   │   ├── title-page.typ
│   │   ├── approval-sheet.typ
│   │   ├── acknowledgement.typ
│   │   ├── dedication.typ
│   │   ├── abstract.typ
│   │   ├── table-of-contents.typ
│   │   ├── list-of-figures.typ
│   │   └── list-of-tables.typ
│   ├── 01-introduction/
│   │   ├── _index.typ
│   │   ├── background.typ
│   │   ├── statement-of-problem.typ
│   │   ├── objectives.typ
│   │   ├── significance.typ
│   │   └── scope-limitations.typ
│   ├── 02-literature-review/
│   │   ├── _index.typ
│   │   ├── related-studies.typ
│   │   └── research-gap.typ
│   ├── 03-methodology/
│   │   ├── _index.typ
│   │   ├── research-design.typ
│   │   ├── conceptual-framework.typ
│   │   ├── system-architecture.typ
│   │   ├── data-collection.typ
│   │   ├── implementation.typ
│   │   └── evaluation.typ
│   ├── 04-results-discussion/
│   │   ├── _index.typ
│   │   ├── implementation-results.typ
│   │   └── discussion.typ
│   └── 05-conclusion/
│       └── _index.typ
├── appendices/
│   ├── _index.typ
│   ├── appendix-a.typ
│   └── appendix-b.typ
└── figures/
    ├── mermaid/                # Mermaid source files (.mmd)
    ├── rendered/               # Rendered diagrams (.png)
    └── screenshots/            # System screenshots
```

## 🚀 Quick Start

1. **Install Typst**: Download from [typst.app](https://typst.app) or use:
   ```bash
   winget install --id Typst.Typst
   ```

2. **Update Metadata**: Edit `main.typ` with your thesis information:
   ```typst
   #show: thesis.with(
     title: [Your Thesis Title],
     author: "Your Name",
     ...
   )
   ```

3. **Add Content**: Fill in the placeholder files in `chapters/`

4. **Add Figures**: Place images in `figures/` folder

5. **Add References**: Update `references.bib` with your citations

6. **Compile**:
   ```bash
   typst compile main.typ
   ```

## 📝 Usage Tips

### Citations
Use `@key` syntax to cite references:
```typst
According to @smith2024, machine learning...
```

### Figures
```typst
#figure(
  image("figures/diagram.png", width: 80%),
  caption: [Figure caption here],
)<fig-label>
```

### Tables
```typst
#figure(
  table(
    columns: (1fr, 1fr),
    [Column 1], [Column 2],
    [Data], [Data],
  ),
  caption: [Table caption here],
)<tbl-label>
```

### Mermaid Diagrams
1. Create `.mmd` file in `figures/mermaid/`
2. Render to PNG using mermaid.ink or mermaid-cli
3. Reference in Typst: `image("figures/rendered/diagram.png")`

## 📋 Checklist

- [ ] Title page filled
- [ ] Approval sheet updated
- [ ] Acknowledgement written
- [ ] Abstract completed
- [ ] All chapters filled
- [ ] References added
- [ ] Figures included
- [ ] Table of contents updated
- [ ] List of figures/tables updated
- [ ] Appendices added
- [ ] Final review completed

## 📖 Resources

- [Typst Documentation](https://typst.app/docs)
- [Typst Universe (Packages)](https://typst.app/universe)
- [Mermaid Diagrams](https://mermaid.js.org)
