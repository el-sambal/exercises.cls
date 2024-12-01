# exercises.cls

---

The latest pdfs of the example documents can be found here:
- [exam (with answers)](https://el-sambal.github.io/exercises.cls/exam-with-answers.pdf),
- [exam (without answers)](https://el-sambal.github.io/exercises.cls/exam-without-answers.pdf).
- [worksheet (with answers)](https://el-sambal.github.io/exercises.cls/worksheet-with-answers.pdf),
- [worksheet (without answers)](https://el-sambal.github.io/exercises.cls/worksheet-without-answers.pdf),

---

This repository contains the file `exercises.cls`, a $\LaTeX$ class based on the `exam` class. It can be used to write worksheets, homework assignments and exams. There are two working examples: `example-worksheet.tex` and `example-exam.tex`.

The main difference between this class and the `exam` class is that this class has some basic customizations which I happen to like.

In particular, some customizations done by this class are:
- The `solution` environment is redefined as a `tcolorbox` with some custom style features (for example, the box breaks nicely over multiple pages and there is a visual indicator in case this happens).
- This class by default has a header at the top of each page.
- The university logo is in the top-left of the page.
- Some prevention against over-ugly page breaks.

Note that solutions will not be printed, unless the `answers` option is passed to the class, as follows:
```tex
\documentclass[answers]{exercises}
```
Alternatively, the options `\printanswers` and `\noprintanswers` can be used.

---

Note to RUG staff: the RUG logo can be found [HERE](https://www.rug.nl/about-ug/practical-matters/huisstijl/logobank-new/corporatelogo/). One can obtain a pdf version of this logo by downloading e.g. the *horizontal logo, English version, RGB-EPS format*, and then using a tool like `epstopdf` to convert the `.eps` file into a pdf. One can then replace the placeholder logo in this repository by the generated pdf. The benefit of going through this (somewhat lengthy) procedure is that one obtains a logo that is infinitely zoomable, because `eps` is a vector image format. Note that I do not own the RUG logo, and any use of it is subject to rules and regulations posed by the University of Groningen.
