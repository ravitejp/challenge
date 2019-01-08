## Challenge

**DevOps project to automate the deployment process of Scalable and Secure web application into AWS**

*Tools

- HashiCorp TERRAFORM
- AWS Cloud


****************************************WARNING*****************************************************************

This approaches creates AWS resources like (EC2,ASG,ELB,S3 Bucket) in AWS. You will be billed for the AWS resources accordingly.

****************************************************************************************************************

**_Challenge Scenario_**

For this project, please think about how you would architect a scalable and secure static web application in AWS or another IaaS provider.

Create and deploy a running instance of a web server using a configuration management tool of your choice. The web server should serve one page with the following content.

<html>

<head>

<title>Hello World</title>

</head>

<body>

<h1>Hello World!</h1>

</body>

</html>

Secure this application and host such that only appropriate ports are publicly exposed and any http requests are redirected to https. This should be automated using a configuration management tool of your choice and you should feel free to use a self-signed certificate for the web server.

Develop and apply automated tests to validate the correctness of theserver configuration.

Express everything in code and provide your code via a Git repository in GitHub.


---------------------------------------------------------------------------------------------------------------
### Implementation


1. Download the appropriate [Terraform](https://www.terraform.io/downloads.html) package for your OS and Arch.
2. Unzip the [Terraform](https://www.terraform.io/intro/getting-started/install.html) Zip archive.
3. Add terraform installed directory to the [PATH] (https://www.terraform.io/intro/getting-started/install.html) environment variable.
4. Run `terraform --version` to check the successfull installation of Terraform.
5. Add the AWS IAM AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY to the environment variable.
6. Download the GitHub Repository [Challenge](https://github.com/ravitejp/challenge) to your server.
7. cd into the directory webclusterha and run the `terraform plan` and `terraform apply` command to launch the scalable and secure web cluster over AWS.
8. Login into the [AWS Console](https://aws.amazon.com/) and the copy the AWS ELB endpoint (DNS Name) and run in the browser to test the website or test it with DNS Route53 Record set name.
9. Clean up all the AWS resources once done with the lab by running the command `terraform destroy` and type `yes` at the prompt.
```
terraform destroy
Do you really want to destroy?
  Terraform will delete all your managed infrastructure.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes
```

_Files_

- Main.tf -> Actual code to launch the web cluster
- Variabes.tf -> File holds the variables to reference in the Main.tf
- Userdatascript -> File holds the user data script, that's been referenced in the Main.tf
- output.tf -> Prints the ELB DNS name and ELB Zone Id




### Author
**RaviTeja** 
- Please share your suggestions and feedback @ *teja.pad@gmail.com*
- [GitHub URL](https://github.com/ravitejp)

