  --CREATE DATABASE db_Chrun

 select * from stg_Churn


-- Data exploration and analysis

-- 1. Total number of records in the dataset
select Count(*) as TotalRecords from stg_Churn

 --2.  finding distribution of gender

select Gender, Count(Gender) as TotalCount,
Count(Gender)*100.0/(select Count(*) from stg_Churn) as Percentage
from stg_Churn
group by Gender

--3. contract distribution and percentage

select Contract, Count(Contract) as TotalContract,
Count(Contract)*100.0/(select Count(*) from stg_Churn) as Percentage
from stg_Churn
group by Contract


--4.  revenue and contract distribution based on customer status and contract type

select Customer_Status, 
Contract,
Count(Contract) as TotalContract,
round(Count(Customer_Status)*100.0/(select Count(*) from stg_Churn), 2) as Customer_Status_Percentage,
Sum(Total_Revenue) as TotalRev, 
Round(Sum(Total_Revenue)*100.0/(select Sum(Total_Revenue) from stg_Churn), 2) as RevPercentage
from stg_Churn
group by Customer_Status, Contract


--5.  State disribution
SELECT State, Count(State) as TotalCount,
CAST(ROUND(Count(State) * 100.0 / (SELECT Count(*) FROM stg_Churn), 2) AS DECIMAL(10,2)) as Percentage
FROM stg_Churn
GROUP BY State
ORDER BY Percentage DESC


-- 6. Churn Rate
SELECT Customer_Status, COUNT(*) AS TotalCount,
       ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM stg_Churn), 2) AS Percentage
FROM stg_Churn
GROUP BY Customer_Status;

-- 7. Average Tenure by Churn Status
SELECT Customer_Status, SUM(Total_Revenue) AS TotalRevenue,
       ROUND(SUM(Total_Revenue) * 100.0 / (SELECT SUM(Total_Revenue) FROM stg_Churn), 2) AS RevenuePercentage
FROM stg_Churn
GROUP BY Customer_Status;


--8. distinct internet type
SELECT DISTINCT Internet_Type
FROM stg_Churn;

--9. Average Revenue by Internet Type
SELECT Internet_Type, 
       AVG(Total_Revenue) AS AverageRevenue,
       ROUND(AVG(Total_Revenue) * 100.0 / (SELECT AVG(Total_Revenue) FROM stg_Churn), 2) AS RevenuePercentage
FROM stg_Churn
GROUP BY Internet_Type;

--10. Count of Internet Types
select Internet_Type,
       COUNT(Internet_Type) AS TotalCount
       from stg_Churn
GROUP BY Internet_Type

--10 customer status and internet type distribution
select Customer_Status, 
       Internet_Type,
       COUNT(Internet_Type) AS TotalCount,
       ROUND(COUNT(Internet_Type) * 100.0 / (SELECT COUNT(*) FROM stg_Churn), 2) AS Percentage
from stg_Churn
where customer_status = 'Churned'
GROUP BY Customer_Status, Internet_Type;


-- checking for null values  for all the columns in the dataset

SELECT
SUM(CASE WHEN Customer_ID IS NULL THEN 1 ELSE 0 END) AS Customer_ID_Null,
SUM(CASE WHEN Gender IS NULL THEN 1 ELSE 0 END) AS Gender_Null,
SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS Age_Null,
SUM(CASE WHEN Married IS NULL THEN 1 ELSE 0 END) AS Married_Null,
SUM(CASE WHEN State IS NULL THEN 1 ELSE 0 END) AS State_Null,
SUM(CASE WHEN Number_of_Referrals IS NULL THEN 1 ELSE 0 END) AS Number_of_Referrals_Null,
SUM(CASE WHEN Tenure_in_Months IS NULL THEN 1 ELSE 0 END) AS Tenure_in_Months_Null,
SUM(CASE WHEN Value_Deal IS NULL THEN 1 ELSE 0 END) AS Value_Deal_Null,
SUM(CASE WHEN Phone_Service IS NULL THEN 1 ELSE 0 END) AS Phone_Service_Null,
SUM(CASE WHEN Multiple_Lines IS NULL THEN 1 ELSE 0 END) AS Multiple_Lines_Null,
SUM(CASE WHEN Internet_Service IS NULL THEN 1 ELSE 0 END) AS Internet_Service_Null,
SUM(CASE WHEN Internet_Type IS NULL THEN 1 ELSE 0 END) AS Internet_Type_Null,
SUM(CASE WHEN Online_Security IS NULL THEN 1 ELSE 0 END) AS Online_Security_Null,
SUM(CASE WHEN Online_Backup IS NULL THEN 1 ELSE 0 END) AS Online_Backup_Null,
SUM(CASE WHEN Device_Protection_Plan IS NULL THEN 1 ELSE 0 END) AS Device_Protection_Plan_Null,
SUM(CASE WHEN Premium_Support IS NULL THEN 1 ELSE 0 END) AS Premium_Support_Null,
SUM(CASE WHEN Streaming_TV IS NULL THEN 1 ELSE 0 END) AS Streaming_TV_Null,
SUM(CASE WHEN Streaming_Movies IS NULL THEN 1 ELSE 0 END) AS Streaming_Movies_Null,
SUM(CASE WHEN Streaming_Music IS NULL THEN 1 ELSE 0 END) AS Streaming_Music_Null,
SUM(CASE WHEN Unlimited_Data IS NULL THEN 1 ELSE 0 END) AS Unlimited_Data_Null,
SUM(CASE WHEN Contract IS NULL THEN 1 ELSE 0 END) AS Contract_Null,
SUM(CASE WHEN Paperless_Billing IS NULL THEN 1 ELSE 0 END) AS Paperless_Billing_Null,
SUM(CASE WHEN Payment_Method IS NULL THEN 1 ELSE 0 END) AS Payment_Method_Null,
SUM(CASE WHEN Monthly_Charge IS NULL THEN 1 ELSE 0 END) AS Monthly_Charge_Null,
SUM(CASE WHEN Total_Charges IS NULL THEN 1 ELSE 0 END) AS Total_Charges_Null,
SUM(CASE WHEN Total_Refunds IS NULL THEN 1 ELSE 0 END) AS Total_Refunds_Null,
SUM(CASE WHEN Total_Extra_Data_Charges IS NULL THEN 1 ELSE 0 END) AS Total_Extra_Data_Charges_Null,
SUM(CASE WHEN Total_Long_Distance_Charges IS NULL THEN 1 ELSE 0 END) AS Total_Long_Distance_Charges_Null,
SUM(CASE WHEN Total_Revenue IS NULL THEN 1 ELSE 0 END) AS Total_Revenue_Null,
SUM(CASE WHEN Customer_Status IS NULL THEN 1 ELSE 0 END) AS Customer_Status_Null,
SUM(CASE WHEN Churn_Category IS NULL THEN 1 ELSE 0 END) AS Churn_Category_Null,
SUM(CASE WHEN Churn_Reason IS NULL THEN 1 ELSE 0 END) AS Churn_Reason_Null
FROM stg_Churn;