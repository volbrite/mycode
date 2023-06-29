#!/bin/bash

### Cleanup old containers
sudo docker stop bender fry zoidberg farnsworth indy &> /dev/null
sudo docker rm bender fry zoidberg farnsworth indy &> /dev/null
sudo docker network rm ansible-net &> /dev/null
rm /tmp/labrunning &> /dev/null
echo -e "Containers Cleared!\n"
