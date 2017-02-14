#!/bin/bash
/opt/comchap/comcut --ffmpeg=/usr/bin/ffmpeg --comskip=/opt/comskip/comskip --lockfile=/tmp/comchap.lock --comskip-ini=/opt/post-process/comskip.ini "$1"
