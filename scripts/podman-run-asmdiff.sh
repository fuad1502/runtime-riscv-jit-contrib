# git checkout main
# ./riscv64-build.sh && ./riscv64-build-core-root.sh && ./riscv64-build-test.sh
# cp ~/code/jitutils/artifacts/linux-riscv64/lib/libcoredistools.so* $CORE_ROOT
# mv $CORE_ROOT $CORE_ROOT_BASE
# git checkout <branch>
# ./riscv64-build.sh && ./riscv64-build-core-root.sh
# cp ~/code/jitutils/artifacts/linux-riscv64/lib/libcoredistools.so* $CORE_ROOT

CONFIG=Checked # Release / Checked / Debug 
podman run \
    -it \
    -v $HOME/code/forks/runtime:/runtime \
    -w /runtime/artifacts/tests/coreclr/linux.riscv64.$CONFIG/Tests/Core_Root \
    -e CORE_ROOT=/runtime/artifacts/tests/coreclr/linux.riscv64.$CONFIG/Tests/Core_Root \
    -e CORE_ROOT_BASE=/runtime/artifacts/tests/coreclr/linux.riscv64.$CONFIG/Tests/Core_Rootbase \
    -e ATEST=/runtime/artifacts/tests/coreclr/linux.riscv64.$CONFIG \
    --platform linux/riscv64 \
    riscv64-ubuntu-runtime \
    sh -c "\
        python3 /runtime/src/coreclr/scripts/superpmi.py asmdiffs -arch riscv64 -target_arch riscv64 -base_jit_path \$CORE_ROOT_BASE/libclrjit.so -mch_files \$ATEST/JIT/superpmi/superpmicollect/test.mch
    "
        # \$ATEST/JIT/superpmi/superpmicollect/superpmicollect.sh -mch test.mch && \
