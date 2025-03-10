# Setup local Fedora Linux Workstation using Ansible Playbook

## Requirements

Install ansible & required collection (flatpak+dconf)

```
sudo dnf5 install ansible ansible-collection-community-general
```

## refresh fedora-config git submodule

the fedora config files is stored in the [fedora-config](https://github.com/timlau/fedora-config) git repository.
it is added as a git submodule here, to refresh it to the latest version use the following command

```
git submodule update --remote
```

## Setup system

Run the following to setup your system

```
ansible-playbook fedora-setup.yml --ask-become-pass
```

For developer setup (git etc) use

```
ansible-playbook fedora-dev-setup.yml --ask-become-pass

```

### Configurations in playbook

- Set system Hostname
- Add rpmfusion
- install some wanted packages
- remove some unwanted packages
- add flathub flatpak repo
- install flatpaks from flathub
- disable Gnome Software updates auto download
- Add starship + zoxide to .bashrc

### Modifications

The `vars/user_vars.yml` contains some variables to configure packages, flatpak and other variable settings.

### To overwrite variables set in user_vars

```bash
ansible-playbook fedora-setup.yml --ask-become-pass -e "fedora_release=39"
ansible-playbook fedora-setup.yml --ask-become-pass -e "fedora_hostname=BeeBox"
```

### Use tags to limit action

To only execute part of the playbook

```bash
ansible-playbook fedora-setup.yml --ask-become-pass --tags <tags>
```

To disable part of the playbook

```bash
ansible-playbook fedora-setup.yml --ask-become-pass --skip-tags <tags>
```

### defined tags

- `hostname`: set hostname
- `user`: actions executed as user
- `superuser`: actions executed as superuser (via sudo)
- `packages`: only install packages & setup rpmfusion repos
- `flatpak`: install flatpak and add flathub
- `copr` : add and enable copr repos (starship & yumex-ng)
- `bashrc` : update .bashrc (starship & zoxide)
