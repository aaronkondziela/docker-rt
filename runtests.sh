#!/bin/bash
export RT_DBA_USER=root
export RT_DBA_PASSWORD=thisisatest
pushd /opt/rt-src/rt
make test
popd
