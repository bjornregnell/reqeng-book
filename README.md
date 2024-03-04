# reqeng-book

* This repo includes ongoing work on an open source textbook in support for teaching & learning Requirements Engineering (RE) of software.intensive systemes. 

* The intended readers include engineering students at undergraduate and graduate level as well as practitioners in software industry, as well as teachers at university level.

* The book is maintained by [Prof. Bjorn Regnell](https://cs.lth.se/bjorn-regnell/) who is the main author and editor of invited contributions. The copyright of each contributions stays with the contributor under the license of this repo. If you make a contribution you implicitly transfer the right to the maintainer to make any edits to your contribution and publishing any edits under the the license of this repo.  

* The licence is [CC-BY-SA](https://creativecommons.org/licenses/by-sa/4.0/deed.en), which means that you are free to share and adapt as long as you **give appropriate credit**, provide a **link** to the license, and **indicate if changes were made**. If you remix, transform, or build upon the material, you must distribute your contributions under the **same license** as the original.

## Contributions are welcome!

I plan to invite reviewers/authors of special topics based on interesting academic papers. If you are interested in contributing as a reviewer or author please contact me at bjorn.regnell@cs.lth.se or open an [issue in this repo](https://github.com/bjornregnell/reqeng-book/issues) to start a discussion on your ideas on how this book can be improved.

### Candidate papers to include

The following papers are candidates for referencing, summarizing or inviting a popular science version:

- [ ] "Identifying relevant Factors of Requirements Quality: an industrial Case Study" by Julian Frattini published at REFSQ'2024  https://arxiv.org/pdf/2402.00594.pdf



# how to build 

There are bash scripts to do this for different use cases:

* Generate all latex files from `slides` using `scala-cli` and build pdf from `tex/main` using `latexmk`:

  `./build-watch`

  This is useful when you are editing the source files and want to re-build on every save.

* Build pdf from `slides` and `tex/main` using `scala-cli` and then `latexmk`: 
  `./build-once`

* Clean all generated files:

  `./clean.sh`

  Useful if you then want to `build-once` from scratch.