#!/usr/bin/env bash

set -e

VDO_VERSION=$1
TC_KERNEL_VERSION=4.19.10-tinycore64
KERNEL_SOURCES_PATH=/usr/src/linux-4.19.10

if [ "${VDO_VERSION}" = "" ]; then
   echo "Error: Must specify desired VDO version."
   exit 1
fi

git clone https://github.com/dm-vdo/vdo.git
cd vdo
git checkout ${VDO_VERSION} -b ${VDO_VERSION}

ls -la vdo-manager/vdomgmnt

make
cd ..

mkdir -p vdo-tcz/usr/local/bin
mkdir -p vdo-tcz/usr/local/lib/python3.6/site-packages/vdo/statistics
mkdir -p vdo-tcz/usr/local/lib/python3.6/site-packages/vdo/utils
mkdir -p vdo-tcz/usr/local/lib/python3.6/site-packages/vdo/vdomgmnt

cp vdo/vdo-manager/vdo vdo-tcz/usr/local/bin
cp vdo/vdo-manager/vdostats vdo-tcz/usr/local/bin
cp vdo/utils/vdo/user/vdodumpconfig vdo-tcz/usr/local/bin
cp vdo/utils/vdo/user/vdoforcerebuild vdo-tcz/usr/local/bin
cp vdo/utils/vdo/user/vdoformat vdo-tcz/usr/local/bin
cp vdo/utils/vdo/user/vdoprepareupgrade vdo-tcz/usr/local/bin
cp vdo/utils/vdo/user/vdoreadonly vdo-tcz/usr/local/bin

cp vdo/vdo-manager/statistics/Command.py vdo-tcz/usr/local/lib/python3.6/site-packages/vdo/statistics
cp vdo/vdo-manager/statistics/Field.py vdo-tcz/usr/local/lib/python3.6/site-packages/vdo/statistics
cp vdo/vdo-manager/statistics/KernelStatistics.py vdo-tcz/usr/local/lib/python3.6/site-packages/vdo/statistics
cp vdo/vdo-manager/statistics/LabeledValue.py vdo-tcz/usr/local/lib/python3.6/site-packages/vdo/statistics
cp vdo/vdo-manager/statistics/StatFormatter.py vdo-tcz/usr/local/lib/python3.6/site-packages/vdo/statistics
cp vdo/vdo-manager/statistics/StatStruct.py vdo-tcz/usr/local/lib/python3.6/site-packages/vdo/statistics
cp vdo/vdo-manager/statistics/VDOReleaseVersions.py vdo-tcz/usr/local/lib/python3.6/site-packages/vdo/statistics
cp vdo/vdo-manager/statistics/VDOStatistics.py vdo-tcz/usr/local/lib/python3.6/site-packages/vdo/statistics
cp vdo/vdo-manager/statistics/__init__.py vdo-tcz/usr/local/lib/python3.6/site-packages/vdo/statistics

cp vdo/vdo-manager/utils/Command.py vdo-tcz/usr/local/lib/python3.6/site-packages/vdo/utils
cp vdo/vdo-manager/utils/FileUtils.py vdo-tcz/usr/local/lib/python3.6/site-packages/vdo/utils
cp vdo/vdo-manager/utils/Timeout.py vdo-tcz/usr/local/lib/python3.6/site-packages/vdo/utils
cp vdo/vdo-manager/utils/Transaction.py vdo-tcz/usr/local/lib/python3.6/site-packages/vdo/utils
cp vdo/vdo-manager/utils/YAMLObject.py vdo-tcz/usr/local/lib/python3.6/site-packages/vdo/utils
cp vdo/vdo-manager/utils/__init__.py vdo-tcz/usr/local/lib/python3.6/site-packages/vdo/utils
       
cp vdo/vdo-manager/vdomgmnt/CommandLock.py vdo-tcz/usr/local/lib/python3.6/site-packages/vdo/vdomgmnt
cp vdo/vdo-manager/vdomgmnt/Configuration.py vdo-tcz/usr/local/lib/python3.6/site-packages/vdo/vdomgmnt
cp vdo/vdo-manager/vdomgmnt/Constants.py vdo-tcz/usr/local/lib/python3.6/site-packages/vdo/vdomgmnt
cp vdo/vdo-manager/vdomgmnt/Defaults.py vdo-tcz/usr/local/lib/python3.6/site-packages/vdo/vdomgmnt
cp vdo/vdo-manager/vdomgmnt/KernelModuleService.py vdo-tcz/usr/local/lib/python3.6/site-packages/vdo/vdomgmnt
cp vdo/vdo-manager/vdomgmnt/MgmntUtils.py vdo-tcz/usr/local/lib/python3.6/site-packages/vdo/vdomgmnt
cp vdo/vdo-manager/vdomgmnt/Service.py vdo-tcz/usr/local/lib/python3.6/site-packages/vdo/vdomgmnt
cp vdo/vdo-manager/vdomgmnt/SizeString.py vdo-tcz/usr/local/lib/python3.6/site-packages/vdo/vdomgmnt
cp vdo/vdo-manager/vdomgmnt/Utils.py vdo-tcz/usr/local/lib/python3.6/site-packages/vdo/vdomgmnt
cp vdo/vdo-manager/vdomgmnt/VDOService.py vdo-tcz/usr/local/lib/python3.6/site-packages/vdo/vdomgmnt
cp vdo/vdo-manager/vdomgmnt/VDOKernelModuleService.py vdo-tcz/usr/local/lib/python3.6/site-packages/vdo/vdomgmnt
cp vdo/vdo-manager/vdomgmnt/VDOOperation.py vdo-tcz/usr/local/lib/python3.6/site-packages/vdo/vdomgmnt
cp vdo/vdo-manager/vdomgmnt/ExitStatusMixins.py vdo-tcz/usr/local/lib/python3.6/site-packages/vdo/vdomgmnt
cp vdo/vdo-manager/vdomgmnt/VDOArgumentParser.py vdo-tcz/usr/local/lib/python3.6/site-packages/vdo/vdomgmnt
cp vdo/vdo-manager/vdomgmnt/__init__.py vdo-tcz/usr/local/lib/python3.6/site-packages/vdo/vdomgmnt

mksquashfs vdo-tcz vdo.tcz
