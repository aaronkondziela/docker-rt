#!/usr/bin/env bash
apache2ctl stop
pushd /opt/rt-src/rt
make install
popd
apache2ctl start
