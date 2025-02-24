FROM node:18-alpine AS builder

WORKDIR /app
COPY ./ ./
ENV VCPKG_FORCE_SYSTEM_BINARIES=1
RUN \
    # system dependencies
    apk add --no-cache \
    bash \ 
    build-base \
    curl \ 
    git \
    g++ \ 
    make \ 
    ninja-build \
    pkgconfig \
    unzip \
    zip \
    python3 \
    tar \
    cmake \ 
    ninja \
    musl-dev \
    automake \
    autoconf \
    libtool && \
    cp /usr/lib/ninja-build/bin/ninja /usr/bin/ninja && \ 
    # build
    npm i -g pnpm && \
    pnpm install && \
    pnpm run build

FROM node:18-alpine
WORKDIR /app

COPY ./ ./
COPY --from=builder /app/build ./build
COPY --from=builder /app/node_modules ./node_modules


