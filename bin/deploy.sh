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
else
    curl -s https://getcomposer.org/installer | php
fi

php composer.phar install --no-dev

# Set read and write
echo -e "\nGive Write Access"
echo "------------------------------"

chmod 775 $(find temp/ -type d)