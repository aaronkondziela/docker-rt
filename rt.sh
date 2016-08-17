#!/bin/bash
./configure
make testdeps
make install
make initialize-database

