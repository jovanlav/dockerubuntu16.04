# dockerubuntu16.04


 Ubuntu 16.04 docker image with ssh enabled,
 and add user to ubuntu 16.04 machine

 Make your WORK$DIR and add Dockerfile and adduser.sh script,

cd ~/WORK$DIR

docker build -t example-ubuntu-ssh .

docker container run --detach -P ubuntu-ssh  example-ubuntu-ssh


docker port ubuntu-ssh 22

output:
0.0.0.0:$Port

 Find your $IP
ifconig
ens18     
          inet addr:$IP 
          ...
          ...
          ...

 Connect to created container 


ssh $IP -p $Port


 Have fun ...
