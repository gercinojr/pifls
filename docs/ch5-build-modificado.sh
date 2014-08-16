#!/bin/bash
#
# PiLFS Build Script SVN-20140519 v1.0
# Builds chapters 5.4 - Binutils to 5.34 - Xz
# http://www.intestinate.com/pilfs
#

#
# SCRIPT MODIFICADO POR Gercino Jr.
#
# A parte inicial da automatização da compilação dos pacotes (5.4 até 5.19) foi 
# feita manualmente, então, aqui se encontra apenas a parte final (5.20 até 5.34).
#
# A saída deste script pode ser encontrada no arquivo ch5-build-modificado.log
#

# Optional parameteres below:

STRIP_AND_DELETE_DOCS=1     # Strip binaries and delete manpages to save space at the end of chapter 5?

# End of optional parameters

set -o nounset
set -o errexit

function prebuild_sanity_check {
    if [[ $(whoami) != "lfs" ]] ; then
        echo "Not running as user lfs, you should be!"
        exit 1
    fi

    if ! [[ -v LFS ]] ; then
        echo "You forgot to set your LFS environment variable!"
        exit 1
    fi

    if ! [[ -v LFS_TGT ]] || [[ $LFS_TGT != "armv6l-lfs-linux-gnueabihf" ]] ; then
        echo "Your LFS_TGT variable should be set to armv6l-lfs-linux-gnueabihf"
        exit 1
    fi

    if ! [[ -d $LFS ]] ; then
        echo "Your LFS directory doesn't exist!"
        exit 1
    fi

    if ! [[ -d $LFS/sources ]] ; then
        echo "Can't find your sources directory!"
        exit 1
    fi

    if [[ $(stat -c %U $LFS/sources) != "lfs" ]] ; then
        echo "The sources directory should be owned by user lfs!"
        exit 1
    fi

    if ! [[ -d $LFS/tools ]] ; then
        echo "Can't find your tools directory!"
        exit 1
    fi

    if [[ $(stat -c %U $LFS/tools) != "lfs" ]] ; then
        echo "The tools directory should be owned by user lfs!"
        exit 1
    fi
}

function check_tarballs {
LIST_OF_TARBALLS="
binutils-2.24.tar.bz2
gcc-4.9.0.tar.bz2
gcc-4.9.0-pi-cpu-default.patch
gcc-4.9.0-upstream_fixes-1.patch
mpfr-3.1.2.tar.xz
mpfr-3.1.2-upstream_fixes-1.patch
gmp-6.0.0a.tar.xz
mpc-1.0.2.tar.gz
rpi-3.12.y.tar.gz
glibc-2.19.tar.xz
glibc-2.19-fhs-1.patch
tcl8.6.1-src.tar.gz
expect5.45.tar.gz
dejagnu-1.5.1.tar.gz
check-0.9.12.tar.gz
ncurses-5.9.tar.gz
bash-4.3.tar.gz
bash-4.3-upstream_fixes-1.patch
bzip2-1.0.6.tar.gz
bzip2-1.0.6-install_docs-1.patch
coreutils-8.22.tar.xz
coreutils-8.22-i18n-4.patch
coreutils-8.22-shuf_segfault-1.patch
diffutils-3.3.tar.xz
file-5.18.tar.gz
findutils-4.4.2.tar.gz
gawk-4.1.1.tar.xz
gettext-0.18.3.2.tar.gz
grep-2.18.tar.xz
gzip-1.6.tar.xz
m4-1.4.17.tar.xz
make-4.0.tar.bz2
patch-2.7.1.tar.xz
perl-5.18.2.tar.bz2
perl-5.18.2-libc-1.patch
sed-4.2.2.tar.bz2
tar-1.27.1.tar.xz
tar-1.27.1-manpage-1.patch
texinfo-5.2.tar.xz
util-linux-2.24.2.tar.xz
xz-5.0.5.tar.xz
"

for tarball in $LIST_OF_TARBALLS ; do
    if ! [[ -f $LFS/sources/$tarball ]] ; then
        echo "Can't find $LFS/sources/$tarball!"
        exit 1
    fi
done
}

