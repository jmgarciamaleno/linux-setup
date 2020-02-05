#!/bin/bash

# Install Git & Ansible.
sudo apt update
sudo apt install -y software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install -y git ansible && \
sudo sed -ir 's/^#nocows = 1/nocows = 1/' /etc/ansible/ansible.cfg

# Pull and run the linux-setup project.
sudo ansible-pull \
    -U https://github.com/jmgarciamaleno/linux-setup.git \
    --accept-host-key \
    -d ~/.ansible/`date +%s` \
    --purge \
    -i localhost, \
    main.yml && \
echo "It has been done ( ͡° ͜ʖ ͡°)"
