podman run \
    -it \
    -v $HOME/code/forks/runtime:/runtime \
    -v $HOME/code/forks/runtime:/home/fuad1502/code/forks/runtime \
    -e DOTNET_DbgEnableMiniDump=0 \
    -e DOTNET_LogStackOverflowExit=1 \
    -e CORE_ROOT=/runtime/artifacts/tests/coreclr/linux.riscv64.Release/Tests/Core_Root \
    -e ATEST=/runtime/artifacts/tests/coreclr/linux.riscv64.Release \
    -e TEST_DIR=./JIT/jit64/opt/cse/HugeField2/\
    -e TEST_DLL=HugeField2.dll \
    -e TEST_ARG0= \
    -e TEST_ARG1= \
    -e DOTNET_JitHalt= \
    -e DOTNET_JitDisasm= \
    -e DOTNET_JitUnwindDump= \
    -w /runtime \
    --platform linux/amd64 \
    coreclr-gdb \

