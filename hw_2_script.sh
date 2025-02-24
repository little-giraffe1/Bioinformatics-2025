 #!/bin/bash

for file_name in *.tsv;
do
    dir="${file_name%.tsv}"
    mkdir -p "$dir"
    mv "$file_name" "$dir/"
done
