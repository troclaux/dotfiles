FROM fedora:latest

COPY . /dotfiles 

RUN chmod +x /dotfiles/setup_dnf_config \
    && /usr/bin/sudo ./dotfiles/setup_dnf_config \
    && dnf -y update \
    # && dnf -y install \
    # any additional packages you need go here \
    && dnf clean all

CMD ["/bin/bash"]

