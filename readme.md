# Setup Local Fedora Linux 35 using Ansible

## Requirements

Install ansible & required collection (flatpak+dconf)
```
sudo dnf install ansible ansible-collection-community-general
```

## Setup system

### System configuration

 * Set system Hostname
 * Add rpmfusion 
 * install some wanted packages
 * remove some unwanted packages


```
sudo ansible-playbook f35-setup-root.yaml
```

### User configuration


 * add flathub flatpak repo
 * add gnome-nightly flatpak repo
 * install flatpaks from flathub
 * install flatpaks from gnome-night
 * disable Gnome Software updates auto download

```
ansible-playbook f35-setup-user.yaml
```
