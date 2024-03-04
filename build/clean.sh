scala-cli clean src
pushd tex/main
latexmk -c book.tex
popd