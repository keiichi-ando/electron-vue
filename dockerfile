FROM node:15.2-buster

ARG USER_NAME="node"
ARG USER_UID=1000
ARG USER_GID=1000

ENV DISPLAY=:0

RUN npm install -g @vue/cli

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    && apt-get upgrade -y \
    && apt-get install -y sudo libgtkextra-dev libgconf2-dev libnss3 libasound2 libxtst-dev libxss1 libgtk-3-0 libx11-xcb-dev libxcb-dri3-dev libdrm-dev libgbm-dev libcups2-dev locales-all 
    # clean up
    # && apt-get autoremove -y \
    # && apt-get clean -y \
    # && rm -rf /var/lib/apt/lists/*

# volume owner
RUN echo -e "\e[32m OWNER ${USER_GID}:${USER_GID} ${USER_NAME} \e[m" \
    && groupmod --gid ${USER_GID} ${USER_NAME} \
    && usermod --uid ${USER_UID} --gid ${USER_GID} ${USER_NAME} --home /home/${USER_NAME} --move-home --shell /bin/bash \
    && chown -R ${USER_UID}:${USER_GID} /home/${USER_NAME} \
    && echo "${USER_NAME} ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/${USER_NAME} \
    && chmod 0440 /etc/sudoers.d/${USER_NAME}

WORKDIR /home/${USER_NAME}/myapp
USER ${USER_NAME}

# not to use shared memory
ENV QT_X11_NO_MITSHM=1
