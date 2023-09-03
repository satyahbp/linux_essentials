#!/bin/sh
# installing python after downloading it from python.org
# make sure the build essentials are installed before running this file

# 1. Extract the downloaded python tar file
# 2. Go to the extracted folder and run this sh file
./configure
make
# make test # this step is optional
make install # add sudo if you are running these commands independently

# reload the terminal and type the following command to see the latest changes:
python3 --version

# upgrade pip to latest version:
python3 -m pip install --upgrade pip
