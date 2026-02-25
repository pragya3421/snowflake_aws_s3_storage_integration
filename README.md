# snowflake_aws_s3_storage_integration
Snowflake external stage integration with AWS S3 using secure IAM role authentication.


The goal of this project was to securely connect Snowflake to AWS S3 using IAM role-based authentication and query a CSV file directly from external storage without loading the data into a Snowflake table. I wanted to implement a production-style architecture that avoids storing AWS access keys and instead uses secure Storage Integration.
