# Setup local Fedora Linux Workstation using Ansible Playbook

## Requirements

Install ansible & required collection (flatpak+dconf)
```
sudo dnf install ansible ansible-collection-community-general
```

## Setup system

Run the following to setup your system
```
ansible-playbook fedora-setup.yml --ask-become-pass
```

### Configurations in playbook

 * Set system Hostname
 * Add rpmfusion 
 * install some wanted packages
 * remove some unwanted packages
 * add flathub flatpak repo
 * install flatpaks from flathub
 * disable Gnome Software updates auto download

### Modifications

The `fedora-setup.yml` contains some variables to configure fedora release and hostname

```YAML
    vars:
      fedora_release: 36
      fedora_hostname: FedoraBox

```


