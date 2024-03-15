# server

---

## Требования

### Сервер

- [Debian 12 bookworm](https://cdimage.debian.org/debian-cd/12.1.0/amd64/iso-cd/)
- ```shell
  printf '\n\nInstall packages...\n' && \
  apt-get install --yes sudo openssh-server python3 && \
  useradd --groups sudo --shell /bin/bash --create-home admin && printf '\n\nUser created!\n\n' && \
  passwd admin && \
  sed --in-place='.backup' --regexp-extended "s/^PasswordAuthentication.+$/PasswordAuthentication yes/" /etc/ssh/sshd_config && printf '\n\nsshd_config changed!\n\n' &&\
  systemctl reload sshd.service && printf 'sshd.service reloaded!\n\n'
  ```

### Локально

- [ansible](https://docs.ansible.com/ansible/latest/installation_guide/installation_distros.html#installing-ansible-on-fedora-linux)
  ```shell
  sudo dnf install ansible
  ```
- ```shell
  ssh-copy-id -i ~/.ssh/personal_id_ed25519.pub admin@192.168.0.14
  ```

---

## Запуск плэйбука

- С повышением привилегий
  ```shell
  ansible-playbook -i ./inventory.yaml --ask-become-pass ./hypervisor/install.yaml
  ```
- Обычного
  ```shell
  ansible-playbook -i ./inventory.yaml ./hypervisor/list_vms.yaml
  ```
