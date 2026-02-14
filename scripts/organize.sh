#!/bin/bash

echo "Start sorting in $(pwd)"
mkdir -p images documents scripts archives

count_images="0"
count_documents="0"
count_scripts="0"
count_archives="0"
count_other="0"

for file in *; do
if [[ -d "$file" ]] || [[ "$file" == "organize.sh" ]]; then
continue
fi

extension="${file##*.}"

case "$extension" in
jpg|jpeg|png|gif|bmp|svg)
mv "$file" images/
echo "$file -> images/"
((count_images++))
;;
txt|md|pdf|doc|docx|odt)
mv "$file" documents/
echo "$file -> documents/"
((count_documents++))
;;
sh|py|pl|rb)
mv "$file" scripts/
echo "$file -> scripts/"
((count_scripts++))
;;
tar|gz|bz2|rar|zip|7z)
mv "$file" archives/
echo "$file -> archives/"
((count_archives++))
;;
*)

mkdir -p other
mv "$file" other/
echo "$file -> other/"
((count_other++))
;;
esac
done

echo "Done!"
echo "Stats:"
echo "Images: $count_images"
echo "Documents: $count_documents"
echo "Archives: $count_archives"
echo "Scripts: $count_scripts"
echo "Other: $count_other"
