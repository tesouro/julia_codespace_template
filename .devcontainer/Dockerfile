# Start from the official Julia devcontainer image
FROM ghcr.io/julia-vscode/julia-devcontainer:latest

# Install Julia 1.11.0 and set as default
RUN apt-get update && \
    apt-get install -y wget && \
    wget https://julialang-s3.julialang.org/bin/linux/x64/1.11/julia-1.11.0-linux-x86_64.tar.gz && \
    tar -xzf julia-1.11.0-linux-x86_64.tar.gz && \
    mv julia-1.11.0 /opt/ && \
    rm julia-1.11.0-linux-x86_64.tar.gz && \
    rm -rf /usr/local/julia && \
    ln -s /opt/julia-1.11.0 /usr/local/julia && \
    ln -sf /opt/julia-1.11.0/bin/julia /usr/local/bin/julia

# Verify Julia version
RUN julia --version
