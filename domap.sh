#!/bin/bash


cd mymapproxy
mapproxy-util serve-develop -b 0.0.0.0:$P mapproxy.yaml
