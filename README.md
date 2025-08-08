# Elevate-Shell-Scripting-Journey-into-Cloud-Computing 

## Mini Project - 5 Essential Skills to Elevate My Shell Scripting Journey into Cloud Computing 

## Objective 

The objective of this project is to advance in shell scripting skills while also integrating and utilising cloud services. By focusing on the five critical concepts, the aim is to elevate my capability to a level where I can confidently harness the power of both shell scripting and cloud computing. This combination is not just about learning command services; it's about understanding how to leverage these tools in unison to build, deploy, and manage scalable, efficient, and robust systems in the cloud. 

The five critical concepts of shell scripting include the following.

1. Functions 

2. Arrays 

3. Environment Variables

4. Command Line Arguments

5. Error Handling 

### Delivering the shell scripting based on a real-world requirement. 

## DataWise Solutions 
is a forward-thinking Data Science Consulting Company that specialises in deploying analytical and machine learning environments to support data-driven decision-making for its clients. Recognising the need for agility and efficiency in setting up such environments. DataWise has decided to streamline its deployment process on AWS, focusing on simplicity and automation. 

## Scenario: 

One of DataWise Solutions' Clients, a burgeoning e-commerce startup, is looking to harness the power of data science to analyse customer behaviour and enhance their shopping experience. The startup aims to deploy its data science workspace on AWS, utilising EC2 instances for computational tasks and S3 buckets for storing its vast datasets of customer interactions. 

## Specific Requirements: 

To meet the client's needs and ensure a practical learning experience, DataWise Solutions plans to develop a script that automates the setup of an EC2 instance and S3 buckets. This script should incorporate the five critical shell scripting concepts as previously identified: 

1. **Functions:** Implement custom functions to modularize tasks like creating EC2 instances, configuring S3 buckets, and verifying deployment statuses. 

2. **Arrays:** Use arrays to manage a list of resources created, ensuring easy tracking and manipulation.

3. **Environment Variables:** Leverage environment variables to store sensitive information like AWS credentials, region settings, and configuration parameters, enhancing script portability and security. 

4. **Command Line Arguments:** Accept command line arguments to customise the script’s behaviour, such as specifying the EC2 instance type or S3 bucket name, allowing for dynamic and flexible deployments.

5. **Error Handling:** Implement robust error handling mechanisms to catch and respond to AWS service exceptions, ensuring the script can recover gracefully from failures.

## Step-By-Step Guide to Implement the Project. 

## STEP 1: Prerequisites

Before we start scripting, let’s make sure your system is ready by checking for the following if installed with the commands on the terminal. 

![Checking the System Readiness](./img/01.%20Checking%20the%20System%20Readiness.png) 

## STEP 2: Create Project Directory 

`mkdir DataWise-Solutions-Deployment`

`cd DataWise-Solutions-Deployment` 

![Create Project Directory](./img/02.%20Create%20Project%20Directory.png)

## STEP 3: Create .env File for Environment Variables 

- Creating file named .env for the environment variables 

![Create a File](./img/03.%20Create%20a%20File%20.env.png)

- Write the following into .env (edit for your AWS settings):

- This file holds your AWS region, the Amazon Machine Image ID (AMI), Instance type and the name of your SSH Key Pair.

![AWS Configuration](./img/04.%20AWS%20Configuration.png) 

**Note-** Do not commit this file to GitHub if using real credentials. 

## STEP 4: Create the Shell Script

- Create a shell script file for the project.

- Give permission to the script and run 

![Create Script, Give Permission and Run](./img/05.%20Create%20Script,%20Give%20Permission%20and%20Run.png)

- The script that demonstrates all the projects requirements.

![DataWise Solution Script](./img/06.%20DataWise%20Solution%20Script.png) 

![DataWise Solution Script Cont](./img/07.%20DataWise%20Solution%20Script%20Cont.png) 

![DataWise Solution Script Cont](./img/08.%20DataWise%20Solution%20Script%20Cont.png) 

![DataWise Solution Script Cont](./img/09.%20DataWise%20Solution%20Script%20Cont.png) 

![DataWise Solution Script Cont](./img/10.%20DataWise%20Solution%20Script%20Cont.png) 

## STEP 6: Confirm the Resources Were Created 

- This will create EC2 instance and S3 buckets.

`./deploy-datawise-solutions.sh all datawise-ecom-data datawise-logs-bucket` 

- Successfully created the EC2 instance and S3 bucket. 

![Resources Created Successfully](./img/11.%20Resources%20Created%20Successfully.png) 

![EC2 Instance Created](./img/12.%20EC2%20Instance%20Created.png) 

![S3 Bucket Created](./img/13.%20S3%20Bucket%20Created.png)

## STEP 6: Confirm the Resources Were Created 

- The commands below to check if the resources are created on the terminal.

`aws ec2 describe-instances --region us-east-1` 

`aws s3 ls`

## Step 7 Clean Up (Optional)

You can terminate the EC2 instance and delete the buckets later using

`aws ec2 terminate-instances --instance-ids i-1234567890abcdef0`

`aws s3 rb s3://bucket-name --force` 

## Project Summary 

This mini project focuses on developing a modular shell script that automates the setup of a basic data science environment on AWS, leveraging EC2 instances for computation and S3 buckets for data storage. The script is designed to demonstrate five advanced shell scripting techniques: the use of functions for modular and reusable code, arrays for managing multiple AWS resources dynamically, environment variables for secure and flexible configuration, command-line arguments for user input without modifying the script, and robust error handling to ensure smooth execution. The script begins by parsing user-provided arguments such as instance type, bucket name, and AWS region. It then loads configuration settings and credentials from environment variables or a .env file. Using functions, the script provisions S3 buckets and EC2 instances, storing their identifiers in arrays for tracking. Each step includes validation to confirm successful resource creation and handles errors like missing AWS CLI tools, invalid credentials, or improper input with clear, user-friendly messages. The end result is a fully automated and customizable cloud-based environment suitable for data science workloads, deployable through a single command-line execution. 

## Project Conclusion 

This project successfully demonstrates how powerful and efficient shell scripting can be when integrated with AWS cloud services for real-world automation tasks. By combining key scripting concepts such as functions, arrays, environment variables, command-line arguments, and error handling the script achieves a high level of modularity, flexibility, and reliability. It enables users to quickly and securely provision a data science environment in the cloud with minimal manual intervention. The project not only simplifies infrastructure setup but also promotes best practices in scripting and cloud automation. Overall, it serves as a practical and scalable solution for automating AWS resource management and lays a strong foundation for more complex DevOps or cloud engineering tasks.