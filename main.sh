#! /bin/bash

DEBIAN_FRONTEND=noninteractive

# Clone Upstream
cd ananicy-rules
git clone https://github.com/CachyOS/ananicy-rules.git ./etc/ananicy.d

# Get build deps
apt-get build-dep ./ -y

# Build package
dh_make --createorig

# Build package
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
