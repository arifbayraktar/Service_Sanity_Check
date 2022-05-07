#!/bin/bash

while true;

   do

       ps aux | grep -n apache | grep -v grep

       checkApacheService=$(echo $?)

       if [ $checkApacheService -eq 0 ]; then

            echo "Pid: [$$] , $(date) Apache service up" >> /root/sanity_check.log

       else
            echo "Pid: [$$] , $(date) Apache service down, starting Apache" >> /root/sanity_check_error.log

            service apache2 start 
       fi 

       sleep 60

   done
