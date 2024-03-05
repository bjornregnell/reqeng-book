echo "-- scala-cli run src"
scala-cli run src
echo "-- generate pdf in book/"
pushd book && latexmk -silent -pdf -cd book.tex
popd