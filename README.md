# exercises.cls

This repository contains the file `exercises.cls`, a $\LaTeX$ class based on the `exam` class. It can be used to write course worksheets or homework assignments (or exams, perhaps). Some other files are also present in the repository, to form a working example.

The main difference between this class and the `exam` class is that this class has some basic customizations which I happen to like.

In particular, some customizations done by this class are:
- The `solution` environment is redefined as a `tcolorbox` with some custom style features (for example, the box breaks nicely over multiple pages and there is a visual indicator in case this happens).
- This class by default has a header at the top of each page.
- The university logo is in the top-left of the page.

Note that solutions will not be printed, unless the `answers` option is passed to the class, as follows:
```tex
\documentclass[answers]{exercises}
```

---

Note to RUG staff: the RUG logo can be found [HERE](https://www.rug.nl/about-ug/practical-matters/huisstijl/logobank-new/corporatelogo/). One can obtain a pdf version of this logo by downloading e.g. the *horizontal logo, English version, RGB-EPS format*, and then using a tool like `epstopdf` to convert the `.eps` file into a pdf. One can then replace the placeholder logo in this repository by the generated pdf. The benefit of going through this (somewhat lengthy) procedure is that one obtains a logo that is infinitely zoomable, because `eps` is a vector image format. Note that I do not own the RUG logo, and any use of it is subject to rules and regulations posed by the University of Groningen.

---

### Note on page breaking

Most users do not want to have page breaks in the middle of (short) questions, but sometimes $\LaTeX$ does this anyway. To prevent this issue, here are some tips (which are useful in general):
 - You can insert `\filbreak`s before `\question`s that you don't want broken up (usually, the shorter questions).
 - You can define a custom negative page break penalty to encourage $\LaTeX$ to break at a certain point, e.g. `\penalty-325 \question Question...`.
 - If you want to automatically insert `\filbreak`s before *all* questions, put the following code all the way at the bottom of `exercises.sty`. When the questions are longer, this approach can create much whitespace, so this 'automatic' approach is not always optimal.
```tex
% puts a \filbreak before each \question
\let\beginoldquestions\questions
\let\endoldquestions\endquestions
\renewenvironment{questions}{%
	\beginoldquestions%
    \let\oldquestion\question%
    \def\question{\filbreak\oldquestion}%
}{%
	\endoldquestions%
}
```

---

### Showcase

***WITH SOLUTIONS***, the example document in this repository looks like this (click [HERE](https://el-sambal.github.io/exercises.cls/with-answers.pdf) for an actual pdf):

---

![with-answers-1](https://github.com/user-attachments/assets/5f6ba236-86e5-4415-ade8-3e9411deb4ed)

---

![with-answers-2](https://github.com/user-attachments/assets/20deb28c-9b5e-49ef-bb5d-be8c06cb5b69)

---

![with-answers-3](https://github.com/user-attachments/assets/98273ac8-fbfc-4bf0-9164-4001db7c5641)

---

![with-answers-4](https://github.com/user-attachments/assets/bc576779-fe71-4d6e-8f29-2691c67b897a)

---

---

***WITHOUT SOLUTIONS***, it looks like this (click [HERE](https://el-sambal.github.io/exercises.cls/without-answers.pdf) for an actual pdf):

---

![without-answers-1](https://github.com/user-attachments/assets/00c90af8-da87-417b-9a08-8e2ebcdac75c)

---

![without-answers-2](https://github.com/user-attachments/assets/c525c5de-9f33-4b72-ae8b-af88873d4d6b)



