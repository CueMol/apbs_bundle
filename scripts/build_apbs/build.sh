#!/bin/bash

set -eux

BASEDIR=$HOME/tmp/build_apbs
SRCDIR=$BASEDIR/apbs
BUILDDIR=$BASEDIR//build
INSTALL_DIR=$BASEDIR/target

# v1.5.0
cmake -S $SRCDIR -B $BUILDDIR \
      -DCMAKE_INSTALL_PREFIX=$INSTALL_DIR \
      -DCMAKE_BUILD_TYPE=Release \
      -DAPBS_STATIC_BUILD=ON \
      -DBUILD_DOC=OFF \
      -DBUILD_TOOLS=ON \
      -DENABLE_TESTS=OFF \

(cd $BUILDDIR && make -j 8 && make install)
# cmake --build $BUILDDIR -j 8
# cmake --install $BUILDDIR -DBUILD_TOOLS=OFF

# v3.4.0
# cmake -S $SRCDIR -B $BUILDDIR \
#       -DCMAKE_C_FLAGS="-Wno-error=implicit-int -Wno-error=incompatible-function-pointer-types" \
#       -DCMAKE_BUILD_TYPE=Release \
#       -DAPBS_STATIC_BUILD=ON \
#       -DBUILD_DOC=OFF \
#       -DBUILD_TOOLS=OFF \
#       -DENABLE_TESTS=OFF \
#       -DSUITESPARSE_INCLUDE_DIR_HINTS=$HOME/tmp/build_apbs/include \
#       -DSUITESPARSE_LIBRARY_DIR_HINTS=$HOME/tmp/build_apbs/lib \


#     -DUMFPACK_INCLUDES=$HOME/tmp/build_apbs/include \
#      -DUMFPACK_LIBRARIES=$HOME/tmp/build_apbs/lib

# SparseSuite build
# cmake .. "-DSUITESPARSE_ENABLE_PROJECTS=umfpack;spqr" -DCMAKE_INSTALL_PREFIX=$HOME/tmp/build_apbs/ -DBUILD_SHARED_LIBS=OFF -DBUILD_STATIC_LIBS=ON |& less
