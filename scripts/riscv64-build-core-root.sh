CONFIG=Checked # Release / Checked / Debug 
./src/tests/build.sh -cross -riscv64 -$CONFIG -generatelayoutonly -p:UseLocalAppHostPack=true -p:UsePublishedCrossgen2=false -p:EnableSourceLink=true -p:SelfContained=false -p:PublishSingleFile=false
