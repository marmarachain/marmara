FROM ubuntu:20.04 AS builder
LABEL maintainer="abdulkadir@marmara.io"
WORKDIR /marmarachain

ARG BUILD_PACKAGES="libevent-dev libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev curl \
        libboost-test-dev libboost-thread-dev build-essential pkg-config libc6-dev m4 g++-multilib autoconf libtool ncurses-dev python3-zmq \
        zlib1g-dev wget bsdmainutils automake cmake clang libsodium-dev libcurl4-gnutls-dev libssl-dev git unzip python jq"
ARG DEBIAN_FRONTEND=noninteractive
# Install dependencies
RUN apt update && apt install -y $BUILD_PACKAGES
# Add files to the Docker image
ADD ./ marmara/
# Build the Marmarachain
RUN marmara/zcutil/build.sh -j$(nproc)

FROM ubuntu:20.04
LABEL maintainer="abdulkadir@marmara.io"
# Install runtime dependencies
RUN apt update && apt install -y nano htop libgomp1 && rm -rf /var/lib/apt/lists/*

# Copy the built binaries from the builder stage
COPY --from=builder /marmarachain/marmara/src/marmarad /usr/local/bin/marmarad
COPY --from=builder /marmarachain/marmara/src/marmara-cli /usr/local/bin/marmara-cli
COPY zcutil/docker-entrypoint.sh /usr/local/bin/entrypoint
ARG GROUP_ID=1000
ARG USER_ID=1000  

# Create user and set ownership
RUN addgroup --gid ${GROUP_ID} usergroup && \
    adduser --disabled-password --gecos '' --uid ${USER_ID} --gid ${GROUP_ID} marmarachain && \
    chown -R marmarachain:usergroup /home/marmarachain

WORKDIR /home/marmarachain
USER marmarachain

ENTRYPOINT ["entrypoint"]