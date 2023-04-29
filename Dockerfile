FROM fedora:latest

COPY . /dotfiles 

RUN chmod +x /dotfiles/setup_dnf_config \
    && /usr/bin/sudo ./dotfiles/setup_dnf_config \
    && dnf -y update \
    # && dnf -y install \
    # any additional packages you need go here \
    && dnf clean all

WORKDIR /dotfiles

RUN dnf -y install python3-pip \
    && python3 -m pip install --user ansible \
    && export PATH=$PATH:/root/.local/bin

CMD ["/bin/bash"]

