#!/bin/bash
raspivid -md 6 -t 0 -w 640 -h 480 -awbg 1.0,1.0 -awb off -ex off -o - |\
ffmpeg -re -i - -c:v h264 -f h264 -an -r 30 -preset superfast -tune zerolatency - |\
cvlc -vvv stream:///dev/stdin --sout '#rtp{dst=localhost,sdp=sap,name="TestStream"}' :demux=h264