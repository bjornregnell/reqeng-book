scala-cli clean src
pushd book && latexmk -c reqeng-book.tex
popd