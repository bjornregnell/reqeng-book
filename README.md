# reqeng-book
Introduction to Software Requirements Engineering

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