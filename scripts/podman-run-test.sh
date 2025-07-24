podman run \
    -it \
    -v $HOME/code/forks/runtime:/runtime \
    -e CORE_ROOT=/runtime/artifacts/tests/coreclr/linux.riscv64.Release/Tests/Core_Root \
    -e ATEST=/runtime/artifacts/tests/coreclr/linux.riscv64.Release \
    -e TEST_DIR=./JIT/jit64/opt/cse/HugeField2\
    -w /runtime \
    --platform linux/amd64 \
    coreclr-test \

# -e CORE_ROOT=/runtime/artifacts/tests/coreclr/linux.riscv64.Checked/Tests/Core_Root \
# -e ATEST=/runtime/artifacts/tests/coreclr/linux.riscv64.Checked \

# JIT/jit64/opt/cse/HugeField2
# JIT/jit64/opt/cse/HugeArray V
# JIT/jit64/opt/cse/HugeArray1 V
# JIT/Methodical/Methodical_d2 V
# JIT/Methodical/Methodical_do V
# JIT/Methodical/Methodical_r2 V
# JIT/Methodical/Methodical_ro V
# Interop/UnmanagedCallersOnly/UnmanagedCallersOnlyTest V
# Regressions/coreclr/GitHub_104820 ?
# JIT/opt/OSR/pinnedlocal V
# JIT/opt/Vectorization/UnrollEqualsStartsWith V
# JIT/opt/virtualstubdispatch/bigvtbl/bigvtbl_cs_d V
# JIT/opt/virtualstubdispatch/bigvtbl/bigvtbl_cs_r V
# JIT/IL_Conformance/Convert/TestConvertFromIntegral ?
# GC/API/GC/GetAllocatedBytesForCurrentThread V
# baseservices/compilerservices/dynamicobjectproperties/TestAPIs V
# baseservices/threading/regressions/beta2/437017 V
# baseservices/exceptions/simple/HardwareEh V
# reflection/DefaultInterfaceMethods/InvokeConsumer V
# baseservices/exceptions/stackoverflow/stackoverflowtester V
