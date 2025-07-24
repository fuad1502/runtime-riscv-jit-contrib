CONFIG=Checked # Release / Checked / Debug 
podman run \
    -it \
    -v $HOME/code/forks/runtime:/runtime \
    -w /runtime \
    -e CORE_ROOT=/runtime/artifacts/tests/coreclr/linux.riscv64.$CONFIG/Tests/Core_Root \
    -e INPUT_DLL=/runtime/test-dlls/cext.dll \
    -e OUTPUT_DLL=/runtime/test-dlls/cext.ni.dll \
    --platform linux/amd64 \
    coreclr-r2r \
    bash -c "cd \$CORE_ROOT && crossgen2/crossgen2 -o\$OUTPUT_DLL -r:\$CORE_ROOT/*.dll --verbose --targetarch:riscv64 --targetos:linux -m:\$CORE_ROOT/StandardOptimizationData.mibc --embed-pgo-data -O --verify-type-and-field-layout --enable-cached-interface-dispatch-support \$INPUT_DLL --perfmap-format-version:1 --perfmap --perfmap-path:\$CORE_ROOT"
