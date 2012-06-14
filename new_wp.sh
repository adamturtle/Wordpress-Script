#! /bin/bash

# Define htdocs path
HTDOCS=/Applications/MAMP/htdocs

# Download to /Downloads
cd ~/Downloads

# Download Wordpress
curl -O http://wordpress.org/latest.zip

# Unzip it (and trash zip)
unzip latest.zip
rm latest.zip

# Rename folder to include date
mv wordpress/ wordpress_`eval date +%Y_%m_%d`

# Move it to htdocs
mv wordpress_`eval date +%Y_%m_%d` $HTDOCS/wordpress_`eval date +%Y_%m_%d`

# Change to htdocs directory
cd $HTDOCS

# Change to plugins directory
cd wordpress_`eval date +%Y_%m_%d`/wp-content/plugins/

# INSTALL PLUGINS
# Advanced Custom Fields
curl -O http://downloads.wordpress.org/plugin/advanced-custom-fields.zip
unzip advanced-custom-fields.zip
rm advanced-custom-fields.zip

# Remove default plugins
rm hello.php
rm -rf akismet

git clone git@github.com:adamturtle/Theme-Framework.git
rm -rf Theme-Framework/.git

curl -O http://downloads.wordpress.org/plugin/tantan-s3-cloudfront.zip
unzip tantan-s3-cloudfront
rm tantan-s3-cloudfront.zip

# Clone bones theme
cd ../themes/
git clone git@github.com:adamturtle/bones.git
rm -rf bones/.git
rm bones/.gitignore

# Create config file
cd ../../
rm wp-config-sample.php
cp ../_.scripts/wp-config.php wp-config.php
cp ../_.scripts/wp-config-local.php wp-config-local.php

# Init git 
git init
echo ".DS_Store
robots.txt
.sass-cache/
#config.rb
wp-config-local.php" > .gitignore

# Done!
echo All done!