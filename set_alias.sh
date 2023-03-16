#!/bin/bash

# This will need to go into you .bashrc or .zshrc file. You will also need to
# change the version and name of the image you built from the dockerfile
alias valgrind='docker run -it --rm -v $PWD:/code valgrind:1.0'
