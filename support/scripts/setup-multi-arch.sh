#!/bin/sh

echo "=== Setting up multi-arch building for Docker"

echo "=== Removing previous setup"
docker buildx rm multiarch 2>&1 > /dev/null
docker context rm -f node1.lab 2>&1 > /dev/null
docker context rm -f node2.lab 2>&1 > /dev/null
docker context rm -f node3.lab 2>&1 > /dev/null
sleep 3

echo "=== Creating docker context 'node1.lab' @ ssh://pi@node1.lab"
docker context create node1.lab --docker "host=ssh://pi@node1.lab" 2>&1 > /dev/null
echo "=== Creating docker context 'node2.lab' @ ssh://pi@node2.lab"
docker context create node2.lab --docker "host=ssh://pi@node2.lab" 2>&1 > /dev/null
echo "=== Creating docker context 'node3.lab' @ ssh://pi@node3.lab"
docker context create node3.lab --docker "host=ssh://pi@node3.lab" 2>&1 > /dev/null
sleep 5

echo "=== Create builder instance:"
echo "    Creating 'multiarch' with first context 'node1.lab'..."
docker buildx create --use --name multiarch node1.lab 2>&1 > /dev/null
echo "    Adding 'node2.lab' context..."
docker buildx create --append --name multiarch node2.lab 2>&1 > /dev/null
echo "    Adding 'node2.lab' context..."
docker buildx create --append --name multiarch node3.lab 2>&1 > /dev/null
echo "    Adding 'default' context..."
docker buildx create --append --name multiarch default 2>&1 > /dev/null

echo "=== docker buildx ls:"
docker buildx ls

echo "=== Docker multi-arch building setup complete."
