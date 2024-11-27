# exercises.cls

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

---

Note to RUG staff: the RUG logo can be found [HERE](https://www.rug.nl/about-ug/practical-matters/huisstijl/logobank-new/corporatelogo/). One can obtain a pdf version of this logo by downloading e.g. the *horizontal logo, English version, RGB-EPS format*, and then using a tool like `epstopdf` to convert the `.eps` file into a pdf. One can then replace the placeholder logo in this repository by the generated pdf. The benefit of going through this (somewhat lengthy) procedure is that one obtains a logo that is infinitely zoomable, because `eps` is a vector image format. Note that I do not own the RUG logo, and any use of it is subject to rules and regulations posed by the University of Groningen.

---

### Notes on page breaking

Most users do not want to have page breaks in the middle of (short) questions. This section lists some tricks to prevent this from happening. The `exercises` class by default applies the third trick.
 - You can insert `\filbreak`s before `\question`s that you don't want broken up (usually, the shorter questions).
 - You can define a custom negative page break penalty to encourage $\LaTeX$ to break at a certain point, e.g. `\penalty-325 \question Question...`.
 - If you want to automatically insert `\penalty`s (or `\filbreak`s) before *all* questions, the following code should be at the bottom of `exercises.sty` (it is there by default):
```tex
% puts a \penalty-325 before each \question
% penalty value can be modified
% it is also possible to use \filbreak instead of \penalty<num>
\let\beginoldquestions\questions
\let\endoldquestions\endquestions
\renewenvironment{questions}{%
	\beginoldquestions%
    \let\oldquestion\question%
    \def\question{\penalty-325\oldquestion}%
}{%
	\endoldquestions%
}
```
- Similarly, to automatically insert `\penalty`s (or `\filbreak`s) before all *solutions*, you could put this code at the bottom of `exercises.sty`:
```tex
% puts a \penalty-325 before each solution
\let\beginoldsolution\solution
\let\endoldsolution\endsolution
\renewenvironment{solution}{%
    \penalty-325\beginoldsolution%
}{%
	\endoldsolution%
}
```

---

### Showcase

***WITH SOLUTIONS***, the document generated from `example-worksheet.tex` looks like this (click [HERE](https://el-sambal.github.io/exercises.cls/with-answers.pdf) for an actual pdf):

---

![with-answers-1](https://github.com/user-attachments/assets/37adddcf-a7e8-452d-bb71-87174a992fdc)

---

![with-answers-2](https://github.com/user-attachments/assets/95305c91-7837-4865-b1a1-1b3dc852c0e1)

---

![with-answers-3](https://github.com/user-attachments/assets/f5cf3c98-6dd4-4ec4-8f1f-4ce8163e13c1)

---

![with-answers-4](https://github.com/user-attachments/assets/8e1c0bcf-8c5f-4c7a-9e0c-a1107ed23bbc)

---

---

***WITHOUT SOLUTIONS***, it looks like this (click [HERE](https://el-sambal.github.io/exercises.cls/without-answers.pdf) for an actual pdf):

---

![without-answers-1](https://github.com/user-attachments/assets/3fac0d9c-476a-4007-a365-15ea4982cb27)

---

![without-answers-2](https://github.com/user-attachments/assets/64b04384-b94e-4bb5-b2a4-c3d462558bbe)


