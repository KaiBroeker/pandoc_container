# pandoc_container
A container image to convert markdown to pdf
I use it to automatic generate end user docs for my projects

## How to use
One example to use the container

```
mkdir ./pdfs

for i in `find -iname "*.md"`
do
  echo "$i"
  DIR=`dirname "${i}"`
  FILE=`basename "${i}"`
  finaldir="`pwd`${DIR/./}/"
  finalfile="${FILE/.md/}.pdf"
  docker run --rm -t -v ${finaldir}:/mount/:Z mdtopdf:latest pandoc $FILE -s -o ${finalfile} --template eisvogel --listings
  ls ${finaldir}${finalfile}
  mkdir -p pdfs${DIR/\./}
  mv ${finaldir}${finalfile} ./pdfs${DIR/\./}
  echo "--------------------------------------"
done
```
