#! /bin/bash

filename="erpxe-nightly.tar.gz";
git archive --format=tar HEAD | gzip > $filename;
echo package $filename created.
