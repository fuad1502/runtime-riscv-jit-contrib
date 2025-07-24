# .NET Runtime RISC-V JIT Contribution Guideline

This repository will guide you through all the steps you need to go through to successfully contribute to .NET runtime RISC-V JIT: setup development environment, building, testing / evaluating your changes, debugging, opening a PR, and how to start navigate the codebase. 

## Pre-requisites

### Setup development environment

1. Download required software:

I will assume you're developing on a linux environment, specifically on Ubuntu.

```
sudo apt install git podman qemu-user-static
```

2. Fork `dotnet/runtime`

Using your personal [github.com] account, fork `dotnet/runtime` upstream repository at [github.com/dotnet/runtime].

3. Clone repositories

```
git clone https://github.com/fuad1502/runtime-riscv-jit-contrib.git
git clone https://gituhb.com/fuad1502/runtime.git # Change this to your runtime fork
```

### Build containers

```
cd runtime-riscv-jit-contrib
podman build -t coreclr-dbg Dockerfiles/coredlr-dbg/
podman build -t coreclr-r2r Dockerfiles/coredlr-r2r/
podman build -t coreclr-test Dockerfiles/coredlr-test/
podman build -t riscv64-ubuntu-runtime Dockerfiles/riscv64-ubuntu-runtime/
```

### Link scripts to runtime repository

```
cd runtime
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

## Building

### Build the runtime

### Build tests

### Build core root

## Testing changes

### Test with sample DLL

1. Create sample DLL

2. Run script

### Running CoreCLR tests

### Run assembly diffs

1. Build `dotnet/jitutils`

2. Create MCH file

3. Perform diffs

### Crossgen2 & R2RDump

## Debugging

### Debugging with GDB

## Opening a PR

## How to start?

1. Understanding the important compiler phases

2. Interesting files
