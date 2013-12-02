#!/bin/bash
#
# script to build website and push it to github

TMP_DIR=/tmp/jekyll_build
TMP_SRC_DIR=/tmp/dloureiro.github.io
GIT_URL=https\://github.com/dloureiro/dloureiro.github.io.git
JEKYLL_CMD=ejekyll

# signal handler
function cleanup
{
    rm -rf ${TMP_DIR}
    rm -rf ${TMP_SRC_DIR}
    exit 0
}

trap cleanup SIGHUP SIGINT SIGTERM

# verify number of arguments
if [ $# -gt 1 ]; then
    echo "$(tput setaf 1)Incorrect command usage. Usage : $0 <optional_commit_sha1>$(tput sgr0)"
    exit 1
fi

# first argument (if any) is the commit SHA1
if [ $# -eq 1 ]; then
    SHA1=$1
else
    SHA1="HEAD"
fi
echo "$(tput setaf 2)Going to publish commit ${SHA1}. Press any key to continue.$(tput sgr0)"
read

# create a tmp dir into which jekyll will build the html source
if [ -d "${TMP_DIR}" ]; then
    rm -rf ${TMP_DIR}
fi
mkdir ${TMP_DIR}

# get a clean copy of the repo(current directory) in /tmp
cp -r $PWD /tmp/ >&/dev/null
cd ${TMP_SRC_DIR}
git clean -fd >&/dev/null
git reset --hard $SHA1 >&/dev/null

# build website
${JEKYLL_CMD} build -d ${TMP_DIR}

# publish on github only if jekyll build was successful
if [ $? -eq 0 ]; then
    cd ${TMP_DIR}
    git init
    git add .
    publish_date=`date`
    git commit -m "updated site ${publish_date}"
    git remote set-url origin ${GIT_URL}
    git push origin master --force

    echo "$(tput setaf 2)Successfully built and published to github...$(tput sgr0)"
else
    echo "$(tput setaf 1)Jekyll build failed... not publishing to github$(tput sgr0)"
fi

# cleanup
cleanup