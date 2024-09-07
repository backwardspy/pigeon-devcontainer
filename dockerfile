FROM debian:unstable

ARG USERNAME=dev
ARG USER_UID=1000
ARG USER_GID=$USER_UID

ENV LANG=C.UTF-8

RUN groupadd --gid ${USER_GID} ${USERNAME} \
    && useradd --uid ${USER_UID} --gid ${USER_GID} -m ${USERNAME} \
    && mkdir -p /etc/sudoers.d \
    && echo "${USERNAME} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/${USERNAME} \
    && chmod 0440 /etc/sudoers.d/${USERNAME}

RUN apt update && apt install -y \
    curl \
    direnv \
    eza \
    fish \
    git \
    git-lfs\
    neovim \
    sudo \
    vivid

USER ${USERNAME}
WORKDIR /home/${USERNAME}

COPY --chown=${USER_UID}:${USER_GID} config/ .config/

RUN curl -sS https://starship.rs/install.sh | sh -s -- --yes

CMD ["fish"]