function do_strip {
    set +o errexit
    if [[ $STRIP_AND_DELETE_DOCS = 1 ]] ; then
        strip --strip-debug /tools/lib/*
        /usr/bin/strip --strip-unneeded /tools/{,s}bin/*
        rm -rf /tools/{,share}/{info,man,doc}
    fi
}

function timer {
    if [[ $# -eq 0 ]]; then
        echo $(date '+%s')
    else
        local stime=$1
        etime=$(date '+%s')
        if [[ -z "$stime" ]]; then stime=$etime; fi
        dt=$((etime - stime))
        ds=$((dt % 60))
        dm=$(((dt / 60) % 60))
        dh=$((dt / 3600))
        printf '%02d:%02d:%02d' $dh $dm $ds
    fi
}

prebuild_sanity_check
check_tarballs

echo -e "\nThis is your last chance to quit before we start building... continue?"
echo "(Note that if anything goes wrong during the build, the script will abort mission)"

while true; do
    read -p "continue? " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) "Please answer yes ou no."
    esac
done


total_time=$(timer)
local_time=$(timer)


echo "# 5.20. File-5.18" >> log.txt
tar -zxf file-5.18.tar.gz
cd file-5.18
./configure --prefix=/tools
make
make install
cd $LFS/sources
rm -rf file-5.18


printf 'local script time: %s\n\n' $(timer $local_time) >> log.txt
local_time=$(timer)


echo "# 5.21. Findutils-4.4.2" >> log.txt
tar -zxf findutils-4.4.2.tar.gz
cd findutils-4.4.2
./configure --prefix=/tools
make
make install
cd $LFS/sources
rm -rf findutils-4.4.2


printf 'local script time: %s\n\n' $(timer $local_time) >> log.txt
local_time=$(timer)


echo "# 5.22. Gawk-4.1.1" >> log.txt
tar -Jxf gawk-4.1.1.tar.xz
cd gawk-4.1.1
./configure --prefix=/tools
make
make install
cd $LFS/sources
rm -rf gawk-4.1.1


printf 'local script time: %s\n\n' $(timer $local_time) >> log.txt
local_time=$(timer)


echo "# 5.23. Gettext-0.18.3.2" >> log.txt
tar -zxf gettext-0.18.3.2.tar.gz
cd gettext-0.18.3.2
cd gettext-tools
EMACS="no" ./configure --prefix=/tools --disable-shared
make -C gnulib-lib
make -C src msgfmt
make -C src msgmerge
make -C src xgettext
cp -v src/{msgfmt,msgmerge,xgettext} /tools/bin
cd $LFS/sources
rm -rf gettext-0.18.3.2


printf 'local script time: %s\n\n' $(timer $local_time) >> log.txt
local_time=$(timer)


echo "# 5.24. Grep-2.18" >> log.txt
tar -Jxf grep-2.18.tar.xz
cd grep-2.18
./configure --prefix=/tools
make
make install
cd $LFS/sources
rm -rf grep-2.18


printf 'local script time: %s\n\n' $(timer $local_time) >> log.txt
local_time=$(timer)


echo "# 5.25. Gzip-1.6" >> log.txt
tar -Jxf gzip-1.6.tar.xz
cd gzip-1.6
./configure --prefix=/tools
make
make install
cd $LFS/sources
rm -rf gzip-1.6


printf 'local script time: %s\n\n' $(timer $local_time) >> log.txt
local_time=$(timer)


echo "# 5.26. M4-1.4.17" >> log.txt
tar -Jxf m4-1.4.17.tar.xz
cd m4-1.4.17
./configure --prefix=/tools
make
make install
cd $LFS/sources
rm -rf m4-1.4.17


printf 'local script time: %s\n\n' $(timer $local_time) >> log.txt
local_time=$(timer)


echo "# 5.27. Make-4.0" >> log.txt
tar -jxf make-4.0.tar.bz2
cd make-4.0
./configure --prefix=/tools --without-guile
make
make install
cd $LFS/sources
rm -rf make-4.0


printf 'local script time: %s\n\n' $(timer $local_time) >> log.txt
local_time=$(timer)


echo "# 5.28. Patch-2.7.1" >> log.txt
tar -Jxf patch-2.7.1.tar.xz
cd patch-2.7.1
./configure --prefix=/tools
make
make install
cd $LFS/sources
rm -rf patch-2.7.1


printf 'local script time: %s\n\n' $(timer $local_time) >> log.txt
local_time=$(timer)


echo "# 5.29. Perl-5.18.2" >> log.txt
tar -jxf perl-5.18.2.tar.bz2
cd perl-5.18.2
patch -Np1 -i ../perl-5.18.2-libc-1.patch
sh Configure -des -Dprefix=/tools
make
cp -v perl cpan/podlators/pod2man /tools/bin
mkdir -pv /tools/lib/perl5/5.18.2
cp -Rv lib/* /tools/lib/perl5/5.18.2
cd $LFS/sources
rm -rf perl-5.18.2


printf 'local script time: %s\n\n' $(timer $local_time) >> log.txt
local_time=$(timer)


echo "# 5.30. Sed-4.2.2" >> log.txt
tar -jxf sed-4.2.2.tar.bz2
cd sed-4.2.2
./configure --prefix=/tools
make
make install
cd $LFS/sources
rm -rf sed-4.2.2


printf 'local script time: %s\n\n' $(timer $local_time) >> log.txt
local_time=$(timer)


echo "# 5.31. Tar-1.27.1" >> log.txt
tar -Jxf tar-1.27.1.tar.xz
cd tar-1.27.1
./configure --prefix=/tools
make
make install
cd $LFS/sources
rm -rf tar-1.27.1


printf 'local script time: %s\n\n' $(timer $local_time) >> log.txt
local_time=$(timer)


echo "# 5.32. Texinfo-5.2" >> log.txt
tar -Jxf texinfo-5.2.tar.xz
cd texinfo-5.2
./configure --prefix=/tools
make
make install
cd $LFS/sources
rm -rf texinfo-5.2


printf 'local script time: %s\n\n' $(timer $local_time) >> log.txt
local_time=$(timer)


echo "# 5.33. Util-linux-2.24.2" >> log.txt
tar -Jxf util-linux-2.24.2.tar.xz
cd util-linux-2.24.2
./configure --prefix=/tools                \
            --disable-makeinstall-chown    \
            --without-systemdsystemunitdir \
            PKG_CONFIG=""
make
make install
cd $LFS/sources
rm -rf util-linux-2.24.2


printf 'local script time: %s\n\n' $(timer $local_time) >> log.txt
local_time=$(timer)


echo "# 5.34. Xz-5.0.5" >> log.txt
tar -Jxf xz-5.0.5.tar.xz
cd xz-5.0.5
./configure --prefix=/tools
make
make install
cd $LFS/sources
rm -rf xz-5.0.5


printf 'local script time: %s\n\n' $(timer $local_time) >> log.txt


do_strip

echo -e "----------------------------------------------------"
echo -e "\nYou made it! This is the end of chapter 5!"
printf 'Total script time: %s\n' $(timer $total_time)
echo -e "Now continue reading from \"5.36. Changing Ownership\""
