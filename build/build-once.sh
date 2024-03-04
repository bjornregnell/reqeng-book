echo "-- scala-cli run src"
scala-cli run src
echo "-- generate pdf in ../tex/main"
pushd tex/main && latexmk -silent -pdf -cd book.tex
popd