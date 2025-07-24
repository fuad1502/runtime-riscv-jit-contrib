CONFIG=Checked # Release / Checked / Debug 
podman run \
    -it \
    -v $HOME/code/forks/runtime:/runtime \
    -w /runtime \
    -e CORE_ROOT=/runtime/artifacts/tests/coreclr/linux.riscv64.$CONFIG/Tests/Core_Root \
    -e INPUT_NI_DLL=/runtime/test-dlls/cext.ni.dll \
    --platform linux/amd64 \
    coreclr-r2r \
    bash -c "cd \$CORE_ROOT && ./corerun R2RDump/R2RDump.dll -d -i \$INPUT_NI_DLL"
