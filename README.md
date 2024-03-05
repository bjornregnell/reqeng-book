# reqeng-book

* This repo hosts ongoing work on an open source textbook to support teaching & learning of [Requirements Engineering](https://en.wikipedia.org/wiki/Requirements_engineering) (RE), a sub-discipline of [Software Engineering](https://en.wikipedia.org/wiki/Software_engineering). 

* The intended readers include engineering **students** at undergraduate and graduate level, as well as **practitioners** in software industry. It is also intended as a goto-resource for **teachers** of RE.

* The book is maintained by [Prof. Bjorn Regnell](https://cs.lth.se/bjorn-regnell/) who is the main author and editor of invited contributions. The copyright of each contribution stays with the contributor under the license of this repo. If you make a contribution you implicitly transfer the right to the maintainer to make *any* edits to your contribution and publishing any edits under the the license of this repo.

* The licence is [CC-BY-SA](https://creativecommons.org/licenses/by-sa/4.0/deed.en), which means that you are free to share and adapt as long as you **give appropriate credit**, provide a **link** to the license, and **indicate if changes were made**. If you remix, transform, or build upon the material, you must distribute your contributions under the **same license** as the original.


## Contributions are welcome!

The plan is to invite reviewers/authors of special topics, e.g. based on interesting academic publications. If you are interested in contributing as a reviewer or author please contact bjorn.regnell@cs.lth.se or open an [issue in this repo](https://github.com/bjornregnell/reqeng-book/issues) to start a discussion on your ideas on how this book can be improved.


## How to build 

You need this to build locally:
* A full installation of [texlive](https://tug.org/texlive/) with `latexmk` on your path. 
On Ubuntu, install with this command (and take a fika break until it is ready):
  ```
  sudo apt install texlive-full hunspell hunspell-sv
  ```

* [scala-cli](https://scala-cli.virtuslab.org/install/) to generate .tex-files from a simplified and limited version of markdown, based on a Scala-program in the [`src`](https://github.com/bjornregnell/reqeng-book/tree/main/src) dir.

* It is not strictly necessary, but it helps if you have [git](https://git-scm.com/download/win) and a `bash` terminal. For MS Windows users it is recommended to use [WSL with Ubuntu](https://learn.microsoft.com/en-us/windows/wsl/install), but you can also try [MingGW/MSYS2](https://en.wikipedia.org/wiki/Mingw-w64) that is included when you make a full installation of [git](https://git-scm.com/download/win).

* [VS Code](https://code.visualstudio.com/) with the [Metals](https://scalameta.org/metals/docs/editors/vscode/#installation) extension is recommended if you want to edit any `.tex` `.md` or `.scala` file.

There are several scripts (see files ending with `.sh`) to build the book and lecture slides, adapted for different use cases explained below. You can look inside the the scripts to see what specific commands are used or you can just run them if you have bash:

* Generate everything from source: 
  `./build/build-once`

* Generate everything from source and run again if source files changes:
  `./build/build-watch`

* Clean all generated files if you then want to build from scratch:
  `.build/clean.sh`

**TODO:** remove dependency on bash and use `scala-cli` and `.sc` scripts instead.