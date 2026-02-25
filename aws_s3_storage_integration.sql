=======================================================================================================
--Snowflake + AWS S3 External Stage Storage Integration Project - Direct Query from External Stage (S3)
=======================================================================================================

--1 - Create Storage Integration (Secure IAM-Based Access)
----------------------------------------------------------

USE ROLE ACCOUNTADMIN;

CREATE STORAGE INTEGRATION my_s3_integration
TYPE = EXTERNAL_STAGE
STORAGE_PROVIDER = S3
ENABLED = TRUE
STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::257544353523:role/snowflake-s3-role'
STORAGE_ALLOWED_LOCATIONS = ('s3://pragya-training-feb-2026/');

--Verify integration

DESC STORAGE INTEGRATION my_s3_integration;



--2. Create External Stage (e.g., AWS S3) using Storage Integration
-------------------------------------------------------------------

CREATE OR REPLACE STAGE DEMO1.DEMO_SCHEMA.my_s3_stage
URL='s3://pragya-training-feb-2026/'
STORAGE_INTEGRATION = my_s3_integration;


--List Files in a Stage
LIST @my_s3_stage;



--3. Create File Format (If Not Created)
----------------------------------------

CREATE OR REPLACE FILE FORMAT DEMO1.DEMO_SCHEMA.csv_format
TYPE = CSV
FIELD_DELIMITER = ','
SKIP_HEADER = 1
FIELD_OPTIONALLY_ENCLOSED_BY = '"'
DATE_FORMAT = 'MM/DD/YYYY';


--4. Query Data Directly From S3 (No Table Created)
---------------------------------------------------

SELECT
    t.$1 AS REGION,
    t.$2 AS COUNTRY,
    t.$3 AS ITEM_TYPE,
    t.$4 AS SALES_CHANNEL,
    t.$5 AS ORDER_PRIORITY,
    t.$6 AS ORDER_DATE,
    t.$7 AS ORDER_ID,
    t.$8 AS SHIP_DATE,
    t.$9 AS UNITS_SOLD,
    t.$10 AS UNIT_PRICE,
    t.$11 AS UNIT_COST,
    t.$12 AS TOTAL_REVENUE,
    t.$13 AS TOTAL_COST,
    t.$14 AS TOTAL_PROFIT
FROM @DEMO1.DEMO_SCHEMA.my_s3_stage/sales/csv/5k-Sales-Records.csv
(FILE_FORMAT => demo1.demo_schema.csv_format) t
LIMIT 10;