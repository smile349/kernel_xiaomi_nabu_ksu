export ARCH=arm64
export CC=clang
export PATH=$PATH:$(pwd)/build-shit/clang/bin
export CROSS_COMPILE_ARM32=$(pwd)/build-shit/gcc-arm/bin/arm-eabi-
export CROSS_COMPILE=$(pwd)/build-shit/gcc-arm64/bin/aarch64-elf-
export CLANG_URL="https://android.googlesource.com/platform//prebuilts/clang/host/linux-x86/+archive/3857008389202edac32d57008bb8c99d2c957f9d/clang-r383902.tar.gz"

setup_environment() {
    sudo apt update && sudo apt install -y lib32ncurses5-dev automake libssl-dev lzop policycoreutils xsltproc libbz2-1.0 \
                        lib32z-dev unzip bzip2 maven liblz4-tool libghc-bzlib-dev libxml-simple-perl \
                        build-essential flex gperf pngcrush libxml-sax-base-perl x11proto-core-dev minicom \
                        libswitch-perl ccache libxml2-utils git bison pwgen zip schedtool wget \
                        libx11-dev bc libc6-dev-i386 g++-multilib zlib1g-dev dpkg-dev libelf-dev libdebuginfod-dev \
                        squashfs-tools optipng curl libgl1-mesa-dev libbz2-dev make gnupg libncurses5 fontconfig
    mkdir -p build-shit && cd build-shit || exit
    git clone https://github.com/KenHV/gcc-arm64.git --single-branch -b master --depth=1 || exit
    git clone https://github.com/KenHV/gcc-arm.git --single-branch -b master --depth=1 || exit
    mkdir clang && cd clang || exit
    wget $CLANG_URL -O clang.tar.gz || exit
    ls -lh
    tar xzvf clang.tar.gz || exit
    export PATH=$(pwd):$PATH
    cd ../..
}

[ ! -d "build-shit" ] && setup_environment


[ -d "out" ] && rm -rf ./out

[ -f "CosmicFresh/Image" ] && rm CosmicFresh/Image -f

make O=out -j$(nproc --all) nabu_defconfig || exit
make O=out -j$(nproc --all) || exit


cp out/arch/arm64/boot/Image ./CosmicFresh || exit
cd ./CosmicFresh || exit
zip -r9 Kernel.zip META-INF tools anykernel.sh Image version
