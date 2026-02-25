# snowflake_aws_s3_storage_integration
Snowflake external stage integration with AWS S3 using secure IAM role authentication.

# Project Overview
This project demonstrates how to securely connect Snowflake to AWS S3 using Storage Integration (without AWS access keys) and query a CSV file directly from external storage without loading data into a Snowflake table. I wanted to implement a production-style architecture that avoids storing AWS access keys and instead uses secure Storage Integration.

# The dataset used:
5k-Sales-Records.csv

# This project showcases:
Secure Snowflake ↔ AWS IAM Role integration

External stage configuration

File format creation

Querying structured data directly from S3

Using positional column references ($1, $2...)

Production-safe architecture (no hardcoded credentials)

# Technologies Used
Snowflake

AWS S3

AWS IAM

SQL

External Stages

File Formats

# Architecture


<img width="296" height="284" alt="image" src="https://github.com/user-attachments/assets/71ef294b-f772-4520-a7a7-3aa056e12158" />

Snowflake
→ Storage Integration
→ AWS IAM Role (AssumeRole with External ID)
→ Amazon S3 Bucket

This setup ensures:

No AWS access keys stored in Snowflake

Secure IAM role-based authentication

Controlled S3 access

Cloud-native data engineering setup


# Challenges

While working on this project, I faced some practical challenges that helped me understand the integration process more deeply.

One key issue was related to STORAGE_AWS_EXTERNAL_ID. I initially used CREATE OR REPLACE STORAGE INTEGRATION, which kept generating a new External ID. This broke the AWS IAM trust relationship, causing access failures. I learned that once the trust policy is configured, the integration should not be recreated unless necessary.

# Learning

Overall, this project helped me gain hands-on experience and learning with:
External stage files do not have schema metadata.

Columns must be referenced using positional notation ($1, $2...).

Table aliasing (t.$1) is best practice for scalable queries.

CREATE OR REPLACE STORAGE INTEGRATION regenerates the external ID.

IAM Role-based access is more secure than access keys.

Snowflake reads data directly from S3 at query time.


