#!/bin/bash

docker build -t  my_tuner:latest .

docker run --rm -ti my_tuner:latest --host host.name --user root --pass rootpass --forcemem 32000
