ARG UBUNTU_TAG=20.04
FROM ubuntu:${UBUNTU_TAG}

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get -qy update          \
    && apt-get install -qy      \
        cargo                   \
        libgit2-dev             \
        pkg-config libssl-dev   \
    && apt-get -q -y autoremove \
    && apt-get -q -y clean      \

LABEL                                                                     \
  org.label-schema.description="cargo-tools"                              \
  org.label-schema.name="kheaactua/cargo-tools"                           \
  org.label-schema.schema-version="1.0"                                   \
  org.label-schema.url="https://github.com/kheaactua/docker-cargo-tools " \
  org.label-schema.vendor="Matthew Russell"                               \
  org.label-schema.version="0.1"

RUN cargo install ripgrep
RUN cargo install exa
RUN cargo install procs
RUN cargo install sd
RUN cargo install du-dust
RUN cargo install ytop
RUN cargo install hyperfine

# vim: ts=4 sw=4 expandtab ff=unix :
