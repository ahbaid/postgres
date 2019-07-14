#!/bin/bash
# Fix missing dependency on libreadline.s0.6
# Seen in 18.04.2
cd /lib/x86_64-linux-gnu/
ln -s libreadline.so.7 libreadline.so.6
ln -s libreadline.so.7.0 libreadline.so.6.0
