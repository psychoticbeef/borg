#!/bin/bash
while ! grep -q wlp3s0 /proc/net/route ; do
        sleep 1
done

