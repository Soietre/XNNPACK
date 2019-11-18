#!/bin/sh
# Copyright 2019 Google LLC
#
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree.

################################### ARM NEON ##################################
tools/xngen src/f32-sigmoid/neonfma-p5-nr2fma.c.in -D BATCH_TILE=16 -o src/f32-sigmoid/neonfma-p5-nr2fma-x16.c
tools/xngen src/f32-sigmoid/neon-frac-p9-p10-nr1recps.c.in -D BATCH_TILE=16 -o src/f32-sigmoid/neon-frac-p9-p10-nr1recps-x16.c

################################## Unit tests #################################
tools/generate-vunop-test.py --spec test/f32-sigmoid.yaml --output test/f32-sigmoid.cc