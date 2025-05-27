-- DROP VIEW vw_ChurnData_Stayed;
-- DROP VIEW vw_ChurnData_Joined;

CREATE VIEW vw_ChurnData_Stayed AS
    SELECT * FROM prod_Churn WHERE Customer_Status in ('Churned', 'Stayed');

CREATE VIEW vw_ChurnData_Joined AS
    SELECT * FROM prod_Churn WHERE Customer_Status = 'Joined';


