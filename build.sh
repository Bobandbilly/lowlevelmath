#!/bin/bash

set -e

cd src
mkdir -pv ../dist/
gcc -shared -O3 -march=native -fPIC -o ../dist/lowleveladd.so lowleveladd.c
sudo cp -v ../dist/lowleveladd.so /usr/lib/lowleveladd-x86_64.so.6
sudo ln -s /usr/lib/lowleveladd-x86_64.so.6 /usr/lib/liblowleveladd.so
echo "/usr/lib" | sudo tee -a /etc/ld.so.conf.d/lowleveladd.conf
sudo ldconfig
sudo cp ../include/lowleveladd.h /usr/include/linux/lowleveladd.h
sudo bash -c 'echo -e "prefix=/usr\nexec_prefix=\${prefix}\nlibdir=\${exec_prefix}/lib\nincludedir=\${prefix}/include/linux\n\nName: lowleveladd\nDescription: Critical Linux Addition API\nVersion: 6.9.420\nCflags: -I\${includedir}\nLibs: -L\${libdir} -llowleveladd" > /usr/lib/pkgconfig/lowleveladd.pc'
sudo cp ../include/lowleveladd.h ../dist/
echo Done! Builded files located in /usr/include/, /lib and in dist/
exit 0
