#!/bin/bash

#Author: Amit
#Date: 5th Jan
#Version: V1
#This script will report AWS resource tracking
########################

set -x # help to run in debug mode

#list s3 bucket AWS
echo "print list of s3 bucket"
aws s3 ls > resourceInfo.txt

#list ec2 instance
echo "print ec2 instance" 
aws ec2 describe-instances resourceInfo.txt

#list lambda 
echo "listing lambda functions"
aws lambda list-functions >> resourceInfo.txt

#list IAM USERS
echo "printing IAM users"
aws iam list-users | jq '.Users[].UserId' >> resourceInfo.txt 
