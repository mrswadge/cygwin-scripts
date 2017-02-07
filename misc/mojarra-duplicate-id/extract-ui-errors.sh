#!/bin/bash

mkdir extract-ui-errors
rm -rf extract-ui-errors/*
awk 'NR == 1 {writing=0; count=1}/^SEVERE: JSF1007: Duplicate component ID/{flag=1} writing || flag {print > "errors#"(count)".txt"; writing=1}/^<\/html>/{flag=0; writing=0; count+=1}flag' $@ > nul
