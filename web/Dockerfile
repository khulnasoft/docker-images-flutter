ARG flutter_tag

FROM ghcr.io/khulnasoft/flutter:$flutter_tag

RUN flutter config --enable-web \
    && sudo apt-get update \
    && sudo apt-get install -y chromium-browser \
    && sudo rm -rf /var/lib/apt/lists/*
