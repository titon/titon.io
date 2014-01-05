#!/bin/bash

ROOT="/var/www/titon.io/public"
cd ${ROOT}

# Update the source code
echo -e "\nUpdate Git Source"
echo "------------------------------"

git reset --hard
git checkout master
git pull

# Download composer and run
echo -e "\nInstalling Composer Dependencies"
echo "------------------------------"

if [ -f "composer.phar" ];
then
    php composer.phar self-update
    php composer.phar update --no-dev
else
    rm -f composer.lock
    curl -s https://getcomposer.org/installer | php
    php composer.phar install --no-dev
fi

# Set read and write
echo -e "\nGive Write Access"
echo "------------------------------"

find temp/ -type d -print0 | xargs -0 -rn1 chmod 0775