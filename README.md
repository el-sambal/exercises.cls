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

---

***WITH SOLUTIONS***, it looks like this:

---
![output-1](https://github.com/user-attachments/assets/f76b33b8-e997-431b-9bcd-ed1ef4b03f3b)

---

![output-2](https://github.com/user-attachments/assets/c73245e7-ed69-4c52-8668-2a3b9eae5282)

---

![output-3](https://github.com/user-attachments/assets/bcc25b15-813e-4e09-8b9d-3c5c95b4921e)

---

![output-4](https://github.com/user-attachments/assets/0ba99872-7988-4042-b67c-c627cdccb182)

---

***WITHOUT SOLUTIONS***, it looks like this:

---

![output-1](https://github.com/user-attachments/assets/25f336b4-40b0-4985-89a4-dd3c011c1a94)

---

![output-2](https://github.com/user-attachments/assets/3058ce42-8dd2-4b72-af87-43e86f5350be)


