#!/usr/bin/env bash

sudo apt-get update
sudo apt-get install -y git nodejs

# Prevent some error messages, make /tmp writable
# see http://stackoverflow.com/questions/23822491/ruby-on-rails-permission-denied-when-using-rails-generate-controller-welcome
sudo chmod -R 1777 /tmp

# Fix a permission issue with leopard/rwtrusty vagrant box:
sudo -u postgres dropdb vagrant
sudo -u postgres dropuser vagrant
sudo -u postgres createuser --superuser vagrant

# Now cd into /vagrant/invoicerio and install all dependencies:
cd /vagrant
bundle install