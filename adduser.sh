#!/bin/bash

__create_user() {
# Create a user to SSH into as.
echo 'root:c0n5u7t33r' | chpasswd
useradd user
SSH_USERPASS=consulteer
echo -e "$SSH_USERPASS\n$SSH_USERPASS" | (passwd --stdin user)
echo ssh user consulteer: $SSH_USERPASS
usermod -aG wheel user
}
# Call all functions
__create_user
