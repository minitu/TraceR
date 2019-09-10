#!/bin/sh

# https://www.topbug.net/blog/2012/03/17/generate-ctags-files-for-c-slash-c-plus-plus-source-files-and-all-of-their-included-header-files/
# ./ctags_with_dep.sh file1.c file2.c ... to generate a tags file for these files.

gcc -M -I$HOME/ROSS/install/include -I$HOME/codes/install/include \
        -I$SCOREP_DIR/include -DTRACER_OTF_TRACES=1 -I$HOME/TraceR/tracer "$@" | sed -e 's/[\\ ]/\n/g' | \
        sed -e '/^$/d' -e '/\.o:[ \t]*$/d' | \
        ctags -L - --c++-kinds=+p --fields=+iaS --extra=+q
