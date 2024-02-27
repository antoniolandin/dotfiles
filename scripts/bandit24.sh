#!/bin/bash

BANDIT24_PASS=$(cat /etc/bandit_pass/bandit24)

for i in $(seq 0 9999); do
    printf "%b %04d" $BANDIT24_PASS $i
done

