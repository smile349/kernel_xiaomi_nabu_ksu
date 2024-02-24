export ARCH=arm64
export CC=clang
export PATH=$PATH:$(pwd)/build-shit/clang/bin
export CROSS_COMPILE_ARM32=$(pwd)/build-shit/gcc-arm/bin/arm-eabi-
export CROSS_COMPILE=$(pwd)/build-shit/gcc-arm64/bin/aarch64-elf-

rm -rf ./out
make O=out -j$(nproc --all) nabu_defconfig || exit
make O=out -j$(nproc --all) || exit


cp out/arch/arm64/boot/Image ./CosmicFresh || exit
cd ./CosmicFresh || exit
zip -r9 Kernel.zip META-INF tools anykernel.sh Image version
