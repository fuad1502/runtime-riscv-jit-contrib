FROM amd64/ubuntu

RUN apt update
RUN apt install -y libicu-dev
RUN apt install -y python3
RUN apt install -y git

ENV ROOTFS_DIR=/runtime/.tools/rootfs/riscv64
ENV QEMU_LD_PREFIX=/runtime/.tools/rootfs/riscv64
ENV BuildAsStandalone=true

RUN apt install -y binfmt-support
RUN apt install -y qemu-user-static
RUN apt install -y debootstrap

RUN /usr/sbin/update-binfmts --enable qemu-riscv64
