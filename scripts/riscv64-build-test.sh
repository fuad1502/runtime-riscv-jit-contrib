CONFIG=Checked # Release / Checked / Debug 
./src/tests/build.sh -cross -riscv64 -$CONFIG -priority1 -p:UseLocalAppHostPack=true -p:UsePublishedCrossgen2=false -p:EnableSourceLink=true -p:SelfContained=false -p:PublishSingleFile=false
