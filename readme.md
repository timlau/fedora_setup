# Setup local Fedora Linux Workstation using Ansible Playbook

## Requirements

Install ansible & required collection (flatpak+dconf)

```bash
sudo dnf5 install ansible ansible-collection-community-general
```

## Setup system

### Basic setup

```bash
make setup
```

### Delevopment setup

```bash
make setup-dev
```

### Basic + Development setup

```bash
make setup-all
```

### Configurations in playbook

- Set system Hostname
- Add rpmfusion and copr repositories
- install some wanted packages
- remove some unwanted packages
- add flathub flatpak repo
- install flatpaks from flathub
- disable Gnome Software updates auto download
- Add starship,zoxide,fzf and some aliases to .bashrc
- Setup Starship, Neovim config from fedora-config git repo
- Install and setup onedrive service

### Modifications

The `vars/user_vars.yml` contains some variables to configure packages, flatpak and other variable settings.

### To overwrite variables set in user_vars

```bash
make hostname=Beebox setup[-all]
make release=41 setup[-all]
```

### Use tags to limit action

To only execute part of the playbook

```bash
make tags=<tags> setup-tags

# Example: Only set hostname to FedoraBox
make tags=hostname hostname=FedoraBox setup-tags
```

To disable part of the playbook

```bash
ansible-playbook fedora-setup.yml --ask-become-pass --skip-tags <tags>
```

### defined tags

- `hostname`: set hostname
- `packages`: only install packages & setup rpmfusion repos
- `flatpak`: install flatpak and add flathub
- `copr` : add and enable copr repos (starship & yumex-ng)
- `bashrc` : update .bashrc (starship & zoxide)
- `onedrive` : setup onedrive service
- `config_files` : setup misc config files from the fedora-config git repo
