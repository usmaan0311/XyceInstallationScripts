#!/bin/bash

LIBDIR=/opt/xyce/xyce_lib
INSTALLDIR=/opt/xyce/xyce_parallel

./configure CXXFLAGS="-O3 -std=c++11" ARCHDIR=$LIBDIR CPPFLAGS="-I/usr/include/suitesparse" --enable-mpi CXX=mpicxx CC=mpicc F77=mpif77 --prefix=$INSTALLDIR
make
sudo make install
