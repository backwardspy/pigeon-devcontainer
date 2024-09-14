FROM mcr.microsoft.com/vscode/devcontainers/base

RUN apt update \
    && apt install -y \
    direnv \
    tar \
    fish \
    git-lfs\
    neovim \
    && apt clean

WORKDIR /home/vscode
USER vscode

RUN mkdir -p ~/.local/bin/ \
    && curl -L https://github.com/eza-community/eza/releases/download/v0.19.3/eza_x86_64-unknown-linux-gnu.tar.gz -o eza.tar.gz \
    && tar -xzf eza.tar.gz -C ~/.local/bin/ "./eza" \
    && rm eza.tar.gz \
    && curl -sS https://starship.rs/install.sh | sh -s -- --yes

COPY --chown=vscode:vscode config/ /home/vscode/.config/
