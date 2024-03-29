/usr/bin/clang-10 -fbracket-depth=1024 -c -emit-llvm -D__SEAHORN__ -fdeclspec -O1 -Xclang \
-disable-llvm-optzns -fgnu89-inline -m32 \
-I/home/usea/seahorn/include -Iassert.h -o testgen.tmp1.bc ${1}
/usr/bin/opt-10 -always-inline -inline-threshold=1024 testgen.tmp1.bc -o testgen.tmp1_inline.bc
/home/usea/seahorn/bin/seapp -o testgen.tmp2.bc \
--simplifycfg-sink-common=false --strip-extern=true --promote-assumptions=false \
--kill-vaarg=true --horn-keep-arith-overflow=false testgen.tmp1_inline.bc
/home/usea/seahorn/bin/seapp --simplifycfg-sink-common=false -o testgen.tmp3.bc \
--horn-mixed-sem --ms-reduce-main testgen.tmp2.bc
/home/usea/seahorn/bin/seahorn --keep-shadows=true --sea-dsa=ci -horn-inter-proc \
-horn-sem-lvl=mem -o ${2} testgen.tmp3.bc \
--horn-no-verif --horn-nondet-undef=true --horn-step=small