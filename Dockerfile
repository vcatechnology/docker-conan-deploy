FROM conan/gcc7
MAINTAINER VCA Technology <developers@vcatechnology.com>

# Build-time metadata as defined at http://label-schema.org
ARG PROJECT_NAME
ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="$PROJECT_NAME" \
      org.label-schema.description="A docker image with additional tools for deployment to VCA Servers" \
      org.label-schema.url="https://www.vcatechnology.com" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/vcatechnology/docker-ubuntu-ci" \
      org.label-schema.vendor="VCA Technology" \
      org.label-schema.version=$VERSION \
      org.label-schema.license=MIT \
      org.label-schema.schema-version="1.0"

# Grab the VCA CI Scripts
wget -q https://tool-chain.vcatechnology.com/release/vca-tool-chain-ci-scripts-latest.tar.xz && \
tar -Jxf vca-tool-chain-ci-scripts-latest.tar.xz -C / && \
rm vca-tool-chain-ci-scripts-latest.tar.xz && \
vca-uninstall-package wget
