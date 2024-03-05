echo "-- generate tex sources"
scala-cli run src

echo "-- generate pdf"
pushd book && latexmk -silent -pdf -cd reqeng-book.tex
popd