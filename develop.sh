#!/usr/bin/env bash
mkdir /tmp/dagor-engine
nix-shell --run 'TMPDIR=/tmp/dagor-engine code .'
