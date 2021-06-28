#!/bin/bash
sudo yum install ruby -y
wget https://aws-codedeploy-us-east-1.s3.amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto
sudo chconfig codedeploy-agent on
sudo yum install java-1.8.0-openjdk -y
