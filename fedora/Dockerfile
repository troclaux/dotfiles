FROM fedora:latest

RUN grep -q "max_parallel_downloads=" /etc/dnf/dnf.conf || echo "max_parallel_downloads=5" >> /etc/dnf/dnf.conf \
    && grep -q "fastestmirror=True" /etc/dnf/dnf.conf || echo "fastestmirror=True" >> /etc/dnf/dnf.conf \
    && grep -q "deltarpm=True" /etc/dnf/dnf.conf || echo "deltarpm=True" >> /etc/dnf/dnf.conf \
    && dnf -y update \
    # && dnf -y install \
    # any additional packages you need go here \
    && dnf clean all

RUN dnf -y install python3-pip \
    && python3 -m pip install --user ansible \
    && export PATH=$PATH:/root/.local/bin

VOLUME /home/dotfiles

WORKDIR /home

CMD ["/bin/bash"]
