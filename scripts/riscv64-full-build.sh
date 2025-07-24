CONFIG=Checked # Release / Checked / Debug 
./build.sh -ci -arch riscv64 -os linux -cross -s clr+libs+host+packs -rc $CONFIG -c Release --bootstrap
