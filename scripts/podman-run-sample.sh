CONFIG=Checked # Release / Checked / Debug 
podman run \
    -it \
    -v $HOME/code/forks/runtime:/runtime \
    -w /runtime/artifacts/tests/coreclr/linux.riscv64.$CONFIG/Tests/Core_Root \
    -e DOTNET_TieredCompilation=0 \
    -e DOTNET_JitDisasm=FunAdd \
    -e DOTNET_JitDump= \
    -e DOTNET_JitUnwindDump=FunAdd \
    --platform linux/riscv64 \
    riscv64-ubuntu-runtime \
    sh -c "./corerun /runtime/test-dlls/cext.dll"

