# server

---

## Требования

- [Debian 12 bookworm](https://cdimage.debian.org/debian-cd/12.1.0/amd64/iso-cd/)
- sshd 
  - `apt install ssh`
  - `nano /etc/ssh/sshd_config`
  - `PermitRootLogin yes`
  - `PasswordAuthentication yes`

## Подготовка

- ```shell
    ssh-copy-id -i ~/.ssh/id_ed25519_personal.pub root@192.168.0.17
  ```
- ```shell
    ssh -i ~/.ssh/id_ed25519_personal root@192.168.0.17 apt install python3
  ```
