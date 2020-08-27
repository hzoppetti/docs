#!/bin/bash

wget https://github.com/errata-ai/vale/releases/download/v1.2.6/vale_1.2.6_Linux_64-bit.tar.gz
mkdir vale
tar -xvzf vale_1.2.6_Linux_64-bit.tar.gz -C vale
d=git diff --name-only develop
./vale/vale --glob=$d'.{md}' docs
