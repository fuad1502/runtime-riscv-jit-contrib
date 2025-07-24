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

RUN apt install -y gdb-multiarch

CMD cd "$ATEST"/"$TEST_DIR" && qemu-riscv64-static -g 1234 "$CORE_ROOT"/corerun -p System.Reflection.Metadata.MetadataUpdater.IsSupported=false -p System.Runtime.Serialization.EnableUnsafeBinaryFormatterSerialization=true "$TEST_DLL" "$TEST_ARG0" "$TEST_ARG1" & gdb-multiarch "$CORE_ROOT"/corerun -ex "target remote :1234" -ex "set sysroot $ROOTFS_DIR" -ex "set solib-search-path $CORE_ROOT"
