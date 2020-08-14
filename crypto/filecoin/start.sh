#!/bin/sh

lotus daemon
sleep 5
lotus net peers
lotus sync wait
