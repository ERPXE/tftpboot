find . -type f ! -name 'md5.txt' -print0 | xargs -0 md5sum > md5.txt
