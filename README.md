# .NET Runtime RISC-V JIT Contribution Guideline

This repository will guide you through all the steps you need to go through to successfully contribute to .NET runtime RISC-V JIT: setup development environment, building, testing / evaluating your changes, debugging, opening a PR, and how to start navigate the codebase. 

## Pre-requisites

### Setup development environment

1. Download required software:

I will assume you're developing on a linux environment, specifically on Ubuntu.

```sh
sudo apt install git podman qemu-user-static
```

2. Fork `dotnet/runtime`

Using your personal [github.com](github.com) account, fork `dotnet/runtime` upstream repository at [github.com/dotnet/runtime](github.com/dotnet/runtime).

3. Clone repositories

```sh
git clone https://github.com/fuad1502/runtime-riscv-jit-contrib.git
git clone https://github.com/fuad1502/runtime.git # Change this to your runtime fork
```

### Build containers

```sh
cd runtime-riscv-jit-contrib
podman build -t coreclr-dbg Dockerfiles/coredlr-dbg/
podman build -t coreclr-r2r Dockerfiles/coredlr-r2r/
podman build -t coreclr-test Dockerfiles/coredlr-test/
podman build -t riscv64-ubuntu-runtime Dockerfiles/riscv64-ubuntu-runtime/
```

### Link scripts to runtime repository

```sh
cd runtime
ln -s ../runtime-riscv-jit-contrib/scripts/podman-create-mch.sh .
ln -s ../runtime-riscv-jit-contrib/scripts/podman-crossgen2.sh .
ln -s ../runtime-riscv-jit-contrib/scripts/podman-r2rdump.sh
ln -s ../runtime-riscv-jit-contrib/scripts/podman-run-asmdiff.sh .
ln -s ../runtime-riscv-jit-contrib/scripts/podman-run-gdb.sh .
ln -s ../runtime-riscv-jit-contrib/scripts/podman-run-sample.sh .
ln -s ../runtime-riscv-jit-contrib/scripts/podman-run-test.sh .
ln -s ../runtime-riscv-jit-contrib/scripts/riscv64-build-core-root.sh .
ln -s ../runtime-riscv-jit-contrib/scripts/riscv64-build-test.sh .
ln -s ../runtime-riscv-jit-contrib/scripts/riscv64-full-build.sh .
```

### Extract build rootfs

Assuming you're runtime repository is located at `$RUNTIME_DIR`:

```sh
cd runtime-riscv-jit-contrib
mkdir $RUNTIME_DIR/.tools
tar -xzvf rootfs.tar.gz $RUNTIME_DIR/.tools
```

## Building

For the following steps, I assume you've set the following environment variable:

```sh
export ROOTFS_DIR=$RUNTIME_DIR/.tools/rootfs/riscv64
```

### Build the runtime

```sh
cd runtime
./riscv64-full-build.sh
```

The script will build the coreclr runtime, host, and libraries. When only modifying files in `src/coreclr/jit/`, it is sufficient to only build the coreclr component to cut build time using `riscv64-build-coreclr.sh`.

Note that all of the scripts sets a `CONFIG` variable. You can set it to "Release", "Checked", or "Debug". "Debug" does not optimize the build at all. "Checked" optimizes the build. "Release" optimizes the build AND remove all `assert` statements. 

For development, I prefer to use the "Checked" configuration to be as close as possible to the "Release" configuration, while still having the `assert` statements to easily find errors in the code. If you made incorrect changes to the JIT compiler, the assertion would probably fire off when you're executing the above script. This is because during one of the build step, it is executing `crossgen2` (basically JIT compiles a DLL file) using "your" JIT.

### Build tests

You only need to build the tests if you would like to run the CoreCLR tests.

```sh
cd runtime
./riscv64-build-tests.sh
```

### Build `Core_Root`

`Core_Root` is a directory containing all the binaries & libraries needed to execute the runtime. The entry point for executing the runtime is the `corerun` binary, which is inside the `Core_Root` directory. The `Core_Root` directory layout is exactly how the runtime is packaged.

```sh
cd runtime
./riscv64-build-core-root.sh
```

The `Core_Root` directory will be generated at `$RUNTIME_DIR/artifacts/tests/coreclr/linux.riscv64.$CONFIG/Tests/Core_Root`.

## Testing changes

### Test with sample DLL

1. Create sample DLL

2. Run script

### Running CoreCLR tests

Modify the following line in `podman-run-test.sh` to the test directory you would like to test:

```
# ...
    -e TEST_DIR=./JIT/jit64/opt/cse/HugeField2\
# ...
```

You can also add `JitDisasm` or `JitDisasm` environment variables if you like to. Then, execute:

```sh
./podman-run-test.sh
```

### Run assembly diffs

1. Build `dotnet/jitutils`

2. Create MCH file

The MCH file is created using the "base" runtime. The "base" runtime is the latest commit not including your changes.

```sh
git checkout main # change main to a commit id if the base is not at main
./riscv64-full-build.sh
./riscv64-build-core-root.sh
./podman-create-mch.sh
```

3. Perform diffs

First, copy the previously built base `Core_Root` to `Core_Rootbase`:

```sh
export CORE_ROOT=$RUNTIME_DIR/artifacts/tests/coreclr/linux.riscv64.$CONFIG/Tests/Core_Root
export CORE_ROOT_BASE=$RUNTIME_DIR/artifacts/tests/coreclr/linux.riscv64.$CONFIG/Tests/Core_Rootbase
cp -r CORE_ROOT CORE_ROOT_BASE
```

Then, build the runtime with your changes and run asm diffs:

```sh
git checkout feature-branch
./riscv64-full-build.sh
./riscv64-build-core-root.sh
./podman-run-asmdiff.sh
```

If successful, the diff summary will be generated at `$RUNTIME_DIR/artifacts/spmi/diff_summary.md`.

### Crossgen2 & R2RDump

## Debugging

### Debugging with GDB

## Setting up clang language server protocol

## Opening a PR

## How to start?

1. Understanding the important compiler phases

2. Interesting files
