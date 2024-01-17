# jdoodle-task
This repositiory contains solution for jdoodle task: Senior Devops Engineer

Problem Statement: Create an AWS autoscaling group based on the load average of the instances (note - it is load average, not CPU utilization). Deliverable is a terraform code, which does the following:
 
1. Create an autoscaling group in AWS with min 2 and max five instances.
2. When the 5 mins load average of the machines reaches 75%, add a new instance.
3. When the 5-minute load average of the machines reaches 50%, remove a machine.
4. Everyday at UTC 12am, refresh all the machines in the group (remove all the old machines and add new machines).
5. Sends email alerts on the scaling and refresh events.
 
Use any EC2 instance with Ubuntu.

Approach/Solution: To solve the above problem we created multiple layers of aws resources which when combine
make the above solution. These layers are as Networking, ALB, ASG, Cloudwatch Alarms, Rules, SNS topic
and Lambda function.

Here is directory Structure Snippet:
![alt text](https://github.com/Sumit-95/jdoodle-task/blob/DEV/jdoodle-screenshots/directory_structure.png)

** Terraform Initialization: **
![alt text](https://github.com/Sumit-95/jdoodle-task/blob/DEV/jdoodle-screenshots/terrafrom-init.png)
![alt text](https://github.com/Sumit-95/jdoodle-task/blob/DEV/jdoodle-screenshots/directory_structure.png)

** Terraform Format and Validate the configurations: **
![alt text](https://github.com/Sumit-95/jdoodle-task/blob/DEV/jdoodle-screenshots/terraform-fmt-validate.png)

** Terraform plan: **
![alt text](https://github.com/Sumit-95/jdoodle-task/blob/DEV/jdoodle-screenshots/terraform-plan-1.png)
![alt text](https://github.com/Sumit-95/jdoodle-task/blob/DEV/jdoodle-screenshots/terraform-plan-2.png)

** 1. Networking Layer: **
![alt text](https://github.com/Sumit-95/jdoodle-task/blob/DEV/jdoodle-screenshots/network.png)

** 2. Launch Template and ASG Layer: **
![alt text](https://github.com/Sumit-95/jdoodle-task/blob/DEV/jdoodle-screenshots/launch-template.png)
![alt text](https://github.com/Sumit-95/jdoodle-task/blob/DEV/jdoodle-screenshots/asg.png)

** 3. ALB and TG: **
![alt text](https://github.com/Sumit-95/jdoodle-task/blob/DEV/jdoodle-screenshots/alb-1.png)
![alt text](https://github.com/Sumit-95/jdoodle-task/blob/DEV/jdoodle-screenshots/alb-2.png)
![alt text](https://github.com/Sumit-95/jdoodle-task/blob/DEV/jdoodle-screenshots/tg-1.png)
![alt text](https://github.com/Sumit-95/jdoodle-task/blob/DEV/jdoodle-screenshots/tg-2-1.png)

** 4. Scaling Policy: **
![alt text](https://github.com/Sumit-95/jdoodle-task/blob/DEV/jdoodle-screenshots/scaling-policies.png)
![alt text](https://github.com/Sumit-95/jdoodle-task/blob/DEV/jdoodle-screenshots/notification-email-scale-down.png)

** 4. Cloudwatch Alarm and Rule: **
![alt text](https://github.com/Sumit-95/jdoodle-task/blob/DEV/jdoodle-screenshots/alarm-1.png)
![alt text](https://github.com/Sumit-95/jdoodle-task/blob/DEV/jdoodle-screenshots/daily-refresh-1.png)
![alt text](https://github.com/Sumit-95/jdoodle-task/blob/DEV/jdoodle-screenshots/daily-refresh-2.png)
![alt text](https://github.com/Sumit-95/jdoodle-task/blob/DEV/jdoodle-screenshots/daily-refresh-3.png)

** 5. Notification: **
![alt text](https://github.com/Sumit-95/jdoodle-task/blob/DEV/jdoodle-screenshots/notification-1.png)
![alt text](https://github.com/Sumit-95/jdoodle-task/blob/DEV/jdoodle-screenshots/notification-2.png)
![alt text](https://github.com/Sumit-95/jdoodle-task/blob/DEV/jdoodle-screenshots/notification-email-scale-down.png)
