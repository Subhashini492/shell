#!/bin/bash
# for peru in subbu sirisha sai charan venkatesh
# do 
#     echo "name : $peru"
# done

# for server in tomcat nginx httpd 
# do 
#  echo "package : $server"
# done

sudo apt update

for server in tomcat nginx httpd
do
echo "sudo apt install $server"
echo "sudo systemctl start  $server"
echo "sudo systemctl enable  $server"
echo "sudo systemctl restart  $server"
done