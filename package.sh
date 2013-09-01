#! /bin/bash

filename="erpxe-nightly.tar.gz";
echo "packaging branch to $filename.";
git archive --format=tar HEAD | gzip > $filename;
echo "package $filename created successfully.";
