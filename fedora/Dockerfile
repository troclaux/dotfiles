FROM fedora:latest

RUN \
  grep -q "max_parallel_downloads=" /etc/dnf/dnf.conf || echo "max_parallel_downloads=5" >> /etc/dnf/dnf.conf && \
  grep -q "fastestmirror=" /etc/dnf/dnf.conf || echo "fastestmirror=true" >> /etc/dnf/dnf.conf && \
  dnf -y update && \
  dnf clean all

RUN dnf -y install ansible

WORKDIR /root/dotfiles

CMD ["ansible-playbook", "-K", "local.yml"]
