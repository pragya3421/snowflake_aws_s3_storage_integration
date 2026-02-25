# snowflake_aws_s3_storage_integration
Snowflake external stage integration with AWS S3 using secure IAM role authentication.

# Project Overview
This project demonstrates how to securely connect Snowflake to AWS S3 using Storage Integration (without AWS access keys) and query a CSV file directly from external storage without loading data into a Snowflake table. I wanted to implement a production-style architecture that avoids storing AWS access keys and instead uses secure Storage Integration.

# Technologies Used

Snowflake
AWS S3
AWS IAM
SQL
External Stages
File Formats
