#!/bin/bash

__create_user() {
# Create a user to SSH into as.
echo 'root:password' | chpasswd
useradd user
SSH_USERPASS=password
echo -e "$SSH_USERPASS\n$SSH_USERPASS" | (passwd --stdin user)
echo ssh user password: $SSH_USERPASS
usermod -aG sudo user
}
# Call all functions
__create_user
