scala-cli clean src
pushd book
latexmk -c book.tex
popd