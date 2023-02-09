FROM python:3.11

ARG ENV_DIR
ARG NGROK_AUTHTOKEN

# Set the default shell to use
SHELL ["/bin/bash", "-c"]

RUN apt-get update \
    && apt-get -y install sudo vim nano tmux gcc wget

# Container user and group
ARG USERNAME=slack_liveblog
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create a user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Aliases
RUN ln -s $(which python) /usr/bin/p

USER $USERNAME

# Default env
WORKDIR /home/$USERNAME
RUN p -m venv $ENV_DIR \
    && echo "source /home/$USERNAME/$ENV_DIR/bin/activate" >> ~/.bashrc

# To be able to create a .bash_history file
WORKDIR /home/$USERNAME/hist
RUN sudo chown -R $USERNAME:$USERNAME /home/$USERNAME/hist

# Install ngrok
WORKDIR /home/${USERNAME}
RUN wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz \
    && tar xfv ngrok-v3-stable-linux-amd64.tgz \
    && rm ngrok-v3-stable-linux-amd64.tgz \
    && chmod +x ngrok \
    && sudo mv ngrok /usr/bin \
    && ngrok config add-authtoken ${NGROK_AUTHTOKEN}

WORKDIR /app

# Install dependencies
COPY src/requirements.txt .
RUN source /home/$USERNAME/$ENV_DIR/bin/activate \
    && pip install --upgrade pip \
    && pip install -r requirements.txt

# Just to keep the containder running
CMD (while true; do sleep 1; done;)
