podman run \
    -it \
    -v $HOME/code/forks/runtime:/runtime \
    -w /runtime \
    -e CORE_ROOT=/runtime/artifacts/tests/coreclr/linux.riscv64.Checked/Tests/Core_Root \
    -e INTPUT_NI_DLL=/runtime/test-dlls/cext.ni.dll \
    --platform linux/amd64 \
    coreclr-r2r \
    bash -c "cd \$CORE_ROOT && ./corerun R2RDump/R2RDump.dll -d -i /runtime/test-dlls/cext.ni.dll"
