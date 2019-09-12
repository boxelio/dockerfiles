# dockerfiles
Docker build files for containers used by BoxOS and Boxels.

# Cross-compile Ready
Most of these dockerfiles have been tested with Docker's experimental `buildx` feature that cross-compiles images on a variety of architectures. We have specifically tuned these dockerfiles to compile properly on `armv7`/`arm64` (Raspberry Pi) and `amd64`. They should generally work fine on `x86` as well.

We have pushed precompiled images at [our DockerHub repository](https://hub.docker.com/u/boxel). Please feel free to use them in your Docker-based environments and let us know how they work for you.

# Contributions
Contributions are welcome! Please submit pull requests with fixes, adjustments, and additions. Or, submit an Issue if you'd like for us to containerize anything else if you don't know how to.
