# server

---

## Установка

### Сервер

- [Debian 12 bookworm](https://cdimage.debian.org/mirror/cdimage/archive/12.1.0/amd64/iso-cd/debian-12.1.0-amd64-netinst.iso)
- [init.bash](init.bash)

### Локально

- [ansible](https://docs.ansible.com/ansible/latest/installation_guide/installation_distros.html#installing-ansible-on-fedora-linux)
  ```shell
  sudo dnf install ansible
  ```
- ```shell
  ssh-copy-id -i ~/.ssh/personal_id_ed25519.pub admin@192.168.0.128
  ```

---

## Запуск плэйбука

- С повышением привилегий
  ```shell
  ansible-playbook -i ./inventory.yaml --ask-become-pass ./virtualization/hypervisor/install.yaml
  ```
- Обычного
  ```shell
  ansible-playbook -i ./inventory.yaml ./virtualization/gitea-vm/install.yaml
  ```

# TODO

- ...
