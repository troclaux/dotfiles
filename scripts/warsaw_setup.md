# Warsaw security module

Warsaw (the "Módulo de Segurança") is the security module Brazilian banks require for internet banking. It runs as the `warsaw` systemd service. `setup_workstation.sh` doesn't install it, since the bank's download isn't in any package repo.

## Download

Download the Linux installer from your bank's website, and pick the `.rpm` on Fedora or the `.deb` on Debian and Ubuntu. Extract it into its own folder. It should contain:

- `warsaw_setup.sh`: the bank's installer script
- `eula_reader` and `license-*.html`: the license agreement
- `warsaw-<version>.x86_64.rpm` and `WARSAW-RPM-GPG-KEY`, or `warsaw_<version>_amd64.deb`

## Install

### With the bank's script

```sh
cd ~/Downloads/warsaw_setup
./warsaw_setup.sh
```

It shows the license agreement, then opens the package in a graphical installer (GNOME Software on Fedora, or whichever one it finds). It exits with code 1 if you decline the license, 2 if it can't find the `.rpm` or `.deb`, and 3 if it can't find an installer.

### From the terminal

Installs the same package without the graphical installer. Read the license in `license-en.html` first.

Fedora:

```sh
cd ~/Downloads/warsaw_setup
sudo rpm --import WARSAW-RPM-GPG-KEY
sudo dnf install ./warsaw-*.rpm
```

Debian and Ubuntu:

```sh
cd ~/Downloads/warsaw_setup
sudo apt install ./warsaw_*.deb
```

The package enables and starts the `warsaw` service.

## Check it works

```sh
rpm -q warsaw                 # Fedora, or: dpkg -s warsaw
systemctl status warsaw       # should be active (running)
```

Then restart the browser and open your bank's website.

## Troubleshooting

If the bank's website says the module isn't installed or isn't running, restart the service and the browser:

```sh
sudo systemctl restart warsaw
```

## Uninstall

```sh
sudo dnf remove warsaw        # Fedora, or: sudo apt remove warsaw
```
