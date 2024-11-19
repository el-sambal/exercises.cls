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

***WITH SOLUTIONS***, it looks like this (click [HERE](https://el-sambal.github.io/exercises.cls/with-answers.pdf) for an actual pdf):

---

![with-answers-1](https://github.com/user-attachments/assets/f1d7d510-1963-4512-b491-41568f0eaa18)

---

![with-answers-2](https://github.com/user-attachments/assets/dc76f08b-d40c-4c68-853d-d5604a653722)

---

![with-answers-3](https://github.com/user-attachments/assets/9019e0f9-fdc8-4750-ae31-5979a50ee479)

---

![with-answers-4](https://github.com/user-attachments/assets/40cd7b87-91a9-424f-ba48-467eaf4d21af)

---

---

***WITHOUT SOLUTIONS***, it looks like this (click [HERE](https://el-sambal.github.io/exercises.cls/without-answers.pdf) for an actual pdf):

---

![without-answers-1](https://github.com/user-attachments/assets/f14a284c-f4cc-40d9-9a5a-9b7fc1cd5de2)

---

![without-answers-2](https://github.com/user-attachments/assets/489ad630-6369-482b-b990-3ffa7fbe1963)



