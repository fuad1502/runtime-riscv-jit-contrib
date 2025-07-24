CONFIG=Checked # Release / Checked / Debug 
podman run \
    -it \
    -v $HOME/code/forks/runtime:/runtime \
    -w /runtime/artifacts/tests/coreclr/linux.riscv64.$CONFIG/Tests/Core_Root \
    -e CORE_ROOT=/runtime/artifacts/tests/coreclr/linux.riscv64.$CONFIG/Tests/Core_Root \
    -e ATEST=/runtime/artifacts/tests/coreclr/linux.riscv64.$CONFIG \
    --platform linux/riscv64 \
    riscv64-ubuntu-runtime \
    sh -c "\$ATEST/JIT/superpmi/superpmicollect/superpmicollect.sh -mch test.mch"

