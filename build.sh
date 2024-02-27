echo "*** build.sh ***"
echo "    scala-cli run src"
scala-cli run src
echo "   latexmk"
pushd tex/main && latexmk -silent -pdf -cd book.tex
popd