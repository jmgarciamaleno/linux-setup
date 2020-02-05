#!/bin/bash

echo -e "\nInstall Git & Ansible.\n"
sudo apt update
sudo apt install -y software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install -y git ansible && \
sudo sed -ir 's/^#nocows = 1/nocows = 1/' /etc/ansible/ansible.cfg

echo -e "\nPull and run the linux-setup project.\n"
sudo ansible-pull \
    -U https://github.com/jmgarciamaleno/linux-setup.git \
    --accept-host-key \
    -d ~/.ansible/`date +%s` \
    --purge \
    -i localhost, \
    main.yml && \

echo -e "\nIt has been done ( ͡° ͜ʖ ͡°)"
