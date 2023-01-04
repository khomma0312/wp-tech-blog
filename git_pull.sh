#!/bin/bash
aws ssm get-parameter --name wp_tech_blog_SSH_KEY --query Parameter.Value --with-decryption --output text --region ap-northeast-1 > /home/ec2-user/.ssh/id_rsa

sudo chmod 400 /home/ec2-user/.ssh/id_rsa

git pull origin main

sudo rm /home/ec2-user/.ssh/id_rsa
